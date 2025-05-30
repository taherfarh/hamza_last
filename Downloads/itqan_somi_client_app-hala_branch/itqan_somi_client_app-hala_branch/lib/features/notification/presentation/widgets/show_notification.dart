import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/core/common/constant/dimension.dart';
import 'package:client_app/features/notification/presentation/state/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/common/injection/injection.dart';
import '../../../../core/common/local_storage/hive_services.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../generated/assets.dart';

class ShowNotificationPage extends StatelessWidget {
  String id;

  ShowNotificationPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator.get<NotificationBloc>()..add(ShowNotification(id: id)),
      child: BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            height: ScreenSizeUtil.height(context) / 1.20,
            width: double.infinity,
            child: state.showNotification.isSuccess()
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "عنوان الإشعار",
                          style: CustomTextStyle.titleSmall(context,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(state.showNotification.model?.notification?.data
                                ?.message ??
                            "_"),
                        Divider(),
                        Text(
                          "ملاحظات الزبون",
                          style: CustomTextStyle.titleSmall(context,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(state.showNotification.model?.notification?.data
                                ?.data?.desc ??
                            "_"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "الضريبة",
                          style: CustomTextStyle.titleSmall(context,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(state.showNotification.model?.notification?.data
                                ?.data?.tax ??
                            "_"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "حالة الطلب",
                          style: CustomTextStyle.titleSmall(context,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        if (state.showNotification.model?.notification?.data
                                ?.data?.status ==
                            "canceled")
                          Text(
                            "ملغاة",
                            style: CustomTextStyle.titleSmall(context,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor),
                          ),
                        if (state.showNotification.model?.notification?.data
                                ?.data?.status ==
                            "pending")
                          Text(
                            "معلق",
                          ),
                        if (state.showNotification.model?.notification?.data
                                ?.data?.status ==
                            "accepted")
                          Text(
                            "مقبولة",
                          ),
                        if (state.showNotification.model?.notification?.data
                                ?.data?.status ==
                            "rejected")
                          Text(
                            "مرفوضة",
                          ),
                        if (state.showNotification.model?.notification?.data
                                ?.data?.status ==
                            "delivered")
                          Text(
                            "مسلمة",
                          ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "الإجمالي",
                          style: CustomTextStyle.titleSmall(context,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(state.showNotification.model?.notification?.data
                                ?.data?.totalPrice ??
                            "_"),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "هل تم الدفع",
                          style: CustomTextStyle.titleSmall(context,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(state.showNotification.model?.notification?.data
                                    ?.data?.paymentDone ==
                                "0"
                            ? "لا"
                            : "نعم" ?? "_"),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ElevatedButtonWidget(
                              width: ScreenSizeUtil.width(context),
                              onPressed: () {
                                if (getType().toString() == "client") {
                                  Navigator.of(context).pushNamed(
                                    Routes.bookingDetails,
                                    arguments: {
                                      "orderId": state.showNotification.model
                                          ?.notification?.data?.data?.id
                                    },
                                  );
                                }
                                if (getType().toString() ==
                                    "service_provider") {
                                  Navigator.of(context).pushNamed(
                                    Routes.orderServicesProviderPage,
                                    arguments: {
                                      "orderId": state.showNotification.model
                                          ?.notification?.data?.data?.id
                                    },
                                  );
                                }
                              },
                              text: "التفاصيل"),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }
}

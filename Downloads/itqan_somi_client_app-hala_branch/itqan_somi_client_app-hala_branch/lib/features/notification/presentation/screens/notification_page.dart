import 'package:client_app/core/common/widgets/app_bar_widget.dart';
import 'package:client_app/features/home/data/model/params/change_fcm_token_params.dart';
import 'package:client_app/features/notification/presentation/state/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/common/config/colors.dart';
import '../../../../core/common/config/styles.dart';
import '../../../../core/common/injection/injection.dart';
import '../../../../core/common/local_storage/hive_services.dart';
import '../../../../generated/assets.dart';
import '../widgets/notification_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    super.key,
  });

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator.get<NotificationBloc>()..add(AllNotification()),
      child: BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, state) {
          print("object");
          print(state);
          if (state.markAllAsRead.isSuccess()) {
            context.read<NotificationBloc>().add(AllNotification());
          }
          if (state.markAsRead.isSuccess()) {
            context.read<NotificationBloc>().add(AllNotification());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(context, "الإشعارات"),
            body: state.allNotification.isSuccess()
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          state.markAllAsRead.isLoading()
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 5,
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 28,
                                  ),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          offset: const Offset(0, 1),
                                        ),
                                      ],
                                      color: AppColors.grey,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Text(
                                    "قراءة الكل",
                                    style: CustomTextStyle.titleSmall(context)!
                                        .copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    context.read<NotificationBloc>().add(
                                          MarkAllAsRead(),
                                        );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 5,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 28,
                                    ),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 4,
                                            offset: const Offset(0, 1),
                                          ),
                                        ],
                                        color: AppColors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12))),
                                    child: Text(
                                      "قراءة الكل",
                                      style:
                                          CustomTextStyle.titleSmall(context)!
                                              .copyWith(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: NotificationItem(
                                  notificationState: state,
                                  index: index,
                                  id: state.allNotification.model?.notifications
                                          ?.data?[index].id ??
                                      ""),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 12,
                            );
                          },
                          itemCount: state.allNotification.model!.notifications!
                              .data!.length,
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Lottie.asset(
                      Assets.lottieTimer,
                      fit: BoxFit.fill,
                      repeat: true,
                      height: 150,
                    ),
                  ),
          );
        },
      ),
    );
  }
}

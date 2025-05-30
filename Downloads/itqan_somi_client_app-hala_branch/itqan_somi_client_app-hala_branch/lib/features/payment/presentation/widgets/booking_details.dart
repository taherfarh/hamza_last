import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/core/common/constant/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/common/helper/app_util.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../core/common/widgets/read_more_widget.dart';
import '../../../../core/common/widgets/show_adaptive_diologe.dart';
import '../../../../generated/assets.dart';
import '../bloc/payment_bloc.dart';

class BookingDetails extends StatelessWidget {
  int? id;

  BookingDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentBloc, PaymentState>(
      listener: (context, state) {
        if (state.cancelOrderStatus.isSuccess()) {
          showSnackBar(
            context: context,
            text: "تم إلغاء الطلبية بنجاح",
            icon: Icons.check_circle_outline,
            colors: Colors.green,
          );
          Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.rootPage, (Route<dynamic> route) => false);
        }
        if (state.cancelOrderStatus.isFail()) {
          showSnackBar(
            context: context,
            text: state.cancelOrderStatus.error.toString(),
            icon: Icons.cancel_outlined,
            colors: Colors.red,
          );
        }
      },
      builder: (context, state) {
        return state.showOrderStatus.isSuccess()
            ? Column(
                children: [
                  Image.asset(
                    Assets.pngQr,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    controller: ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        color: AppColors.scafold,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "الطلب",
                                  ),
                                  Text(
                                    state.showOrderStatus.model?.order?.id
                                            .toString() ??
                                        "_",
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "معلومات الطلبية:",
                                style: CustomTextStyle.titleSmall(context,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("اسم الخدمة"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                state.showOrderStatus.model?.order
                                        ?.orderItems?[index].service?.name ??
                                    "_",
                                style: CustomTextStyle.titleSmall(context,
                                    color: AppColors.grey),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // Text("وصف الخدمة"),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Text(
                              //   state.showOrderStatus.model?.order
                              //           ?.orderItems?[index].service?.desc ??
                              //       "_",
                              //   style: CustomTextStyle.titleSmall(context,
                              //       color: AppColors.grey),
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("اسم مزود الخدمة"),
                                  Text(
                                    state
                                            .showOrderStatus
                                            .model
                                            ?.order
                                            ?.orderItems?[index]
                                            .service
                                            ?.user
                                            ?.fullName ??
                                        "_",
                                    style: CustomTextStyle.titleSmall(context,
                                        color: AppColors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "التاريخ",
                                    style: CustomTextStyle.titleSmall(context,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor),
                                  ),
                                  Text(
                                    DateFormat('d MMMM y hh:mm a', 'ar').format(
                                            DateTime.parse(state
                                                        .showOrderStatus
                                                        .model
                                                        ?.order
                                                        ?.orderItems?[index]
                                                        .date ??
                                                    "_")
                                                .toLocal()) ??
                                        "_",
                                    style: CustomTextStyle.titleSmall(context,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "الموقع",
                                    style: CustomTextStyle.titleSmall(context,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor),
                                  ),
                                  Text(
                                    state.showOrderStatus.model?.order
                                            ?.orderItems?[index].location ??
                                        "_",
                                    style: CustomTextStyle.titleSmall(context,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount:
                        state.showOrderStatus.model?.order?.orderItems?.length,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "ملاحظة الزبون",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          state.showOrderStatus.model?.order?.desc ?? "_",
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Text(
                          "معلومات الدفع",
                          style: CustomTextStyle.titleSmall(context,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("السعر البدائي"),
                                Text(
                                  state.showOrderStatus.model?.order
                                          ?.beginPrice ??
                                      "_",
                                  style: CustomTextStyle.titleSmall(context,
                                      color: AppColors.grey),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("الضرايب"),
                                Text(
                                  state.showOrderStatus.model?.order?.tax ??
                                      "_",
                                  style: CustomTextStyle.titleSmall(context,
                                      color: AppColors.grey),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("الحسم"),
                                Text(
                                  state.showOrderStatus.model?.order
                                          ?.discountAmount ??
                                      "_",
                                  style: CustomTextStyle.titleSmall(context,
                                      color: AppColors.grey),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("السعر الإجمالي"),
                                Text(
                                  state.showOrderStatus.model?.order
                                          ?.totalPrice ??
                                      "_",
                                  style: CustomTextStyle.titleSmall(context,
                                      color: AppColors.grey),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "حالة الطلب",
                                  style: CustomTextStyle.titleSmall(context,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor),
                                ),
                                if (state
                                        .showOrderStatus.model?.order?.status ==
                                    "canceled")
                                  Text(
                                    "ملغاة",
                                    style: CustomTextStyle.titleSmall(context,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor),
                                  ),
                                if (state
                                        .showOrderStatus.model?.order?.status ==
                                    "pending")
                                  Text(
                                    "معلق",
                                    style: CustomTextStyle.titleSmall(context,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor),
                                  ),
                                if (state
                                        .showOrderStatus.model?.order?.status ==
                                    "accepted")
                                  Text(
                                    "مقبولة",
                                    style: CustomTextStyle.titleSmall(context,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor),
                                  ),
                                if (state
                                        .showOrderStatus.model?.order?.status ==
                                    "rejected")
                                  Text(
                                    "مرفوضة",
                                    style: CustomTextStyle.titleSmall(context,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor),
                                  ),
                                if (state
                                        .showOrderStatus.model?.order?.status ==
                                    "delivered")
                                  Text(
                                    "مسلمة",
                                    style: CustomTextStyle.titleSmall(context,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor),
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "حالة الدفع",
                                  style: CustomTextStyle.titleSmall(context,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor),
                                ),
                                Text(
                                  state.showOrderStatus.model?.order
                                              ?.paymentDone ==
                                          "0"
                                      ? "غير مدفوع"
                                      : "مدفوع" ?? "_",
                                  style: CustomTextStyle.titleSmall(context,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  if (state.showOrderStatus.model?.order?.paymentDone == "0")
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (state.showOrderStatus.model?.order?.status ==
                            "accepted")
                          ElevatedButtonWidget(
                            width: ScreenSizeUtil.width(context),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  Routes.paymentRegister,
                                  arguments: {
                                    "id": state.showOrderStatus.model?.order?.id
                                  });
                            },
                            text: "إكمال الدفع",
                            color: AppColors.orange,
                            textColor: AppColors.white,
                          ),
                        SizedBox(
                          width: 5,
                        ),
                        if (state.showOrderStatus.model?.order?.status != "rejected")
                        ElevatedButtonWidget(
                          width: ScreenSizeUtil.width(context),
                          onPressed: () {
                            if(state.showOrderStatus.model?.order?.status != "canceled") {
                              showAdaptiveAlertDialog(
                              context: context,
                              // title: AppLocalizations.of(context)!.translate('sign_out'),
                              actions: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 18,
                                      ),
                                      child: Text(
                                        "إلغاء",
                                        style: CustomTextStyle.titleMedium(
                                          context,
                                          color: AppColors.primaryColor,
                                        )!
                                            .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 2,
                                        right: 2,
                                        top: 2,
                                      ),
                                      alignment:
                                      AlignmentDirectional.center,
                                      child: Text(
                                        "هل أنت متأكد",
                                        style: CustomTextStyle.titleMedium(
                                          context,
                                          color: AppColors.black,
                                        )!
                                            .copyWith(
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 18.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          // height: 48.h,
                                          width: 80,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              surfaceTintColor:
                                              AppColors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                  5.0,
                                                ),
                                              ),
                                              shadowColor: AppColors.grey
                                                  .withOpacity(
                                                0.9,
                                              ),
                                              elevation: 3,
                                            ),
                                            child: Text(
                                              "لا",
                                              textAlign: TextAlign.center,
                                              style: CustomTextStyle
                                                  .titleSmall(
                                                context,
                                                color:
                                                AppColors.primaryColor,
                                                fontWeight: FontWeight.bold,
                                              )!
                                                  .copyWith(
                                                fontSize: 11,
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          // height: 48.h,
                                          width: 80,
                                          child: ElevatedButton(
                                              style:
                                              ElevatedButton.styleFrom(
                                                backgroundColor:
                                                AppColors.primaryColor,
                                                shadowColor: AppColors.grey
                                                    .withOpacity(
                                                  0.9,
                                                ),
                                                elevation: 3,
                                                shape:
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                    5.0,
                                                  ),
                                                ),
                                              ),
                                              child: Text(
                                                "نعم",
                                                textAlign: TextAlign.center,
                                                style: CustomTextStyle
                                                    .titleSmall(context,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold,
                                                    color: AppColors
                                                        .white)!
                                                    .copyWith(
                                                  fontSize: 11,
                                                ),
                                              ),
                                              onPressed: () {
                                                context.read<PaymentBloc>().add(
                                                  CancelOrder(id: id ?? 0),
                                                );
                                                Navigator.of(context).pop();

                                              }),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 18.0,
                                    ),
                                  ],
                                ),
                              ],
                            );
                            }

                          },
                          text: state.showOrderStatus.model?.order?.status ==
                                  "canceled"
                              ? "الطلبية ملغاة"
                              : "إلغاء الطلبية",
                          color: state.showOrderStatus.model?.order?.status ==
                                  "canceled"
                              ? Colors.red
                              : AppColors.orange,
                          textColor: AppColors.white,
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
            : Lottie.asset(
                Assets.lottieTimer,
                fit: BoxFit.fill,
                repeat: true,
                height: 150,
              );
      },
    );
  }
}

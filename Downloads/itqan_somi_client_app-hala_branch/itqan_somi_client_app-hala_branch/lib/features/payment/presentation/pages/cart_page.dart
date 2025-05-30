import 'package:client_app/core/common/routes/app_routes.dart';
import 'package:client_app/features/payment/data/model/params/create_order_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/common/config/colors.dart';
import '../../../../core/common/config/styles.dart';
import '../../../../core/common/constant/dimension.dart';
import '../../../../core/common/constant/strings.dart';
import '../../../../core/common/helper/app_util.dart';
import '../../../../core/common/injection/injection.dart';
import '../../../../core/common/widgets/app_bar_widget.dart';
import '../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../core/common/widgets/show_adaptive_diologe.dart';
import '../../../../core/common/widgets/text_field_widget.dart';
import '../../../../generated/assets.dart';
import '../bloc/payment_bloc.dart';
import '../widgets/show_cart_widget.dart';

class CartPage extends StatelessWidget {
  TextEditingController cupone = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<PaymentBloc>()..add(AllCarts()),
      child: BlocConsumer<PaymentBloc, PaymentState>(
        listener: (context, state) {
          print("ssssssssssss");
          print(state.createOrderStatus);
          if (state.deleteStatue.isSuccess()) {
            showSnackBar(
              context: context,
              text: "تم الحذف بنجاح",
              icon: Icons.check_circle_outline,
              colors: Colors.green,
            );
            Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.rootPage, (Route<dynamic> route) => false);
          }
          if (state.deleteStatue.isFail()) {
            Navigator.pop(context);
            showSnackBar(
              context: context,
              text: state.deleteStatue.error.toString(),
              icon: Icons.cancel,
              colors: Colors.red,
            );
          }
          if (state.createOrderStatus.isFail()) {
            Navigator.pop(context);
            showSnackBar(
              context: context,
              text: state.createOrderStatus.error.toString(),
              icon: Icons.cancel,
              colors: Colors.red,
            );
          }
          if (state.createOrderStatus.isSuccess()) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.rootPage, (Route<dynamic> route) => false);
            showSnackBar(
              context: context,
              text: "تم إنشاء الطلبية بنجاح",
              icon: Icons.check_circle_outline,
              colors: Colors.green,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(context, "السلة"),
            body: state.allCartStatue.isSuccess()
                ? state.allCartStatue.model!.carts!.data!.isEmpty
                    ? Center(child: Image.asset(Assets.pngImg))
                    : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "الخدمات",
                                style: CustomTextStyle.bodySmall(context,
                                    fontWeight: FontWeight.bold),
                              ),
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  print(state.allCartStatue.model?.carts?.data
                                      ?.length);
                                  return GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: AppColors.white,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom),
                                              child: ShowCartWidget(
                                                cartId: state
                                                        .allCartStatue
                                                        .model
                                                        ?.carts
                                                        ?.data?[index]
                                                        .id ??
                                                    0,
                                              ),
                                            );
                                          });
                                    },
                                    child: Card(
                                      color: AppColors.light_gray,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Card(
                                            child: state
                                                        .allCartStatue
                                                        .model
                                                        ?.carts
                                                        ?.data?[index]
                                                        .service
                                                        ?.image ==
                                                    null
                                                ? Image.network(
                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSscMQdSeh_fhd99Maw3ZS0xeNASHGS3Wuatg&s",
                                                    width: 50,
                                                    height: 50,
                                                  )
                                                : Image.network(
                                                    "${AppStrings.imageString}${state.allCartStatue.model?.carts?.data?[index].service?.image ?? "_"}",
                                                    width: 50,
                                                    height: 50,
                                                  ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                state
                                                        .allCartStatue
                                                        .model
                                                        ?.carts
                                                        ?.data?[index]
                                                        .service
                                                        ?.name ??
                                                    "_",
                                                style:
                                                    CustomTextStyle.titleSmall(
                                                        context,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: ScreenSizeUtil.width(
                                                        context) /
                                                    2,
                                                child: Text(
                                                  maxLines: 1,
                                                  state
                                                          .allCartStatue
                                                          .model
                                                          ?.carts
                                                          ?.data?[index]
                                                          .service
                                                          ?.desc ??
                                                      "_",
                                                  style: CustomTextStyle
                                                      .titleSmall(context,
                                                          color:
                                                              AppColors.grey),
                                                ),
                                              ),
                                              Text(
                                                maxLines: 1,
                                                "${state.allCartStatue.model?.carts?.data?[index].service?.price}رس ",
                                                style:
                                                    CustomTextStyle.titleSmall(
                                                        context,
                                                        color: AppColors.black),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              showAdaptiveAlertDialog(
                                                context: context,
                                                // title: AppLocalizations.of(context)!.translate('sign_out'),
                                                actions: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 18,
                                                        ),
                                                        child: Text(
                                                          "حذف من السلة",
                                                          style: CustomTextStyle
                                                                  .titleMedium(
                                                            context,
                                                            color: AppColors
                                                                .primaryColor,
                                                          )!
                                                              .copyWith(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 18,
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(
                                                          left: 2,
                                                          right: 2,
                                                          top: 2,
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional
                                                                .center,
                                                        child: Text(
                                                          "هل أنت متأكد",
                                                          style: CustomTextStyle
                                                                  .titleMedium(
                                                            context,
                                                            color:
                                                                AppColors.black,
                                                          )!
                                                              .copyWith(
                                                            fontSize: 15,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 18.0,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Container(
                                                            // height: 48.h,
                                                            width: 80,
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                surfaceTintColor:
                                                                    AppColors
                                                                        .white,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    5.0,
                                                                  ),
                                                                ),
                                                                shadowColor:
                                                                    AppColors
                                                                        .grey
                                                                        .withOpacity(
                                                                  0.9,
                                                                ),
                                                                elevation: 3,
                                                              ),
                                                              child: Text(
                                                                "لا",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: CustomTextStyle
                                                                        .titleSmall(
                                                                  context,
                                                                  color: AppColors
                                                                      .primaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                )!
                                                                    .copyWith(
                                                                  fontSize: 11,
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            // height: 48.h,
                                                            width: 80,
                                                            child:
                                                                ElevatedButton(
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor:
                                                                          AppColors
                                                                              .primaryColor,
                                                                      shadowColor: AppColors
                                                                          .grey
                                                                          .withOpacity(
                                                                        0.9,
                                                                      ),
                                                                      elevation:
                                                                          3,
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
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: CustomTextStyle.titleSmall(
                                                                              context,
                                                                              fontWeight: FontWeight.bold,
                                                                              color: AppColors.white)!
                                                                          .copyWith(
                                                                        fontSize:
                                                                            11,
                                                                      ),
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      context
                                                                          .read<
                                                                              PaymentBloc>()
                                                                          .add(
                                                                            DeleteCart(
                                                                              id: state.allCartStatue.model?.carts?.data?[index].id ?? 0,
                                                                            ),
                                                                          );
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
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: state
                                    .allCartStatue.model?.carts?.data?.length,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "الاجمالي",
                                    style: CustomTextStyle.titleSmall(context,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${state.allCartStatue.model?.totalPrice?.toString()} رس",
                                    style: CustomTextStyle.titleSmall(context,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              state.createOrderStatus.isLoading()
                                  ? Center(child: CircularProgressIndicator())
                                  : Container(
                                      width: double.infinity,
                                      child: ElevatedButtonWidget(
                                          width: ScreenSizeUtil.width(context),
                                          onPressed: () {
                                            showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    AppColors.white,
                                                context: context,
                                                builder: (BuildContext
                                                    buildContext) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(
                                                                context)
                                                            .viewInsets
                                                            .bottom),
                                                    child: SizedBox(
                                                      width: double.infinity,
                                                      height:
                                                          ScreenSizeUtil.height(
                                                                  context) /
                                                              1.20,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            TextFieldWidget(
                                                              label:
                                                                  'كوبون خصم',
                                                              controller:
                                                                  cupone,
                                                              hintText:
                                                                  'قم بكتابة كوبون الخصم',
                                                              icon: Icons
                                                                  .countertops,
                                                              obscureText:
                                                                  false,
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            TextFieldWidget(
                                                              maxLine: 3,
                                                              label: 'الوصف',
                                                              controller: desc,
                                                              obscureText:
                                                                  false,
                                                              hintText:
                                                                  'قم بكتابة الوصف',
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            ElevatedButtonWidget(
                                                              width: ScreenSizeUtil
                                                                  .width(
                                                                      context),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                context
                                                                    .read<
                                                                        PaymentBloc>()
                                                                    .add(
                                                                      CreateOrder(
                                                                        createOrderParams:
                                                                            CreateOrderParams(
                                                                          coupon:
                                                                              cupone.text,
                                                                          desc:
                                                                              desc.text,
                                                                        ),
                                                                      ),
                                                                    );
                                                              },
                                                              text:
                                                                  'إنشاء الطلبية',
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          text: "استمرار"),
                                    ),
                            ],
                          ),
                        ),
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

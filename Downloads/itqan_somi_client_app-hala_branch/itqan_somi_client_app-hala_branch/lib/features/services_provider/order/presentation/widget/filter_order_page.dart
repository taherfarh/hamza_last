import 'package:client_app/core/common/widgets/shimmer.dart';
import 'package:client_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/config/colors.dart';
import '../../../../../core/common/config/styles.dart';
import '../../../../../core/common/routes/app_routes.dart';
import '../state/dash_borard_bloc.dart';

class FilterOrderPage extends StatelessWidget {
  final String selectedFilter;

  const FilterOrderPage({super.key, required this.selectedFilter});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBorardBloc, DashBorardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.allOrderStatus.model!.orders!.data!.isNotEmpty? ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(Routes.orderServicesProviderPage, arguments: {
                  "orderId":
                  state.allOrderStatus.model?.orders?.data?[index].id
                });
              },
              child: Card(
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
                            state.allOrderStatus.model?.orders
                                ?.data?[index].id
                                .toString() ??
                                "_",
                          )
                        ],
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
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text("السعر البدائي"),
                              Text(
                                state.allOrderStatus.model?.orders
                                    ?.data?[index].beginPrice ??
                                    "_",
                                style: CustomTextStyle.titleSmall(
                                    context,
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
                              Text("الضرايب"),
                              Text(
                                state.allOrderStatus.model?.orders
                                    ?.data?[index].tax ??
                                    "_",
                                style: CustomTextStyle.titleSmall(
                                    context,
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
                              Text("الحسم"),
                              Text(
                                state
                                    .allOrderStatus
                                    .model
                                    ?.orders
                                    ?.data?[index]
                                    .discountAmount ??
                                    "_",
                                style: CustomTextStyle.titleSmall(
                                    context,
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
                              Text("السعر الإجمالي"),
                              Text(
                                state
                                    .allOrderStatus
                                    .model
                                    ?.orders
                                    ?.data?[index]
                                    .totalPrice ??
                                    "_",
                                style: CustomTextStyle.titleSmall(
                                    context,
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
                                "حالة الطلب",
                                style: CustomTextStyle.titleSmall(
                                    context,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor),
                              ),
                              if(state.allOrderStatus.model?.orders
                                  ?.data?[index].status=="canceled")
                              Text(
                                "ملغاة",
                                style: CustomTextStyle.titleSmall(
                                    context,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor),
                              ),
                              if(state.allOrderStatus.model?.orders
                                  ?.data?[index].status=="pending")
                                Text(
                                  "جارية",
                                  style: CustomTextStyle.titleSmall(
                                      context,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor),
                                ),
                              if(state.allOrderStatus.model?.orders
                                  ?.data?[index].status=="accepted")
                                Text(
                                  "مقبولة",
                                  style: CustomTextStyle.titleSmall(
                                      context,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor),
                                ),
                              if(state.allOrderStatus.model?.orders
                                  ?.data?[index].status=="rejected")
                                Text(
                                  "مرفوضة",
                                  style: CustomTextStyle.titleSmall(
                                      context,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor),
                                ),
                              if(state.allOrderStatus.model?.orders
                                  ?.data?[index].status=="delivered")
                                Text(
                                  "مسلمة",
                                  style: CustomTextStyle.titleSmall(
                                      context,
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
                                "حالة الدفع",
                                style: CustomTextStyle.titleSmall(
                                    context,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor),
                              ),
                              Text(
                                state.allOrderStatus.model?.orders
                                    ?.data?[index].paymentDone=="0"?"غير مدفوع":"مدفوع" ??
                                    "_",
                                style: CustomTextStyle.titleSmall(
                                    context,
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
              ),
            );
          },
          itemCount: state.allOrderStatus.model?.orders?.data?.length,
        ) : Image.asset(Assets.pngImg);
      },
    );
  }
}

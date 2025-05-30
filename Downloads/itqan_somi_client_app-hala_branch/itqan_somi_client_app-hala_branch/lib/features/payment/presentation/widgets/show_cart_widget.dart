import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/core/common/constant/dimension.dart';
import 'package:client_app/core/common/constant/strings.dart';
import 'package:client_app/core/common/widgets/elevated_button_widget.dart';
import 'package:client_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/common/config/colors.dart';
import '../../../../core/common/injection/injection.dart';
import '../bloc/payment_bloc.dart';

class ShowCartWidget extends StatefulWidget {
  const ShowCartWidget({super.key, required this.cartId});

  final int cartId;

  @override
  State<ShowCartWidget> createState() => _ShowCartWidgetState();
}

class _ShowCartWidgetState extends State<ShowCartWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<PaymentBloc>()
        ..add(
          ShowCart(id: widget.cartId),
        ),
      child: BlocConsumer<PaymentBloc, PaymentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return
          SizedBox(
            width: double.infinity,
            height: ScreenSizeUtil.height(context) / 1.20,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: state.showCartsStatue.isSuccess()? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Card(
                        child:
                            state.showCartsStatue.model?.cart?.service?.image ==
                                    null
                                ? Image.asset(Assets.pngPerson)
                                : Image.network(
                                    "${AppStrings.imageString}${state.showCartsStatue.model?.cart?.service?.image}",
                                    width: 50,
                                    height: 50,
                                  ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "الوصف",
                      style: CustomTextStyle.titleMedium(context,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      state.showCartsStatue.model?.cart?.service?.desc ?? "_",
                      style: CustomTextStyle.titleSmall(context,
                          color: AppColors.grey),
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "السعر",
                          style: CustomTextStyle.titleSmall(context,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${state.showCartsStatue.model?.cart?.service?.price}رس",
                          style: CustomTextStyle.titleSmall(context,
                              color: AppColors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "المدة",
                          style: CustomTextStyle.titleSmall(context,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${state.showCartsStatue.model?.cart?.service?.time}دقيقة" ??
                              "_",
                          style: CustomTextStyle.titleSmall(context,
                              color: AppColors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    GestureDetector(
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
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: ScreenSizeUtil.height(
                                        context) /
                                        1.20,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("الإضافات"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ListView.builder(
                                            physics:
                                            NeverScrollableScrollPhysics(),
                                            controller:
                                            ScrollController(
                                                keepScrollOffset:
                                                false),
                                            shrinkWrap: true,
                                            scrollDirection:
                                            Axis.vertical,
                                            itemBuilder:
                                                (BuildContext context,
                                                int index) {
                                              return Card(
                                                color: AppColors
                                                    .light_gray,
                                                child: ListTile(
                                                  leading: Card(
                                                    child: state.showCartsStatue.model?.cart?.additionCarts?[
                                                    index]
                                                        .addition
                                                        ?.image ==
                                                        null
                                                        ? Image.asset(
                                                        Assets
                                                            .pngPerson)
                                                        : Image
                                                        .network(
                                                      "${AppStrings.imageString}${state.showCartsStatue.model?.cart?.additionCarts?[
                                                      index]
                                                          .addition?.image}",
                                                      width: 50,
                                                      height:
                                                      50,
                                                    ),
                                                  ),
                                                  title: Text(
                                                    state.showCartsStatue.model?.cart?.additionCarts?[
                                                    index]
                                                        .addition
                                                        ?.title ??
                                                        "_",
                                                    style: CustomTextStyle
                                                        .titleSmall(
                                                        context,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  ),
                                                  subtitle: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                        state.showCartsStatue.model?.cart?.additionCarts?[index].addition
                                                            ?.desc ??
                                                            "_",
                                                        style: CustomTextStyle
                                                            .bodySmall(
                                                          context,
                                                          color:
                                                          AppColors
                                                              .grey,
                                                        )?.copyWith(
                                                            fontSize:
                                                            10),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "${state.showCartsStatue.model?.cart?.additionCarts?[
                                                        index]
                                                            .addition?.price} ريال سعودي ",
                                                        style: CustomTextStyle.bodySmall(
                                                            context,
                                                            color: AppColors
                                                                .black,
                                                            fontWeight: FontWeight
                                                                .bold)
                                                            ?.copyWith(
                                                            fontSize:
                                                            10),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            itemCount: state.showCartsStatue.model?.cart?.additionCarts?.length,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                            });
                      },
                      child: state.showCartsStatue.model!.cart!.additionCarts!.isEmpty
                          ? Text("لا يوجد إضافات", style: CustomTextStyle.titleSmall(
                          context,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),)
                          : Text(
                        "اضغط لعرض الإضافات"
                            " "
                            "(${state.showCartsStatue.model!.cart!.additionCarts!.length})",
                        style: CustomTextStyle.titleSmall(
                            context,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "اسم مقدم الخدمة",
                          style: CustomTextStyle.titleSmall(context,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${state.showCartsStatue.model?.cart?.service?.user?.fullName}" ??
                              "_",
                          style: CustomTextStyle.titleSmall(context,
                              color: AppColors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "التاريخ",
                          style: CustomTextStyle.titleSmall(context,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat('d MMMM y hh:mm a', 'ar').format(
                              DateTime.parse(state.showCartsStatue.model?.cart?.date ??
                                  "_")
                                  .toLocal()),
                          style: CustomTextStyle.titleSmall(context,
                              color: AppColors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الموقع",
                          style: CustomTextStyle.titleSmall(context,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(state.showCartsStatue.model?.cart?.address?.location ??"_",
                          style: CustomTextStyle.titleSmall(context,
                              color: AppColors.grey),
                        ),
                      ],
                    ),SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "المدينة",
                          style: CustomTextStyle.titleSmall(context,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(state.showCartsStatue.model?.cart?.address?.city ??"_",
                          style: CustomTextStyle.titleSmall(context,
                              color: AppColors.grey),
                        ),
                      ],
                    ),
                  ],
                ) : Center(child: CircularProgressIndicator()),
              ),
            ),
          ) ;
        },
      ),
    );
  }
}

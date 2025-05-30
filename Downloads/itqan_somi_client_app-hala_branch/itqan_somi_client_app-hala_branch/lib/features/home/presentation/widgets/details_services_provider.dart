import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/core/common/constant/dimension.dart';
import 'package:client_app/core/common/constant/strings.dart';
import 'package:client_app/core/common/widgets/elevated_button_widget.dart';
import 'package:client_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/config/colors.dart';
import '../../../../core/common/injection/injection.dart';
import '../bloc/home_bloc.dart';

class DetailsServicesProvider extends StatefulWidget {
  const DetailsServicesProvider({super.key, required this.id});

  final int id;

  @override
  State<DetailsServicesProvider> createState() =>
      _DetailsServicesProviderState();
}

class _DetailsServicesProviderState extends State<DetailsServicesProvider> {
  static String? selectedAddition;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator.get<HomeBloc>()..add(DetailsServices(widget.id)),
      child: SizedBox(
        width: double.infinity,
        height: ScreenSizeUtil.height(context) / 1.20,
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state.detailsServicesStatue.isSuccess()
                ? Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Card(
                              child: state.detailsServicesStatue.model?.service
                                          ?.image ==
                                      null
                                  ? Image.asset(Assets.pngPerson)
                                  : Image.network(
                                      "${AppStrings.imageString}${state.detailsServicesStatue.model?.service?.image}",
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
                            state.detailsServicesStatue.model?.service?.desc ??
                                "_",
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
                                "${state.detailsServicesStatue.model?.service?.price}رس",
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
                                "${state.detailsServicesStatue.model?.service?.time}دقيقة" ??
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
                          Text(
                            "الاضافات",
                            style: CustomTextStyle.titleSmall(context,
                                fontWeight: FontWeight.bold),
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            controller:
                                ScrollController(keepScrollOffset: false),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                color: AppColors.light_gray,
                                child: ListTile(
                                  leading: Card(
                                    child: state
                                                .detailsServicesStatue
                                                .model
                                                ?.service
                                                ?.additions?[index]
                                                .image ==
                                            null
                                        ? Image.asset(Assets.pngPerson)
                                        : Image.network(
                                            "${AppStrings.imageString}${state.detailsServicesStatue.model?.service?.additions?[index].image}",
                                            width: 50,
                                            height: 50,
                                          ),
                                  ),
                                  title: Text(
                                    state.detailsServicesStatue.model?.service
                                            ?.additions?[index].title ??
                                        "_",
                                    style: CustomTextStyle.titleSmall(context,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state
                                                .detailsServicesStatue
                                                .model
                                                ?.service
                                                ?.additions?[index]
                                                .desc ??
                                            "_",
                                        style: CustomTextStyle.bodySmall(
                                          context,
                                          color: AppColors.grey,
                                        )?.copyWith(fontSize: 10),
                                      ),
                                      Text(
                                        "${state.detailsServicesStatue.model?.service?.additions?[index].price} ريال سعودي ",
                                        style: CustomTextStyle.bodySmall(
                                          context,
                                          color: AppColors.grey,
                                        )?.copyWith(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  trailing: Radio<String>(
                                    value: "اسم الخدمة",
                                    // groupValue: selectedServicesProvider,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          selectedAddition = value!;
                                        },
                                      );
                                    },
                                    groupValue: 'اسم الخدمة',
                                  ),
                                ),
                              );
                            },
                            itemCount: state.detailsServicesStatue.model
                                ?.service?.additions?.length,
                          ),
                          // Center(
                          //   child: ElevatedButtonWidget(
                          //       width: ScreenSizeUtil.width(context),
                          //       onPressed: () {},
                          //       text: "اضف الي العربة"),
                          // ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

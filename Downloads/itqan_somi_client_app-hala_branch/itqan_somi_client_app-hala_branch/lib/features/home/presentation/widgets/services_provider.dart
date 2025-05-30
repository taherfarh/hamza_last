import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';
import '../../../../core/common/constant/dimension.dart';
import '../../../../core/common/constant/strings.dart';
import '../../../../core/common/injection/injection.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../core/common/widgets/app_bar_widget.dart';
import '../../../../generated/assets.dart';
import 'title_of_services.dart';
import 'details_services_provider.dart';

class ProfilePage extends StatelessWidget {
  String date = DateFormat('EEEE').format(DateTime.now());
  bool available = false;
  Set<String> workingDay = {};

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final id = args['idProvider'];
    return BlocProvider(
      create: (context) =>
          locator.get<HomeBloc>()..add(ServicesProviderDetails(id)),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.servicesProviderDetailsStatue.isSuccess()) {
            for (int i = 0;
                i <
                    state.servicesProviderDetailsStatue.model!.serviceProvider!
                        .workTimes!.length;
                i++) {
              workingDay.add(state.servicesProviderDetailsStatue.model
                      ?.serviceProvider?.workTimes?[i].day ??
                  "_");
              available = workingDay.any((workingDay) => date == workingDay);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(context, "مقدم الخدمة"),
            body: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: ScreenSizeUtil.height(context) / 1.60,
                  child: Container(
                    height: ScreenSizeUtil.height(context) / 4,
                    color: AppColors.primaryColor,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 10,
                  right: 10,
                  bottom: 50,
                  child: Card(
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: state.servicesProviderDetailsStatue.isSuccess()
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 60,
                                        backgroundImage: state
                                                    .servicesProviderDetailsStatue
                                                    .model
                                                    ?.serviceProvider
                                                    ?.image ==
                                                null
                                            ? AssetImage(Assets.pngPerson)
                                            : NetworkImage(
                                                "${AppStrings.imageString}${state.servicesProviderDetailsStatue.model?.serviceProvider?.image}"),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.primaryColor,
                                          ),
                                          width: 40,
                                          height: 30,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                state
                                                        .servicesProviderDetailsStatue
                                                        .model
                                                        ?.serviceProvider
                                                        ?.reviewAvg ??
                                                    "_",
                                                style:
                                                    CustomTextStyle.titleSmall(
                                                        context,
                                                        color: AppColors.white),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: AppColors.yellow,
                                                size: 10,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    state.servicesProviderDetailsStatue.model
                                            ?.serviceProvider?.fullName ??
                                        "_",
                                    style: CustomTextStyle.bodyMedium(context,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(state.servicesProviderDetailsStatue.model
                                          ?.serviceProvider?.specialize ??
                                      "_"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "تاريخ الإنضمام",
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    DateFormat('d MMMM y', 'ar').format(
                                        DateTime.parse(state
                                                    .servicesProviderDetailsStatue
                                                    .model
                                                    ?.serviceProvider
                                                    ?.phoneVerifiedAt ??
                                                "_")
                                            .toLocal()),
                                    style: CustomTextStyle.titleSmall(context,
                                        color: AppColors.grey),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "نبذة عني",
                                      style: CustomTextStyle.bodyMedium(context,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Text(
                                      state.servicesProviderDetailsStatue.model
                                              ?.serviceProvider?.aboutHim ??
                                          "_",
                                      style: CustomTextStyle.titleSmall(
                                        context,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  if (state.servicesProviderDetailsStatue.model!
                                      .serviceProvider!.skills!.isNotEmpty)
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        "المهارات",
                                        style: CustomTextStyle.bodyMedium(
                                            context,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GridView.count(
                                    padding: EdgeInsets.zero,
                                    crossAxisCount: 3,
                                    childAspectRatio:
                                        (ScreenSizeUtil.width(context) / 2) /
                                            (ScreenSizeUtil.height(context) /
                                                10),
                                    controller: ScrollController(
                                        keepScrollOffset: false),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: List<Widget>.generate(
                                      state
                                              .servicesProviderDetailsStatue
                                              .model
                                              ?.serviceProvider
                                              ?.skills
                                              ?.length ??
                                          0,
                                      (index) {
                                        return Container(
                                          margin: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            color: AppColors.primaryColor
                                                .withOpacity(0.2),
                                          ),
                                          child: Center(
                                            child: Text(
                                              state
                                                      .servicesProviderDetailsStatue
                                                      .model
                                                      ?.serviceProvider
                                                      ?.skills?[index]
                                                      .name ??
                                                  "_",
                                              style: CustomTextStyle.titleSmall(
                                                  context,
                                                  color:
                                                      AppColors.primaryColor),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[300]!),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          // First Row
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                    color: AppColors.grey),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Text('التوفر',
                                                    style: CustomTextStyle
                                                        .titleSmall(context,
                                                            color: AppColors
                                                                .primaryColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                SizedBox(height: 8),
                                                Text(
                                                  available
                                                      ? 'متوفر اليوم'
                                                      : "غير متوفر اليوم",
                                                  style: CustomTextStyle
                                                      .titleSmall(context,
                                                          color: available
                                                              ? AppColors.grey
                                                              : Colors.red),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              controller: ScrollController(
                                                  keepScrollOffset: false),
                                              shrinkWrap: true,
                                              padding: EdgeInsets.all(20),
                                              itemCount: state
                                                  .servicesProviderDetailsStatue
                                                  .model
                                                  ?.serviceProvider
                                                  ?.workTimes
                                                  ?.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    Text(
                                                        state
                                                                .servicesProviderDetailsStatue
                                                                .model
                                                                ?.serviceProvider
                                                                ?.workTimes?[
                                                                    index]
                                                                .day ??
                                                            "_",
                                                        style: CustomTextStyle
                                                            .titleSmall(context,
                                                                color: AppColors
                                                                    .primaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                    SizedBox(height: 8),
                                                    Text(
                                                        '${state.servicesProviderDetailsStatue.model?.serviceProvider?.workTimes?[index].startHour ?? "_"}صباحا   ${state.servicesProviderDetailsStatue.model?.serviceProvider?.workTimes?[index].endHour ?? "_"}مساءا',
                                                        style: CustomTextStyle
                                                            .titleSmall(context,
                                                                color: AppColors
                                                                    .grey)),
                                                  ],
                                                );
                                              }),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if(state
                                      .servicesProviderDetailsStatue
                                      .model!
                                      .serviceProvider!
                                      .services!.isNotEmpty)
                                  TitleOfServices(
                                    titleServices: "الخدمات المقدمة",
                                  ),
                                  if(state
                                      .servicesProviderDetailsStatue
                                      .model!
                                      .serviceProvider!
                                      .services!.isNotEmpty)
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GridView.count(
                                    padding: EdgeInsets.zero,
                                    crossAxisCount: 2,
                                    childAspectRatio:
                                        (ScreenSizeUtil.width(context) / 2) /
                                            (ScreenSizeUtil.height(context) /
                                                4),
                                    controller: ScrollController(
                                        keepScrollOffset: false),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: List<Widget>.generate(
                                      state
                                                  .servicesProviderDetailsStatue
                                                  .model!
                                                  .serviceProvider!
                                                  .services!
                                                  .length >
                                              4
                                          ? 4
                                          : state
                                                  .servicesProviderDetailsStatue
                                                  .model!
                                                  .serviceProvider!
                                                  .services!
                                                  .length ??
                                              0,
                                      (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                              Routes.detailsPage,
                                              arguments: {
                                                'id': state
                                                    .servicesProviderDetailsStatue
                                                    .model
                                                    ?.serviceProvider
                                                    ?.services?[index]
                                                    .id
                                              },
                                            );


                                            // showModalBottomSheet(
                                            //     isScrollControlled: true,
                                            //     backgroundColor:
                                            //         AppColors.white,
                                            //     context: context,
                                            //     builder:
                                            //         (BuildContext context) {
                                            //       return Padding(
                                            //         padding: EdgeInsets.only(
                                            //             bottom: MediaQuery.of(
                                            //                     context)
                                            //                 .viewInsets
                                            //                 .bottom),
                                            //         child:
                                            //             DetailsServicesProvider(
                                            //           id: state
                                            //                   .servicesProviderDetailsStatue
                                            //                   .model
                                            //                   ?.serviceProvider
                                            //                   ?.services?[index]
                                            //                   .id ??
                                            //               0,
                                            //         ),
                                            //       );
                                            //     });
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: state
                                                                .servicesProviderDetailsStatue
                                                                .model
                                                                ?.serviceProvider
                                                                ?.services?[
                                                                    index]
                                                                .image ==
                                                            null
                                                        ? AssetImage(
                                                            Assets.pngPerson)
                                                        : NetworkImage(
                                                            "${AppStrings.imageString}${state.servicesProviderDetailsStatue.model?.serviceProvider?.services?[index].image ?? "_" ?? "_"}",
                                                          ),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    15,
                                                  ),
                                                ),
                                                width: 200,
                                                height: 100,
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  state
                                                          .servicesProviderDetailsStatue
                                                          .model
                                                          ?.serviceProvider
                                                          ?.services?[index]
                                                          .name ??
                                                      "_",
                                                  style: CustomTextStyle
                                                      .titleMedium(context,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              AppColors.white),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

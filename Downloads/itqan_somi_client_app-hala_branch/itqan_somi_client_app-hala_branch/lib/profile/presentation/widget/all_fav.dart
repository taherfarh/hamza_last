import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/core/common/widgets/app_bar_widget.dart';
import 'package:client_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../core/common/constant/strings.dart';
import '../../../core/common/injection/injection.dart';
import '../../../core/common/routes/app_routes.dart';
import '../../../core/common/widgets/read_more_widget.dart';
import '../../../core/common/widgets/show_adaptive_diologe.dart';
import '../../../generated/assets.dart';
import '../state/profile_bloc.dart';

class AllFavScreen extends StatefulWidget {
  const AllFavScreen({super.key});

  @override
  State<AllFavScreen> createState() => _AllFavScreenState();
}

class _AllFavScreenState extends State<AllFavScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<HomeBloc>()
        ..add(
          AllFav(),
        ),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(context, "المفضلة"),
            body: state.allFavStatue.isSuccess()
                ? ListView.builder(
                    itemCount:
                        state.allFavStatue.model?.favorites?.data?.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            Routes.detailsPage,
                            arguments: {
                              'id': state.allFavStatue.model?.favorites
                                  ?.data?[index].service?.id
                            },
                          );
                        },
                        child: Card(
                          color: AppColors.scafold,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: 100,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              "${AppStrings.imageString}${state.allFavStatue.model?.favorites?.data?[index].service?.image ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKiXU1Oa_BmCKSHSMvqCqT3HCKxLzA3IotRw&s"}",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state
                                                    .allFavStatue
                                                    .model
                                                    ?.favorites
                                                    ?.data?[index]
                                                    .service
                                                    ?.name ??
                                                "_",
                                            style: CustomTextStyle.titleMedium(
                                                context,
                                                color: AppColors.primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          ReadMoreWidget(
                                            htmlText: state
                                                    .allFavStatue
                                                    .model
                                                    ?.favorites
                                                    ?.data?[index]
                                                    .service
                                                    ?.desc ??
                                                "_",
                                            maxLines: 3,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
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
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 18,
                                                  ),
                                                  child: Text(
                                                    "حذف من المفضلة",
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
                                                      AlignmentDirectional
                                                          .center,
                                                  child: Text(
                                                    "هل أنت متأكد",
                                                    style: CustomTextStyle
                                                            .titleMedium(
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
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    SizedBox(
                                                      // height: 48.h,
                                                      width: 80,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          surfaceTintColor:
                                                              AppColors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              5.0,
                                                            ),
                                                          ),
                                                          shadowColor: AppColors
                                                              .grey
                                                              .withOpacity(
                                                            0.9,
                                                          ),
                                                          elevation: 3,
                                                        ),
                                                        child: Text(
                                                          "لا",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: CustomTextStyle
                                                                  .titleSmall(
                                                            context,
                                                            color: AppColors
                                                                .primaryColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )!
                                                              .copyWith(
                                                            fontSize: 11,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      // height: 48.h,
                                                      width: 80,
                                                      child: ElevatedButton(
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
                                                          elevation: 3,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              5.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          "نعم",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: CustomTextStyle.titleSmall(
                                                                  context,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: AppColors
                                                                      .white)!
                                                              .copyWith(
                                                            fontSize: 11,
                                                          ),
                                                        ),
                                                        onPressed: () async {
                                                          Navigator.of(context)
                                                              .pop();
                                                          context
                                                              .read<HomeBloc>()
                                                              .add(
                                                                DeleteFav(state
                                                                        .allFavStatue
                                                                        .model
                                                                        ?.favorites
                                                                        ?.data?[
                                                                            index]
                                                                        .id ??
                                                                    0),
                                                              );

                                                          await Future.delayed(
                                                              Duration(
                                                                  milliseconds:
                                                                      300));
                                                          context
                                                              .read<HomeBloc>()
                                                              .add(AllFav());
                                                        },
                                                      ),
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
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      state
                                              .allFavStatue
                                              .model
                                              ?.favorites
                                              ?.data?[index]
                                              .service
                                              ?.reviewAvg ??
                                          "_",
                                      style: CustomTextStyle.titleSmall(context,
                                          color: AppColors.black),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: AppColors.yellow,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
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

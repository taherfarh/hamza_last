import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/core/common/local_storage/hive_services.dart';
import 'package:client_app/core/common/widgets/app_bar_widget.dart';
import 'package:client_app/core/common/widgets/elevated_button_widget.dart';
import 'package:client_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/common/constant/dimension.dart';
import '../../../../core/common/constant/strings.dart';
import '../../../../core/common/helper/app_util.dart';
import '../../../../core/common/injection/injection.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../core/common/widgets/show_adaptive_diologe.dart';
import '../../../../generated/assets.dart';
import '../../data/model/params/add_fav_params.dart';
import '../widgets/services_details_widget/add_to_cart_widget.dart';
import '../widgets/services_details_widget/content_details_page.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  // Track selected filter
  String selectedFilter = "حول";

  // Filters list
  List<String> filters = [
    "حول",
    "الأقسام",
    "التقييمات",
  ];

  List<String> location = [];

  final List<Map<String, String>> workingHours = [];

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    int id = args['id'];
    return BlocProvider(
      create: (context) {
        final bloc = locator.get<HomeBloc>()..add(DetailsServices(id));
        if (getToken() != null) {
          bloc.add(GetAllAddresses());
        }
        return bloc;
      },
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.detailsServicesStatue.isFail()) {
            showSnackBar(
              context: context,
              text: state.detailsServicesStatue.error.toString(),
              icon: Icons.cancel_outlined,
              colors: Colors.red,
            );
          }
          if (state.detailsServicesStatue.isSuccess()) {
            for (int i = 0;
                i <
                    state.detailsServicesStatue.model!.service!.workingHours!
                        .length;
                i++) {
              if (state.detailsServicesStatue.model!.service!.workingHours !=
                  null) {
                workingHours.add({
                  'day': state.detailsServicesStatue.model?.service
                          ?.workingHours?[i].day ??
                      "_",
                  'start_time': state.detailsServicesStatue.model?.service
                          ?.workingHours?[i].startHour ??
                      "_",
                  'end_time': state.detailsServicesStatue.model?.service
                          ?.workingHours?[i].endHour ??
                      "_"
                });
              }
            }
          }
          if (state.allAddressesStatue.isSuccess()) {
            for (int i = 0;
                i < state.allAddressesStatue.model!.addresses!.data!.length;
                i++) {
              location.add(state
                      .allAddressesStatue.model?.addresses?.data?[i].location ??
                  "_");
            }
          }
          if(state.addRatingStatue.isSuccess()){
            showSnackBar(
              context: context,
              text: "تم إضافة تقييم بنجاح",
              icon: Icons.check_circle_outline,
              colors: Colors.green,
            );
            Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.rootPage, (Route<dynamic> route) => false);
          }
          if(state.addRatingStatue.isFail()){
            showSnackBar(
              context: context,
              text: state.addRatingStatue.error.toString(),
              icon: Icons.cancel_outlined,
              colors: Colors.red,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(context,
                state.detailsServicesStatue.model?.service?.name ?? ""),
            body: state.detailsServicesStatue.isSuccess() &&
                    (state.allAddressesStatue.isSuccess() ||
                        state.allAddressesStatue.isInitial())
                ? Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: ScreenSizeUtil.height(context) / 1.60,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: state.detailsServicesStatue.model?.service
                                          ?.image ==
                                      null
                                  ? AssetImage(Assets.pngPerson)
                                  : NetworkImage(
                                      "${AppStrings.imageString}${state.detailsServicesStatue.model?.service?.image ?? "_"}",
                                    ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 110,
                            ),
                            Card(
                              color: AppColors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.detailsServicesStatue.model
                                                      ?.service?.name ??
                                                  "_",
                                              style: CustomTextStyle.titleSmall(
                                                  context,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).pushNamed(
                                                    Routes.profilePage,
                                                    arguments: {
                                                      'idProvider': state
                                                          .detailsServicesStatue
                                                          .model
                                                          ?.service
                                                          ?.user!
                                                          .id
                                                    });
                                              },
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 8,
                                                    backgroundImage: state.detailsServicesStatue.model?.service?.user?.image ==
                                                        null
                                                        ? AssetImage(Assets.pngPerson)
                                                        : NetworkImage(
                                                      "${AppStrings.imageString}${state.detailsServicesStatue.model?.service?.user?.image ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKiXU1Oa_BmCKSHSMvqCqT3HCKxLzA3IotRw&s"}",
                                                    ),
                                                  ),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    state.detailsServicesStatue.model?.service?.user?.fullName ??
                                                        "_",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ),
                                             IconButton(
                                                    icon: Icon(
                                                      state.detailsServicesStatue.model
                                                                      ?.favorite !=
                                                                  null
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border,
                                                      color: state
                                                                      .detailsServicesStatue
                                                                      .model
                                                                      ?.favorite !=
                                                                  null
                                                          ? Colors.red
                                                          : AppColors.grey,
                                                    ),
                                                    onPressed: () async {
                                                      if (state
                                                              .detailsServicesStatue
                                                              .model
                                                              ?.favorite ==
                                                          null) {
                                                        context
                                                            .read<HomeBloc>()
                                                            .add(
                                                              AddFav(
                                                                addFavParams:
                                                                    AddFavParams(
                                                                  serviceId: id
                                                                      .toString(),
                                                                ),
                                                              ),
                                                            );
                                                      } else if (state
                                                              .detailsServicesStatue
                                                              .model
                                                              ?.favorite !=
                                                          null) {
                                                        context
                                                            .read<HomeBloc>()
                                                            .add(
                                                              DeleteFav(state
                                                                      .detailsServicesStatue
                                                                      .model
                                                                      ?.favorite!
                                                                      .id ??
                                                                  0),
                                                            );
                                                      }

                                                      await Future.delayed(
                                                          Duration(
                                                              milliseconds:
                                                              300)); // Adjust as necessary
                                                      context
                                                          .read<HomeBloc>()
                                                      .add(DetailsServices(id));
                                                    },
                                                  ),
                                            Text(
                                              "${state.detailsServicesStatue.model?.service?.price} رس",
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              child: ElevatedButtonWidget(
                                                width: ScreenSizeUtil.width(
                                                    context),
                                                onPressed: () {
                                                  if (getToken() == null) {
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
                                                                "يجب عليك تسجيل الدخول",
                                                                style: CustomTextStyle
                                                                        .titleMedium(
                                                                  context,
                                                                  color: AppColors
                                                                      .primaryColor,
                                                                )!
                                                                    .copyWith(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 18,
                                                            ),
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 2,
                                                                right: 2,
                                                                top: 2,
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional
                                                                      .center,
                                                              child:
                                                                  ElevatedButtonWidget(
                                                                      color: AppColors
                                                                          .primaryColor,
                                                                      width: ScreenSizeUtil
                                                                          .width(
                                                                              context),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pushNamed(
                                                                          Routes
                                                                              .chooseAccount,
                                                                        );
                                                                      },
                                                                      text:
                                                                          "تسجيل"),
                                                            ),
                                                            const SizedBox(
                                                              height: 18.0,
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    );
                                                  } else if (state
                                                      .detailsServicesStatue
                                                      .model!
                                                      .service!
                                                      .workingHours!
                                                      .isEmpty) {
                                                    showSnackBar(
                                                      context: context,
                                                      text:
                                                          "لا يوجد أيام عمل للإضافة إلى السلة",
                                                      icon: Icons.cancel,
                                                      colors: Colors.red,
                                                    );
                                                  } else {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            AddToCartWidget(
                                                          workingHours:
                                                              workingHours,
                                                          // Pass the required arguments
                                                          homeState: state,
                                                          location: location,
                                                          servicesId: state
                                                                  .detailsServicesStatue
                                                                  .model
                                                                  ?.service
                                                                  ?.id ??
                                                              0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                                text: "أضف للسلة",
                                                color: AppColors.orange,
                                                textColor: AppColors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor),
                                            padding: EdgeInsets.all(5),
                                            child: Icon(
                                              Icons.star,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          Text(state.detailsServicesStatue.model
                                                  ?.service?.reviewAvg ??
                                              "_"),
                                          Text("تقييم"),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor),
                                            padding: EdgeInsets.all(5),
                                            child: Icon(
                                              Icons.favorite,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          Text(state.detailsServicesStatue.model
                                                  ?.service?.favoritesCount ??
                                              "_"),
                                          Text("زبون"),
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
                            Card(
                              elevation: 5,
                              color: AppColors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          ScreenSizeUtil.height(context) / 15,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 3,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedFilter = filters[index];
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: selectedFilter ==
                                                        filters[index]
                                                    ? AppColors.primaryColor
                                                    : AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: AppColors.grey),
                                              ),
                                              padding: EdgeInsets.all(5),
                                              margin: EdgeInsets.all(5),
                                              height: 10,
                                              width: ScreenSizeUtil.width(
                                                      context) /
                                                  4,
                                              child: Center(
                                                child: Text(
                                                  filters[index],
                                                  style: TextStyle(
                                                    color: selectedFilter ==
                                                            filters[index]
                                                        ? AppColors.white
                                                        : AppColors.grey,
                                                    fontWeight:
                                                        selectedFilter ==
                                                                filters[index]
                                                            ? FontWeight.bold
                                                            : FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SelectDetailsContent(
                                      selectedFilter: selectedFilter,
                                      homeState: state,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
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

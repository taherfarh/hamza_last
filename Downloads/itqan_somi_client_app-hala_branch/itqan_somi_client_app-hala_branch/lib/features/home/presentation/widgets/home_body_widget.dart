import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/core/common/constant/dimension.dart';
import 'package:client_app/core/common/constant/strings.dart';
import 'package:client_app/features/home/presentation/widgets/popular_services_provider.dart';
import 'package:client_app/features/home/presentation/widgets/services_card_widget.dart';
import 'package:client_app/features/home/presentation/widgets/services_form_setting_card.dart';
import 'package:client_app/features/home/presentation/widgets/title_of_services.dart';
import 'package:client_app/generated/assets.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../core/common/widgets/auto_complete_widget.dart';
import '../bloc/home_bloc.dart';

class HomeBody extends StatelessWidget {
  final HomeState state;
  Map<String, String> mapIdAndName;

  HomeBody(
      {super.key,
      required this.state,
      required this.mapIdAndName,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: AutomataCompleteWidget(
                    hintText: "البحث عن خدمة",
                    suggestions: mapIdAndName.values.toSet().toList(),
                    onSubmitted: (value) {
                      int? idSubmit;
                      mapIdAndName.forEach(
                        (key, forValue) {
                          if (forValue == value) {
                            idSubmit = int.parse(key);
                          }
                        },
                      );
                      if (idSubmit != null) {
                        Navigator.of(context).pushNamed(Routes.detailsPage,
                            arguments: {'id': idSubmit});
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  hoverColor: AppColors.primaryColor,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      Routes.searchPage,
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Card(
                      color: AppColors.white,
                      child: Icon(
                        Icons.search,
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TitleOfServices(
              titleServices: "الأقسام",
              onTap: (){
                Navigator.of(context).pushNamed(
                 Routes.department
                );
              },
            ),
            Container(
              child: GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 3,
                childAspectRatio: (ScreenSizeUtil.width(context) / 2) /
                    (ScreenSizeUtil.height(context) / 4),
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: List<Widget>.generate(
                  state.categoriesStatue.model!.categories!.data!.length > 6? 6 :state.categoriesStatue.model?.categories?.data?.length ?? 0,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          Routes.departmentDetails,
                          arguments: {
                            'id': state.categoriesStatue.model?.categories?.data?[index].id,
                          },
                        );
                      },
                      child: Card(
                          color: AppColors.primaryColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                  "${AppStrings.imageString}${state.categoriesStatue.model?.categories?.data?[index].image ?? Assets.pngImagedep1}"),
                              Text(
                                state.categoriesStatue.model?.categories
                                        ?.data?[index].name ??
                                    "_",
                                style: CustomTextStyle.titleSmall(context,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    );
                  },
                ),
              ),
            ),
            TitleOfServices(
              titleServices: "أشهر الخدمات",
              onTap: (){
                Navigator.of(context).pushNamed(
                  Routes.allServices,
                  arguments: {
                    "state": state
                  }
                );
              },
            ),
            SizedBox(
              height: ScreenSizeUtil.height(context) / 3.50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.popularServicesStatue.model!.popularServices
                        !.data!.length > 6? 6: state.popularServicesStatue.model?.popularServices
                    ?.data?.length??
                    0,
                itemBuilder: (context, index) {
                  return FittedBox(
                      child: ServiceCard(
                    state: state,
                    index: index,
                  ));
                },
              ),
            ),
            TitleOfServices(
              titleServices:
                  state.servicesFormSettingStatue.model?.category?.name ?? "_",
              onTap: (){
                Navigator.of(context).pushNamed(
                    Routes.allCategories,
                    arguments: {
                      "state": state
                    }
                );
              },
            ),
            SizedBox(
              height: ScreenSizeUtil.height(context) / 3.50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state
                    .servicesFormSettingStatue.model!.services!.data!.length > 6? 6 :state
                    .servicesFormSettingStatue.model?.services?.data?.length,
                itemBuilder: (context, index) {
                  return FittedBox(
                      child: ServicesFormSettingCard(
                    index: index,
                    state: state,
                  ));
                },
              ),
            ),
            TitleOfServices(
              titleServices: "أشهر مقدمي الخدمات",
              onTap: (){
                Navigator.of(context).pushNamed(
                    Routes.allServicesProvider,
                    arguments: {
                      "state": state
                    }
                );
              },            ),
            Container(
              height: ScreenSizeUtil.height(context) / 3.50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.popularServicesProviderStatue.model
                        !.popularServiceProviders!.data!.length > 6? 6 : state.popularServicesProviderStatue.model
                    ?.popularServiceProviders?.data?.length??
                    0,
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: PopularServicesProviderPage(
                      state: state,
                      index: index,
                    ),
                  );
                },
              ),
            ),
            // SizedBox(
            //   height: 40,
            // ),
            // Container(
            //   decoration: BoxDecoration(
            //     color: AppColors.white,
            //     borderRadius: BorderRadius.all(
            //      Radius.circular(15),
            //     ),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.all(15),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Container(
            //               child: Text(
            //                 "انشر وظيفتك المخصصة",
            //                 style: CustomTextStyle.titleSmall(context,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //             ),
            //             Container(
            //               width: 100,
            //                 child: Text("أنشئ منشورك بوصف مخصص مع تعليمات إضافية")),
            //             Container(
            //               child: ElevatedButtonWidget(
            //                   width: ScreenSizeUtil.width(context),
            //                   onPressed: () {},
            //                   text: "إنشاء منشور"),
            //             ),
            //           ],
            //         ),
            //       ),
            //       Image.asset(Assets.pngPerson)
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

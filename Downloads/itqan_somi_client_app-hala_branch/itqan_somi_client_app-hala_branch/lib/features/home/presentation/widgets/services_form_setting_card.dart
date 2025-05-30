import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/core/common/constant/dimension.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/constant/strings.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../bloc/home_bloc.dart';

class ServicesFormSettingCard extends StatelessWidget {
  final HomeState state;
  final int index;

  const ServicesFormSettingCard({super.key, required this.state, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            Routes.detailsPage,
            arguments:
            {'id':
            state.servicesFormSettingStatue.model?.services?.data?[index].id
          });
        },
        child: Container(
          width: ScreenSizeUtil.width(context) / 1.50,
          child: Card(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: FractionalOffset.topLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                          bottom: Radius.circular(16)),
                      child: Image.network(
                        "${AppStrings.imageString}${state.servicesFormSettingStatue.model?.services?.data?[index].image ?? "_"}",
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.yellow,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          state.servicesFormSettingStatue.model?.services
                              ?.data?[index].tags![0].name ??"_",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category Badge
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              state.servicesFormSettingStatue.model?.services
                                  ?.data?[index].name ??
                                  "_",
                              style: CustomTextStyle.titleSmall(
                                context,
                                fontWeight: FontWeight.bold,
                              )),
                          Row(
                            children: List.generate(
                              double.parse(state.servicesFormSettingStatue.model?.services
                                  ?.data?[index].reviewAvg ??
                                  "0").round(),
                                  (index) => Icon(Icons.star,
                                  size: 16, color: AppColors.yellow),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${
                              state.servicesFormSettingStatue.model?.services
                                  ?.data?[index].price}رس",
                        style: CustomTextStyle.titleSmall(
                          context,
                        ),
                      ),
                      SizedBox(height: 4),
                      // Provider Info
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundImage: NetworkImage(
                              "${AppStrings.imageString}${state.servicesFormSettingStatue.model?.services?.data?[index].image ?? "_"}",
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            state.servicesFormSettingStatue.model?.services?.data?[index].user?.fullName ??"_",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

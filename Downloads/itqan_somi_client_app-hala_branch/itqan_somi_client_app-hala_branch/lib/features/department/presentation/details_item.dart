import 'package:client_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

import '../../../core/common/config/colors.dart';
import '../../../core/common/config/styles.dart';
import '../../../core/common/constant/strings.dart';
import '../../../generated/assets.dart';

class DepartmentItem extends StatelessWidget {
  HomeState homeState;
  int index;
   DepartmentItem({super.key, required this.homeState, required this.index});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    fit:BoxFit.fill ,
                    image: NetworkImage(
                      "${AppStrings.imageString}${homeState.servicesCategoriesStatue.model?.services?.data?[index].image ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKiXU1Oa_BmCKSHSMvqCqT3HCKxLzA3IotRw&s"}",
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homeState.servicesCategoriesStatue.model?.services?.data?[index].name ??
                        "_",
                    style: CustomTextStyle.bodyMedium(context,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(homeState.servicesCategoriesStatue.model?.services?.data?[index]
                      .category?.name ??
                      "_"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: AppColors.primaryColor,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${homeState.servicesCategoriesStatue.model?.services?.data?[index].price} رس",
                                style: CustomTextStyle.bodySmall(context,
                                    color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      CircleAvatar(
                        radius: 8,
                        backgroundImage: homeState.servicesCategoriesStatue.model?.services
                            ?.data?[index].user?.image ==
                            null
                            ? AssetImage(Assets.pngPerson)
                            : NetworkImage(
                          "${AppStrings.imageString}${homeState.servicesCategoriesStatue.model?.services?.data?[index].user?.image ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKiXU1Oa_BmCKSHSMvqCqT3HCKxLzA3IotRw&s"}",
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        homeState.servicesCategoriesStatue.model?.services?.data?[index]
                            .user?.fullName ??
                            "_",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

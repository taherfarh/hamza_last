import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/core/common/constant/dimension.dart';
import 'package:client_app/generated/assets.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/constant/strings.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../bloc/home_bloc.dart';

class PopularServicesProviderPage extends StatelessWidget {
  final HomeState state;
  final int index;

  const PopularServicesProviderPage(
      {super.key, required this.state, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          print(state.popularServicesProviderStatue.model?.popularServiceProviders?.data![index].id);
          Navigator.of(context).pushNamed(
              Routes.profilePage,
              arguments: {'idProvider':state.popularServicesProviderStatue.model?.popularServiceProviders?.data![index].id}
          );
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
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                      bottom: Radius.circular(16)),
                  child: state.popularServicesProviderStatue.model
                      ?.popularServiceProviders?.data?[index].image == null
                      ? Image.asset(Assets.pngPerson)
                      : Image.network(
                    "${AppStrings.imageString}${state
                        .popularServicesProviderStatue.model
                        ?.popularServiceProviders?.data?[index].image ?? "_"}",
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
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
                            state.popularServicesProviderStatue.model
                                ?.popularServiceProviders
                                ?.data?[index].fullName ??
                                "_",
                            style: CustomTextStyle.titleSmall(
                              context,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: List.generate(
                              double.parse(state.
                              popularServicesProviderStatue.model
                                  ?.popularServiceProviders
                                  ?.data?[index]
                                  .reviewAvg ??
                                  "0")
                                  .round(),
                                  (index) =>
                                  Icon(Icons.star,
                                      size: 16, color: AppColors.yellow),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        state.popularServicesProviderStatue.model
                            ?.popularServiceProviders
                            ?.data?[index].specialize ??
                            "_",
                        style: CustomTextStyle.titleSmall(
                          context,
                        ),
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

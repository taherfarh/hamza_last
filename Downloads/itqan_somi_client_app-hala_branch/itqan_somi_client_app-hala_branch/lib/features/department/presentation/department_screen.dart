import 'package:client_app/core/common/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../core/common/config/colors.dart';
import '../../../core/common/config/styles.dart';
import '../../../core/common/constant/dimension.dart';
import '../../../core/common/constant/strings.dart';
import '../../../core/common/injection/injection.dart';
import '../../../core/common/routes/app_routes.dart';
import '../../../generated/assets.dart';
import '../../home/presentation/bloc/home_bloc.dart';
import '../../home/presentation/widgets/services_card_widget.dart';
import '../../home/presentation/widgets/title_of_services.dart';

class DepartmentScreen extends StatelessWidget {
  const DepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<HomeBloc>()
        ..add(
          AllMainCategories(),
        ),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "الأقسام",
                style: CustomTextStyle.titleMedium(context,
                    color: AppColors.white),
              ),
              backgroundColor: AppColors.primaryColor,
            ),
            body: state.categoriesStatue.isSuccess()
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Expanded(
                          flex: 3,
                          child: GridView.count(
                            padding: EdgeInsets.zero,
                            crossAxisCount: 3,
                            physics: AlwaysScrollableScrollPhysics(),
                            childAspectRatio: (ScreenSizeUtil.width(context) / 2) /
                                (ScreenSizeUtil.height(context) / 4),
                            scrollDirection: Axis.vertical,
                            children: List<Widget>.generate(
                              state.categoriesStatue.model?.categories?.data?.length ?? 0,
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
                      ],
                    ),
                  )
                : ShimmerWidget(),
          );
        },
      ),
    );
  }
}

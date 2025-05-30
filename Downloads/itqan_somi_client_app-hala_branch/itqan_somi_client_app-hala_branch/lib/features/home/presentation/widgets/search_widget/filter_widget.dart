import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/constant/dimension.dart';
import 'package:client_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:client_app/features/home/presentation/widgets/search_widget/provide_services_widget.dart';
import 'package:client_app/features/home/presentation/widgets/search_widget/select_filter_content.dart';
import 'package:client_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/common/helper/app_util.dart';
import '../../../../../core/common/injection/injection.dart';
import '../../../../../core/common/routes/app_routes.dart';
import '../../../../../core/common/widgets/app_bar_widget.dart';
import '../../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../data/model/params/filter_params.dart';
import '../../state/home_provider.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String selectedFilter = "مقدم الخدمة";

  List<String> filters = ["مقدم الخدمة", "الأقسام", "السعر", "التقييم"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<HomeBloc>()
        ..add(GetAllServicesProvider())
        ..add(GetAllCategories()),
      child: Scaffold(
        appBar: appBar(context, "فلترة بواسطة"),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.allProviderModelStatue.isFail()) {
              showSnackBar(
                context: context,
                text: state.allProviderModelStatue.error.toString(),
                icon: Icons.cancel_outlined,
                colors: Colors.red,
              );
            }
            if (state.allCategoriesStatue.isFail()) {
              showSnackBar(
                context: context,
                text: state.allCategoriesStatue.error.toString(),
                icon: Icons.cancel_outlined,
                colors: Colors.red,
              );
            }
          },
          builder: (context, state) {
            return state.allProviderModelStatue.isLoading()
                ? Center(
                    child: Lottie.asset(
                      Assets.lottieTimer,
                      fit: BoxFit.fill,
                      repeat: true,
                      height: 150,
                    ),
                  )
                : Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: AppColors.scafold,
                          child: ListView.builder(
                            itemCount: filters.length + 1,
                            itemBuilder: (context, index) {
                              return index == 4
                                  ? state.filterStatue.isLoading()? Center(child: CircularProgressIndicator()) :Container(
                                padding: EdgeInsets.all(10),
                                    child: ElevatedButtonWidget(
                                        width: 10,
                                        onPressed: () {
                                          Navigator.of(context).pushReplacementNamed(
                                            Routes.searchPage,
                                          );
                                        },
                                        text: "فلترة"),
                                  )
                                  : ListTile(
                                      title: Text(
                                        filters[index],
                                        style: TextStyle(
                                          fontWeight:
                                              selectedFilter == filters[index]
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedFilter = filters[index];
                                        });
                                      },
                                    );
                            },
                          ),
                        ),
                      ),
                      SelectFilterContent(
                        selectedFilter: selectedFilter,
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}

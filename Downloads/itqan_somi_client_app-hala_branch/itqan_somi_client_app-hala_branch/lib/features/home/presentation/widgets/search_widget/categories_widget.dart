import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/common/config/colors.dart';
import '../../../../../core/common/constant/strings.dart';
import '../../../../../generated/assets.dart';
import '../../bloc/home_bloc.dart';
import '../../state/home_provider.dart';

class CategoriesWidget extends StatefulWidget {
  List<Map<String, String>> contentList;
  String selectedFilter;

  CategoriesWidget(
      {required this.contentList, required this.selectedFilter});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  static String? categoriesSelected;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Expanded(
          flex: 3,
          child: ListView.builder(
            padding: EdgeInsets.all(20),
            itemCount: state.allCategoriesStatue.model?.allCategories?.data?.length,
            itemBuilder: (context, index) {
              return Card(
                color: AppColors.scafold,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: state.allCategoriesStatue.model?.allCategories?.data![index].image ==null ?AssetImage(
                        Assets.pngPerson) : NetworkImage('${AppStrings.imageString}${state.allCategoriesStatue.model?.allCategories?.data![index].image}'), // Replace with your image asset
                  ),
                  title: Text(state.allCategoriesStatue.model?.allCategories?.data?[index].name??"_"),
                  subtitle: Text("${state.allCategoriesStatue.model?.allCategories?.data?[index].servicesCount} خدمات "),
                  trailing: Radio<String>(
                    value: state.allCategoriesStatue.model?.allCategories?.data?[index].name ??"_",
                    groupValue: categoriesSelected,
                    onChanged: (value) {
                      setState(() {
                        categoriesSelected = value!;
                        print("object");
                        print(state.allCategoriesStatue.model?.allCategories?.data?[index].id);
                        context.read<HomeProvider>().setCategoriesId(
                            state.allCategoriesStatue.model?.allCategories?.data?[index].id.toString() ?? "" );
                        print(context.read<HomeProvider>().categoriesId);
                      });
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

import 'package:client_app/features/home/presentation/widgets/services_details_widget/rating_page.dart';
import 'package:flutter/material.dart';

import '../../bloc/home_bloc.dart';
import 'about_widget.dart';
import 'department.dart';

class SelectDetailsContent extends StatelessWidget {
  final String selectedFilter;
  HomeState homeState;

  SelectDetailsContent({super.key, required this.selectedFilter, required this.homeState});

  @override
  Widget build(BuildContext context) {
    switch (selectedFilter) {
      case "حول":
        return AboutWidget(homeState: homeState,);
      case "الأقسام":
        return Department(homeState: homeState,);
      case "التقييمات":
        return RatingPage(state: homeState,);
      default:
        return Text("حدد فلتر",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
    }
  }
}

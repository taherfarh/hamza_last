import 'package:client_app/features/home/presentation/widgets/search_widget/price_widget.dart';
import 'package:client_app/features/home/presentation/widgets/search_widget/provide_services_widget.dart';
import 'package:client_app/features/home/presentation/widgets/search_widget/rating_widget.dart';
import 'package:flutter/material.dart';

import 'categories_widget.dart';

class SelectFilterContent extends StatelessWidget {
  final String selectedFilter;

  SelectFilterContent({required this.selectedFilter});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> contentList = [
      {"name": "خالد محمد", "details": "تفاصيل 1"},
      {"name": "خالد محمد", "details": "تفاصيل 2"},
      {"name": "خالد محمد", "details": "تفاصيل 3"},
      {"name": "خالد محمد", "details": "تفاصيل 4"},
      {"name": "خالد محمد", "details": "تفاصيل 5"},
      {"name": "خالد محمد", "details": "تفاصيل 6"},
    ];

    List<Map<String, String>> provideServices = [
      {"name": "تنسيق", "details": "تفاصيل 1"},
      {"name": "القاعة", "details": "تفاصيل 2"},
      {"name": "تنسيق", "details": "تفاصيل 3"},
      {"name": "تنسيق", "details": "تفاصيل 4"},
      {"name": "تنسيق", "details": "تفاصيل 5"},
      {"name": "القاعة", "details": "تفاصيل 6"},
    ];


    switch (selectedFilter) {
      case "مقدم الخدمة":
        return ProvideServicesWidget(
            selectedFilter: selectedFilter, contentList: contentList);
      case "الأقسام":
        return CategoriesWidget(
            selectedFilter: selectedFilter, contentList: provideServices);
      case "السعر":
        return PriceWidget();
      case "التقييم":
        return RatingWidget();
      default:
        return Text("حدد فلتر",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
    }
  }
}

import 'package:client_app/features/payment/presentation/widgets/booking_details.dart';
import 'package:client_app/features/payment/presentation/widgets/cash_pay.dart';
import 'package:client_app/features/payment/presentation/widgets/onLine_pay.dart';
import 'package:flutter/material.dart';

import 'bookin_services_provider_state.dart';
import 'booling_services_provider_details.dart';
import 'filter_order_page.dart';

class SelectContent extends StatelessWidget {
  final String selectedFilter;
  int? id;

  SelectContent({required this.selectedFilter, this.id});

  @override
  Widget build(BuildContext context) {
    switch (selectedFilter) {
      case "الكل":
        return FilterOrderPage(selectedFilter: selectedFilter);
      case "المقبولة":
        return FilterOrderPage(selectedFilter: "المقبولة");
      case "الجارية":
        return FilterOrderPage(selectedFilter: "الجارية");
      case "ملغاة":
        return FilterOrderPage(selectedFilter: "ملغاة");
      case "حالة الحجز":
        return BookingServicesProviderState();
      case "تفاصيل الحجز":
        return BookingServicesProviderDetails(
          id: id,
        );
      case "الدفع اونلاين":
        return OnLinePay();
      case "الدفع كاش":
        return CashPay();
      default:
        return Text(
          "حدد فلتر",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        );
    }
  }
}

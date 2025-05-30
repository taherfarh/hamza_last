import 'package:client_app/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:client_app/features/payment/presentation/widgets/booking_details.dart';
import 'package:client_app/features/payment/presentation/widgets/cash_pay.dart';
import 'package:client_app/features/payment/presentation/widgets/onLine_pay.dart';
import 'package:flutter/material.dart';

import 'all_booking_widget.dart';
import 'booking_state.dart';

class SelectDetailsContent extends StatelessWidget {
  final String selectedFilter;
   int? id;

  SelectDetailsContent({required this.selectedFilter, this.id});

  @override
  Widget build(BuildContext context) {
    switch (selectedFilter) {
      case "الكل":
        return AllBookingWidget(selectedFilter: selectedFilter);
      case "المقبولة":
        return AllBookingWidget(selectedFilter: "المقبولة");
      case "الجارية":
        return AllBookingWidget(selectedFilter: "الجارية");
        case "ملغاة":
        return AllBookingWidget(selectedFilter: "ملغاة");
      case "حالة الحجز":
        return BookingState();
      case "تفاصيل الحجز":
        return BookingDetails(id:id);
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

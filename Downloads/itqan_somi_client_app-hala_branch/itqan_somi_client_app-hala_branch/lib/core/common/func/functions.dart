import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelector {
  final List<Map<String, dynamic>> workingHours;

  DateSelector(this.workingHours);

  Future<void> selectDate(BuildContext context, DateTime? selectedDate, Function(DateTime) onDateSelected) async {
    // Find a valid initial date
    DateTime initialDate = selectedDate ?? DateTime.now();
    int maxAttempts = 30; // عدد المحاولات الأقصى
    int attempts = 0;

    while (!isSelectable(initialDate) && attempts < maxAttempts) {
      initialDate = initialDate.add(Duration(days: 1));
      attempts++;
    }

    // إذا لم نجد تاريخ صالح بعد 30 محاولة، نخرج من الدالة
    if (attempts == maxAttempts) {
      // يمكنك عرض رسالة للمستخدم أو اتخاذ إجراء آخر
      return;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
      selectableDayPredicate: (DateTime date) {
        // Check if the day is in the working list
        String dayOfWeek = DateFormat('EEEE').format(date).toLowerCase();
        return workingHours.any((entry) => entry['day'] == dayOfWeek);
      },
    );

    if (picked != null && picked != selectedDate) {
      onDateSelected(picked);
    }
  }

  bool isSelectable(DateTime date) {
    String dayOfWeek = DateFormat('EEEE').format(date).toLowerCase();
    return workingHours.any((entry) => entry['day'] == dayOfWeek);
  }
}

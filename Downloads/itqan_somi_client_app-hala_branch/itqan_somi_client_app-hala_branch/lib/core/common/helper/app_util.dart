import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/styles.dart';

void showSnackBar({
  required BuildContext context,
  required String text,
  required IconData icon,
  Color colors = AppColors.primaryColor,
}) {
  final snackBar = SnackBar(
    backgroundColor: AppColors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: colors, width: 1),
      borderRadius: BorderRadius.circular(24),
    ),
    padding: const EdgeInsets.all(20),
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        Icon(icon, color:colors, size: 30),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(text,
              style: CustomTextStyle.bodyLarge(context,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

import 'package:flutter/material.dart';

import '../config/colors.dart';


void showAdaptiveAlertDialog({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
  Widget? content,
}) {
  showAdaptiveDialog(
    context: context,
    builder: (context) => AlertDialog.adaptive(
      // title: Text(
      //   "",
      //   style: CustomTextStyle.titleLarge(
      //     context,color: AppColors.mainColor,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   textAlign: TextAlign.center,
      // ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          32,
        ),
      ),
      surfaceTintColor: AppColors.white,
      actions: actions,
      content: content,
    ),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTextStyle  {

//the style of the headline
  static TextStyle? headlineLarge(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return Theme.of(context).textTheme.headlineLarge?.copyWith(color: color??AppColors.black,fontWeight: fontWeight?? FontWeight.normal);
  }
  static TextStyle? headlineMedium(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(color: color??AppColors.black,fontWeight: fontWeight?? FontWeight.normal);
  }
  static TextStyle? headlineSmall(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(color: color??AppColors.black,fontWeight: fontWeight?? FontWeight.normal);
  }

  //the style of the title
  static TextStyle? titleLarge(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return Theme.of(context).textTheme.titleLarge?.copyWith(color: color??AppColors.black,fontWeight: fontWeight?? FontWeight.normal);
  }
  static TextStyle? titleMedium(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return Theme.of(context).textTheme.titleMedium?.copyWith(color: color??AppColors.black,fontWeight: fontWeight?? FontWeight.normal);
  }
  static TextStyle? titleSmall(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return Theme.of(context).textTheme.titleSmall?.copyWith(color: color??AppColors.black,fontWeight: fontWeight?? FontWeight.normal);
  }

  // the style of the body
  static TextStyle? bodyLarge(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(color: color??AppColors.black,fontWeight: fontWeight?? FontWeight.normal);
  }
  static TextStyle? bodyMedium(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(color: color??AppColors.black,fontWeight: fontWeight?? FontWeight.normal);
  }
  static TextStyle? bodySmall(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(color: color??AppColors.black,fontWeight: fontWeight?? FontWeight.normal);
  }
  static TextStyle? myStyle(BuildContext context,{Color? color,FontWeight? fontWeight}) {
    return const TextStyle(
      fontSize: 5,

    );
  }
}

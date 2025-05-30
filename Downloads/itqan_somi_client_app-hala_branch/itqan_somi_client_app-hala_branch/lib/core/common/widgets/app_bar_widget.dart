import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/styles.dart';

PreferredSizeWidget appBar( BuildContext context,String text){
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    elevation: 0,
    leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon:Icon(Icons.arrow_back) ,
      color: AppColors.white,
    ),
    title: Text(
      text,
      style: CustomTextStyle.titleMedium(context, color: AppColors.white),
    ),
  );
}
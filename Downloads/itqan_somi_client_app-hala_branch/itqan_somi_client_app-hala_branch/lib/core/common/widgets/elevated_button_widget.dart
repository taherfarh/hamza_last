import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../config/colors.dart';
import '../config/styles.dart';

class ElevatedButtonWidget extends StatelessWidget {
   void Function()? onPressed;
   String text;
   double? size;
   Color? textColor;
   IconData? icon;
   double width;
   Color? color;
   bool thereIcon =false;


   ElevatedButtonWidget({super.key,required this.width,required this.onPressed,required this.text,this.color,this.textColor ,this.thereIcon=false,this.icon, this.size});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 0,
        padding: (width <= 550)
            ? const EdgeInsets.symmetric(
            horizontal: 20, vertical: 12)
            : const EdgeInsets.symmetric(
            horizontal: 30, vertical: 25),
      ),
      child: !thereIcon ?Text(
        text,
        style: CustomTextStyle.bodyLarge(context,
            color: textColor ??AppColors.white,
            fontWeight: FontWeight.bold)?.copyWith(fontSize:size ),
      ) :Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: CustomTextStyle.bodyLarge(context,
                color: textColor ??AppColors.white,
                fontWeight: FontWeight.bold),
          ),
          Icon(icon,)
        ],
      ),
    );
  }
}

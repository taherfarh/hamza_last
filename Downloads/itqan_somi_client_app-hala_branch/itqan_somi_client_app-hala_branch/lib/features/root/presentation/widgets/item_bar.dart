import 'package:flutter/material.dart';

import '../../../../core/common/config/colors.dart';
import '../../../../core/common/config/styles.dart';

class ItemBar extends StatelessWidget {
  String text ;
  IconData icon;
  Color color;
   ItemBar({super.key,required this.icon,required this.text,required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 26, color: color),
        Text(text,style:CustomTextStyle.titleSmall(context,color: color),)
      ],
    );
  }
}

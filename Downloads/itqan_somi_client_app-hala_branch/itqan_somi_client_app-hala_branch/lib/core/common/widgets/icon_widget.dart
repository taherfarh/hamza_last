import 'package:flutter/material.dart';

import '../../../../core/common/config/colors.dart';

class ActionWidget extends StatelessWidget {
  IconData icon;

  ActionWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0,1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Icon(
        icon,
        color: AppColors.primaryColor,
      ),
    );
  }
}

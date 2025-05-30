import 'package:client_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/common/config/colors.dart';

class OrderCount extends StatelessWidget {
 final String text;
 final String count;
 final Color color;

  OrderCount(
      {super.key,
      required this.text,
      required this.count,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 180,
      child: Card(
        color: AppColors.scafold,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(text), Text(count)],
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.5),
              ),
              child: SvgPicture.asset(
                Assets.svgOrder,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

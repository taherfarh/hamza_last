import 'package:flutter/material.dart';

import '../../../../core/common/config/styles.dart';

class TitleOfServices extends StatelessWidget {
  String titleServices;
  final void Function()? onTap;
  TitleOfServices({super.key, required this.titleServices,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleServices,
              style: CustomTextStyle.bodySmall(context,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
                onTap:onTap ,
                child: Text("عرض الكل"))
          ],
        ),
      ],
    );
  }
}

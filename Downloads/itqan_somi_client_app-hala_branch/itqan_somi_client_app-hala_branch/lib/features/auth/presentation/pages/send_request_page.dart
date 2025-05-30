import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/common/constant/dimension.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../generated/assets.dart';

class SendRequestPage extends StatelessWidget {
  const SendRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.svgDone,
              ),
              SizedBox(height: 20,),
              Text(
                "تم إرسال طلبك بنجاح",
                style: CustomTextStyle.titleSmall(context,
                    color: AppColors.primaryColor,
                fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),
              Text(
                "تم ارسال طلبك الي الادارة وسوف يتم مراجعته",
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButtonWidget(
                    width: ScreenSizeUtil.width(context),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                        Routes.logIn,
                      );
                    },
                    text: "عودة الي صفحة تسجيل الدخول"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

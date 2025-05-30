import 'dart:async';

import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/local_storage/hive_services.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../generated/assets.dart';
import 'package:animate_do/animate_do.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;
  String? phone;
  String? password;
  String? otp;
  bool? install;

  @override
  void initState() {
    super.initState();
    isToken();
    isInstall();
    isOtp();
    getPhone();
    getPassword();
    Timer(const Duration(seconds: 2), onSplashCompleted);
  }

  Future<void> onSplashCompleted() async {
    if (token != null) {
      if( getType().toString() == "client"){
        Navigator.of(context).pushReplacementNamed(
          Routes.rootPage,
        );
      }
        else if( getType().toString() == "service_provider"){
        Navigator.of(context).pushReplacementNamed(
          Routes.rootServicesProvider,
        );
      }
    } else {
      if (install == true) {
        if (otp=="yes") {
          Navigator.of(context).pushReplacementNamed(
            Routes.otp,
            arguments: {
              'phone': phone,
              'password': password,
            },
          );
        } else if (otp == null || otp=="done") {
          Navigator.of(context).pushReplacementNamed(
            Routes.rootPage,
          );
        }
      } else {
        Navigator.of(context).pushReplacementNamed(
          Routes.onBoarding,
        );
        setAppInstall(true);
      }
    }
  }

  void isToken() async => token = (await getToken());

  void isInstall() async => install = (await getAppInstall());

  void isOtp() async => otp = (await getGeneral("otp"));
  void getPhone()    async => phone = (await getGeneral("phone"));
  void getPassword() async => password = (await getGeneral("password"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInDownBig(
            child: Center(child: Image.asset(Assets.pngCofee)),
          ),
          Text(
            "تطبيق سمي",
            style: CustomTextStyle.headlineLarge(context,
                fontWeight: FontWeight.bold, color: AppColors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "تطبيق المناسبات",
            style: CustomTextStyle.bodyLarge(context, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}

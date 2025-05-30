import 'dart:async';

import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/core/common/local_storage/hive_services.dart';
import 'package:client_app/features/auth/data/model/params/otp_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/common/constant/dimension.dart';
import '../../../../core/common/helper/app_util.dart';
import '../../../../core/common/injection/injection.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../generated/assets.dart';
import '../bloc/auth_bloc.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otp = TextEditingController();
  int _start = 60;
  Timer? _timer;

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: AppColors.primaryColor,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColors.grey),
    ),
  );

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        setState(() {
          _timer!.cancel();
        });
      }
    });
  }

  void resendOtp() {
    // هنا يمكنك إضافة الكود الخاص بإعادة إرسال OTP
    setState(() {
      _start = 60; // إعادة تعيين العداد
    });
    startTimer(); // إعادة بدء العداد
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final phone = args['phone'];
    final password = args['password'];
    return BlocProvider(
      create: (context) => locator.get<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.otpStatue.isFail()) {
            // ignore: use_build_context_synchronously
            showSnackBar(
              context: context,
              text: state.otpStatue.error.toString(),
              icon: Icons.cancel_outlined,
              colors: Colors.red,
            );
          }
          if (state.otpStatue.isSuccess()) {
            // ignore: use_build_context_synchronously
            getType().toString() == "client"
                ? Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.logIn, (Route<dynamic> route) => false)
                : Navigator.of(context).pushReplacementNamed(
                    Routes.confirmIdentity,
                    arguments: {
                      'phone': phone,
                    },
                  );
            showSnackBar(
              context: context,
              text: getType().toString() == "client"
                  ? "قم بتسجيل الدخول"
                  : "قم برفع الملفات المطلوبة",
              icon: Icons.check_circle_outline,
              colors: Colors.green,
            );
            setGeneral("otp","done");
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: state.otpStatue.isLoading()
                ? Center(
                    child: Lottie.asset(
                      Assets.lottieTimer,
                      fit: BoxFit.fill,
                      repeat: true,
                      height: 150,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            Assets.svgOtp,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "تاكيد رقم الهاتف",
                          style: CustomTextStyle.titleSmall(context,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "قم بكتابة رمز التاكيد الذي تم ارساله الي",
                          style: CustomTextStyle.titleSmall(context,
                              color: AppColors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Pinput(
                              controller: otp,
                              length: 6,
                              defaultPinTheme: defaultPinTheme,
                              focusedPinTheme: defaultPinTheme.copyWith(
                                decoration:
                                    defaultPinTheme.decoration!.copyWith(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: AppColors.primaryColor),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButtonWidget(
                              width: ScreenSizeUtil.width(context),
                              onPressed: () {
                                context.read<AuthBloc>().add(
                                      Otp(
                                        otpParams: OtpParams(
                                          password: password,
                                          phone: phone,
                                          otp: otp.text,
                                        ),
                                      ),
                                    );
                              },
                              text: "ارسال"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Text(
                                "سيتم ارسال الكود في خلال ثانية$_start",
                                style: CustomTextStyle.titleSmall(context,
                                    color: AppColors.grey),
                              ),
                            ),
                            GestureDetector(
                              onTap: _start == 0 ? resendOtp : null,
                              child: Text('إعادة إرسال OTP',style: CustomTextStyle.titleSmall(context,color:_start == 0 ?AppColors.primaryColor: AppColors.grey ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}

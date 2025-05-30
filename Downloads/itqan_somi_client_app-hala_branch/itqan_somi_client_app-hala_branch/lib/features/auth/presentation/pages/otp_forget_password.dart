import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/features/auth/data/model/params/otp_forget_password.dart';
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

class OtpForgetPasswordScreen extends StatelessWidget {
  TextEditingController otp = TextEditingController();
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

  OtpForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final phone = args['phone'];
    return BlocProvider(
      create: (context) => locator.get<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.otpForgetPasswordStatue.isFail()) {
            // ignore: use_build_context_synchronously
            showSnackBar(
              context: context,
              text: state.otpForgetPasswordStatue.error.toString(),
              icon: Icons.cancel_outlined,
              colors: Colors.red,
            );
          }
          if (state.otpForgetPasswordStatue.isSuccess()) {
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushNamed(
              Routes.resetPassword,
              arguments: {
                'phone': phone,
                'otp':otp.text,

              },
            );
            showSnackBar(
              context: context,
              text: "قم بإعادة تعيين كلمة السر",
              icon: Icons.check_circle_outline,
              colors: Colors.green,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: state.otpForgetPasswordStatue.isLoading()
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
                                      OtpForgetPassword(
                                        otpForgetPasswordParams:
                                            OtpForgetPasswordParams(
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
                        Center(
                          child: Text(
                            "سيتم ارسال الكود في خلال 30 ثانية ",
                            style: CustomTextStyle.titleSmall(context,
                                color: AppColors.grey),
                          ),
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

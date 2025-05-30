import 'package:client_app/features/auth/data/model/params/reset_password_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/common/config/colors.dart';
import '../../../../core/common/config/styles.dart';
import '../../../../core/common/constant/dimension.dart';
import '../../../../core/common/helper/app_util.dart';
import '../../../../core/common/injection/injection.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../core/common/widgets/text_field_widget.dart';
import '../../../../generated/assets.dart';
import '../bloc/auth_bloc.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final phone = args['phone'];
    final otp = args['otp'];
    return BlocProvider(
      create: (context) => locator.get<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.resetPasswordStatue.isFail()) {
            showSnackBar(
              context: context,
              text: state.resetPasswordStatue.error.toString(),
              icon: Icons.cancel_outlined,
              colors: Colors.red,
            );
          }
          if (state.resetPasswordStatue.isSuccess()) {
            showSnackBar(
              context: context,
              text: "تم تغيير كلمة السر بنجاح",
              icon: Icons.check_circle_outline,
              colors: Colors.green,
            );
            Navigator.of(context).pushReplacementNamed(
              Routes.logIn,
            );
          }
        },
        builder: (context, state) {
          return FormBuilder(
            key: _formKey,
            child: Scaffold(
              body: state.resetPasswordStatue.isLoading()
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
                      child:  SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: SvgPicture.asset(
                                Assets.svgForgetPassword,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "اعادة تعيين كلمة المرور",
                              style: CustomTextStyle.titleSmall(context,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFieldWidget(
                              name: 'newPassword',
                              controller: newPassword,
                              label: 'كلمة المرور',
                              hintText: 'كتابة كلمة المرور',
                              icon: Icons.lock_outline,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Confirm password is required';
                                }
                                if (value !=
                                    _formKey.currentState?.fields['ConfirmPassword']?.value) {
                                  return 'Password must match';
                                }
                                return null;
                              },
                              obscureText: false,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFieldWidget(
                              name:'ConfirmPassword' , // Unique name for this field
                              controller: confirmNewPassword,
                              label: 'كلمة المرور',
                              hintText: 'قم كتابة كلمة المرور الجديدة',
                              icon: Icons.lock_outline,
                              obscureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'new password is required';
                                }
                                if (value !=
                                    _formKey.currentState?.fields['newPassword']?.value) {
                                  return 'Password must match';
                                }
                                return null;
                              },

                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                                width: double.infinity,
                                child: ElevatedButtonWidget(
                                    width: ScreenSizeUtil.width(context),
                                    onPressed: () {
                                      if (_formKey.currentState?.validate() ?? false){
                                        context.read<AuthBloc>().add(
                                          ResetPasswordEvent(
                                            resetPasswordParams:
                                            ResetPasswordParams(
                                                phone: phone,
                                                otp: otp,
                                                passwordConfirmation: confirmNewPassword.text,
                                                password: newPassword.text
                                            ),
                                          ),
                                        );
                                      }

                                    },
                                    text: "اعادة تعين كلمة المرور")),
                          ],
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}

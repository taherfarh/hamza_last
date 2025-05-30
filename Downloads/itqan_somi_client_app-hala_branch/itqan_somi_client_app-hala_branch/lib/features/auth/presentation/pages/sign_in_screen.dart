import 'package:client_app/core/common/widgets/elevated_button_widget.dart';
import 'package:client_app/features/auth/data/model/params/log_in_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/common/config/colors.dart';
import '../../../../core/common/config/styles.dart';
import '../../../../core/common/constant/dimension.dart';
import '../../../../core/common/helper/app_util.dart';
import '../../../../core/common/injection/injection.dart';
import '../../../../core/common/local_storage/hive_services.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../core/common/widgets/text_field_widget.dart';
import '../../../../generated/assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

class LogInScreen extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: BlocProvider(
        create: (context) => locator.get<AuthBloc>(),
        child: Scaffold(
          body: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.logInStatue.isFail()) {
                // ignore: use_build_context_synchronously
                showSnackBar(
                  context: context,
                  text: state.logInStatue.error.toString(),
                  icon: Icons.cancel_outlined,
                  colors: Colors.red,
                );
              }
              if (state.logInStatue.isSuccess()) {
                // ignore: use_build_context_synchronously
                showSnackBar(
                  context: context,
                  text: "تم تسجيل الدخول بنجاح",
                  icon: Icons.check_circle_outline,
                  colors: Colors.green,
                );
                setToken(state.logInStatue.model?.token);
                setGeneral(
                  "userId",
                  state.logInStatue.model?.appUser?.id.toString(),
                );
                if (state.logInStatue.model?.appUser?.type == "client") {
                  setType(state.logInStatue.model?.appUser?.type);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.rootPage, (Route<dynamic> route) => false);
                }
                if (state.logInStatue.model?.appUser?.type ==
                    "service_provider") {
                  setType(state.logInStatue.model?.appUser?.type);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.rootServicesProvider,
                      (Route<dynamic> route) => false);
                }
              }
            },
            builder: (context, state) {
              return state.logInStatue.isLoading()
                  ? Center(
                      child: Lottie.asset(
                        Assets.lottieTimer,
                        fit: BoxFit.fill,
                        repeat: true,
                        height: 150,
                      ),
                    )
                  : SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            helloSection(context),
                            SizedBox(
                              height: 40,
                            ),
                            TextFieldWidget(
                              name: "email",
                              controller: email,
                              keyBoardType: TextInputType.emailAddress,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.email(),
                              ]),
                              label: 'البريد الالكتروني',
                              hintText: 'khaledmohamed@gmail.com',
                              icon: Icons.mail_outline,
                              obscureText: false,
                            ),
                            SizedBox(height: 16),
                            TextFieldWidget(
                              controller: password,
                              label: 'كلمة المرور',
                              hintText: '************',
                              icon: Icons.lock_outline,
                              obscureText: true,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  Routes.forgetPassword,
                                );
                              },
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "هل نسيت كلمة المرور ؟",
                                  style: CustomTextStyle.titleSmall(
                                    context,
                                    color: AppColors.grey,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButtonWidget(
                                  width: ScreenSizeUtil.width(context),
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      _formKey.currentState?.saveAndValidate();
                                      context.read<AuthBloc>().add(
                                            LoginIn(
                                              loginParams: LoginParams(
                                                email: email.text,
                                                password: password.text,
                                              ),
                                            ),
                                          );
                                    }
                                  },
                                  text: "تسجيل الدخول"),
                            ),
                            SizedBox(height: 16),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  Routes.signUp,
                                );
                              },
                              child: RichText(
                                text: TextSpan(
                                  style: CustomTextStyle.titleSmall(
                                    context,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'ليس لديك حساب ؟ ',
                                      style: CustomTextStyle.titleSmall(context,
                                          color: AppColors.grey),
                                    ),
                                    TextSpan(
                                      text: 'انشاء حساب',
                                      style: TextStyle(
                                          color: AppColors.primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              width: double.infinity,
                              child: ElevatedButtonWidget(
                                width: ScreenSizeUtil.width(context),
                                onPressed: () {},
                                text: "تسجيل من خلال جوجل",
                                color: AppColors.buttonColor,
                                textColor: AppColors.black,
                                thereIcon: true,
                                icon: FontAwesomeIcons.google,
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              width: double.infinity,
                              child: ElevatedButtonWidget(
                                  width: ScreenSizeUtil.width(context),
                                  onPressed: () {},
                                  text: "تسجيل من خلال ابل",
                                  color: AppColors.buttonColor,
                                  textColor: AppColors.black,
                                  thereIcon: true,
                                  icon: FontAwesomeIcons.apple),
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }

  Widget helloSection(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.pngCup,
        ),
        Text(
          "اهلا بك",
          style: CustomTextStyle.headlineLarge(context,
              fontWeight: FontWeight.bold, color: AppColors.primaryColor),
        ),
        Text(
          "مرحبا بك في تطبيق سمي",
          style: CustomTextStyle.titleMedium(
            context,
          ),
        ),
      ],
    );
  }
}

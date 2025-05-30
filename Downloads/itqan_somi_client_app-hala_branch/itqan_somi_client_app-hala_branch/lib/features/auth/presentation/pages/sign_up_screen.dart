import 'package:client_app/features/auth/data/model/params/regester_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/common/config/colors.dart';
import '../../../../core/common/config/styles.dart';
import '../../../../core/common/constant/dimension.dart';
import '../../../../core/common/helper/app_util.dart';
import '../../../../core/common/injection/injection.dart';
import '../../../../core/common/local_storage/hive_services.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../core/common/widgets/text_field_widget.dart';
import '../../../../generated/assets.dart';
import '../bloc/auth_bloc.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  TextEditingController phone = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();
  TextEditingController password = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(MediaQuery.sizeOf(context).height * .16),
      child: FormBuilder(
        key: _formKey,
        child: BlocProvider(
          create: (context) => locator.get<AuthBloc>(),
          child: Scaffold(
            body: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state.registerStatue.isFail()) {
                  // ignore: use_build_context_synchronously
                  showSnackBar(
                    context: context,
                    text: state.registerStatue.error ??"_",
                    icon: Icons.cancel_outlined,
                    colors: Colors.red,
                  );
                }
                if (state.registerStatue.isSuccess()) {
                  // ignore: use_build_context_synchronously
                  showSnackBar(
                    context: context,
                    text: "قم بوضع رمز التأكيد",
                    icon: Icons.check_circle_outline,
                    colors: Colors.green,
                  );
                  Navigator.of(context).pushReplacementNamed(
                    Routes.otp,
                    arguments: {
                      'phone': phone.text,
                      'password': password.text,
                    },
                  );
                  setGeneral("phone",phone.text);
                  setGeneral("password",password.text);
                  setGeneral("otp","yes");
                }
              },
              builder: (context, state) {
                return state.registerStatue.isLoading()
                    ? Center(
                        child: Lottie.asset(
                          Assets.lottieTimer,
                          fit: BoxFit.fill,
                          repeat: true,
                          height: 150,
                        ),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              helloSection(context),
                              TextFieldWidget(
                                controller: fullName,
                                label: 'اسم المستخدم',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                                hintText: 'قم بكتابة اسم المستخدم',
                                icon: Icons.person,
                                obscureText: false,
                              ),
                              SizedBox(height: 16),
                              TextFieldWidget(
                                name: "email",
                                keyBoardType: TextInputType.emailAddress,
                                controller: email,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.email(),
                                ]),
                                label: 'البريد الالكتروني',
                                hintText: 'قم بكتابة البريد الإلكتروني',
                                icon: Icons.mail_outline,
                                obscureText: false,
                              ),
                              SizedBox(height: 16),
                              TextFieldWidget(
                                keyBoardType: TextInputType.number,
                                controller: phone,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly, // Only allow digits
                                ],
                                label: 'رقم هاتف',
                                hintText: '966356273712',
                                icon: Icons.phone_android,
                                obscureText: false,
                              ),
                              SizedBox(height: 16),
                              TextFieldWidget(
                                controller: password,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                                label: 'كلمة المرور',
                                hintText: 'كتابة كلمة المرور',
                                icon: Icons.lock,
                                obscureText: false,
                              ),
                              SizedBox(height: 16),
                              TextFieldWidget(
                                controller: passwordConfirmation,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                                label: 'كلمة المرور',
                                hintText: 'قم باعادة كتابة كلمة المرور',
                                icon: Icons.lock,
                                obscureText: false,
                              ),
                              SizedBox(height: 16),
                              Container(
                                width: double.infinity,
                                child: ElevatedButtonWidget(
                                    width: ScreenSizeUtil.width(context),
                                    onPressed: () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        _formKey.currentState?.saveAndValidate();
                                        context.read<AuthBloc>().add(
                                              Register(
                                                registerParams: RegisterParams(
                                                    password: password.text,
                                                    phone: phone.text,
                                                    type: getType(),
                                                    email: email.text,
                                                    fullName: fullName.text,
                                                    passwordConfirmation:
                                                        passwordConfirmation
                                                            .text),
                                              ),
                                            );
                                      }
                                    },
                                    text: "انشاء حساب"),
                              ),
                              SizedBox(height: 10,),
                              RichText(
                                text: TextSpan(
                                  style: CustomTextStyle.titleSmall(
                                    context,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'لديك حساب؟',
                                      style: CustomTextStyle.titleSmall(context,
                                          color: AppColors.grey),
                                    ),
                                    TextSpan(
                                      text: 'تسجيل الدخول',
                                      style: TextStyle(
                                          color: AppColors.primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
              },
            ),
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
          "انشاء حسابك الخاص",
          style: CustomTextStyle.titleMedium(
            context,
          ),
        ),
      ],
    );
  }
}

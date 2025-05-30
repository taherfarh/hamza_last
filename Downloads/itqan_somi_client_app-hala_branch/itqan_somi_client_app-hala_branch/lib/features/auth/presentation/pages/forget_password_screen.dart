import 'package:client_app/features/auth/data/model/params/phone_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: BlocProvider(
        create: (context) => locator.get<AuthBloc>(),
        child: Scaffold(
          body: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.phoneStatue.isFail()) {
                // ignore: use_build_context_synchronously
                showSnackBar(
                  context: context,
                  text: state.phoneStatue.error.toString(),
                  icon: Icons.cancel_outlined,
                  colors: Colors.red,
                );
              }
              if (state.phoneStatue.isSuccess()) {
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushNamed(
                  Routes.otForgetPassword,
                  arguments: {
                    'phone': phoneController.text,
                  },
                );
              }
            },
            builder: (context, state) {
              return state.phoneStatue.isLoading()
                  ? Center(
                      child: Lottie.asset(
                        Assets.lottieTimer,
                        fit: BoxFit.fill,
                        repeat: true,
                        height: 150,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                            "هل نسيت كلمة المرور",
                            style: CustomTextStyle.titleSmall(context,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "قم بكتابة رقم الهاتف لاعادة تعيين كلمة المرور",
                            style: CustomTextStyle.titleSmall(context,
                                color: AppColors.grey),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFieldWidget(
                            controller: phoneController,
                            label: 'رقم هاتف',
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly, // Only allow digits
                            ],
                            hintText: 'قم بكتابة رقم الهاتف',
                            keyBoardType: TextInputType.number,
                            icon: Icons.phone_android,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            obscureText: false,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: double.infinity,
                            child: ElevatedButtonWidget(
                                width: ScreenSizeUtil.width(context),
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    context.read<AuthBloc>().add(
                                          Phone(
                                            phoneParams: PhoneParams(
                                              phone: phoneController.text,
                                            ),
                                          ),
                                        );
                                  }
                                },
                                text: "ارسال"),
                          ),
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}

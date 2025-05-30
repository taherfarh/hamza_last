import 'package:client_app/profile/data/model/params/change_password_profile_param.dart';
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
import '../state/profile_bloc.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  TextEditingController newPassword = TextEditingController();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: BlocProvider(
        create: (context) => locator.get<ProfileBloc>(),
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state.changePasswordProfileStatue.isFail()) {
              showSnackBar(
                context: context,
                text: state.changePasswordProfileStatue.error.toString(),
                icon: Icons.cancel_outlined,
                colors: Colors.red,
              );
            }
            if (state.changePasswordProfileStatue.isSuccess()) {
              newPassword.clear();
              oldPassword.clear();
              confirmNewPassword.clear();
              showSnackBar(
                context: context,
                text: "تم تغيير كلمة السر بنجاح",
                icon: Icons.check_circle_outline,
                colors: Colors.green,
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: state.changePasswordProfileStatue.isLoading()
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
                          TextFieldWidget(
                            controller: oldPassword,
                            label: 'كلمة المرور القديمة',
                            hintText: 'كتابة كلمة القديمة',
                            icon: Icons.lock_outline,
                            obscureText: false,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFieldWidget(
                            name: 'newPassword',
                            controller: newPassword,
                            label: 'كلمة المرور الجديدة',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirm password is required';
                              }
                              if (value !=
                                  _formKey.currentState
                                      ?.fields['ConfirmPassword']?.value) {
                                return 'Password must match';
                              }
                              return null;
                            },
                            hintText: 'كتابة كلمة المرور الجديدة',
                            icon: Icons.lock_outline,
                            obscureText: false,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFieldWidget(
                            name: 'ConfirmPassword',
                            // Unique name for this field
                            controller: confirmNewPassword,
                            label: 'تأكيد كلمة المرور',
                            hintText: 'قم بتأكيد كلمة المرور',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirm password is required';
                              }
                              if (value !=
                                  _formKey.currentState?.fields['newPassword']
                                      ?.value) {
                                return 'Password must match';
                              }
                              return null;
                            },
                            icon: Icons.lock_outline,
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
                                      _formKey.currentState?.saveAndValidate();
                                      context.read<ProfileBloc>().add(
                                            ChangePasswordProfile(
                                              changePasswordProfileParams:
                                                  ChangePasswordProfileParams(
                                                      oldPassword:
                                                          oldPassword.text,
                                                      passwordConfirmation:
                                                          confirmNewPassword
                                                              .text,
                                                      password:
                                                          newPassword.text),
                                            ),
                                          );
                                    }
                                  },
                                  text: "اعادة تعين كلمة المرور")),
                        ],
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}

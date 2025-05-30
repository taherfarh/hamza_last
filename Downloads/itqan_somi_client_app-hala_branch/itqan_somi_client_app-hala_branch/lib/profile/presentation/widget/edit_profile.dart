import 'dart:io';
import 'package:client_app/profile/data/model/params/profile_setting_params.dart';
import 'package:client_app/profile/presentation/state/profile_bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../core/common/config/colors.dart';
import '../../../core/common/constant/strings.dart';
import '../../../core/common/injection/injection.dart';
import '../../../core/common/widgets/app_bar_widget.dart';
import '../../../generated/assets.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool isEditable = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<ProfileBloc>()
        ..add(
          EditProfile(profileSettingParams: ProfileSettingParams()),
        ),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.editProfileStatue.isSuccess()) {
            _controller.text =
                state.editProfileStatue.model?.appUser?.fullName ?? "_";
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(context, "إعدادات الحساب"),
            body: state.editProfileStatue.isSuccess()
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("تعديل الاسم"),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _controller,
                                readOnly: !isEditable,
                                // Make the text field read-only if not editable
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter text here',
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(isEditable ? Icons.check : Icons.edit),
                              // Change icon based on edit state
                              onPressed: () {
                                setState(() {
                                  isEditable = !isEditable;
                                });
                                context.read<ProfileBloc>().add(
                                  EditProfile(
                                    profileSettingParams: ProfileSettingParams(
                                      data: FormData.fromMap(
                                        {
                                          'full_name': _controller.text
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Lottie.asset(
                      Assets.lottieTimer,
                      fit: BoxFit.fill,
                      repeat: true,
                      height: 150,
                    ),
                  ),
          );
        },
      ),
    );
  }
}

import 'dart:io';

import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/features/auth/data/model/params/image_for_register_param.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/common/constant/dimension.dart';
import '../../../../core/common/helper/app_util.dart';
import '../../../../core/common/injection/injection.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../generated/assets.dart';
import '../bloc/auth_bloc.dart';

class ConfirmIdentityPage extends StatefulWidget {
  const ConfirmIdentityPage({super.key});

  @override
  State<ConfirmIdentityPage> createState() => _ConfirmIdentityPageState();
}

class _ConfirmIdentityPageState extends State<ConfirmIdentityPage> {
  PlatformFile? pickedFile;
  PlatformFile? freeFile;


  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles( type: FileType.image,);

    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }
  Future selectFreeFile() async {
    final result = await FilePicker.platform.pickFiles( type: FileType.image,);

    if (result == null) return;
    setState(() {
      freeFile = result.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final phone = args['phone'];
    return BlocProvider(
      create: (context) => locator.get<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.uploadStatue.isSuccess()) {
            showSnackBar(
              context: context,
              text: "تم الرفع بنجاح",
              icon: Icons.check_circle_outline,
              colors: Colors.green,
            );
            Navigator.of(context).pushNamedAndRemoveUntil(Routes.sendRequestPage,(Route<dynamic> route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: state.uploadStatue.isLoading()
                ? Center(
                    child: Lottie.asset(
                      Assets.lottieTimer,
                      fit: BoxFit.fill,
                      repeat: true,
                      height: 150,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Column(
                            children: [
                              Text(
                                "أهلا بك",
                                style: CustomTextStyle.headlineLarge(context,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor),
                              ),
                              Text("إتشاء حسابك الخاص"),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text("رفع البطاقة الشخصية"),
                              SizedBox(
                                height: 10,
                              ),
                              if (pickedFile != null)
                                Center(
                                  child: Image.file(
                                    File(pickedFile!.path??""), // Use File to convert path to Image
                                    width: 300, // Set width as needed
                                    height: 300, // Set height as needed
                                    fit: BoxFit.cover, // Adjust the fit as needed
                                  ),
                                ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: selectFile,
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.grey)),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.upload,
                                        color: AppColors.primaryColor,
                                      ),
                                      Text(
                                        "قم برفع الملف",
                                        style: CustomTextStyle.titleSmall(context,
                                            color: AppColors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("رفع السجل التجاري أو وثيقة العمل الحر"),
                              SizedBox(
                                height: 10,
                              ),
                              if (freeFile != null)
                                Center(
                                  child: Image.file(
                                    File(freeFile!.path??""), // Use File to convert path to Image
                                    width: 300, // Set width as needed
                                    height: 300, // Set height as needed
                                    fit: BoxFit.cover, // Adjust the fit as needed
                                  ),
                                ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: selectFreeFile,
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.grey)),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.upload,
                                        color: AppColors.primaryColor,
                                      ),
                                      Text(
                                        "قم برفع الملف",
                                        style: CustomTextStyle.titleSmall(context,
                                            color: AppColors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: double.infinity,
                                child: ElevatedButtonWidget(
                                    width: ScreenSizeUtil.width(context),
                                    onPressed: () {
                                      print(pickedFile?.path);
                                      context.read<AuthBloc>().add(
                                            UploadSuccess(
                                              uploadParams: UploadParams(
                                                password: "12345678",
                                                phone: phone,
                                                documentImage:
                                                    pickedFile?.path ?? "",
                                                idImage: freeFile?.path ?? "",
                                              ),
                                            ),
                                          );
                                    },
                                    text: "انشاء حساب"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}

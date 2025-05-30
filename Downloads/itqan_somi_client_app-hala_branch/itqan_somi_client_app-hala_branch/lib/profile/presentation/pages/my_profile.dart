import 'dart:io';

import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/constant/strings.dart';
import 'package:client_app/core/common/widgets/shimmer.dart';
import 'package:client_app/profile/data/model/params/profile_setting_params.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../core/common/config/styles.dart';
import '../../../core/common/injection/injection.dart';
import '../../../core/common/local_storage/hive_services.dart';
import '../../../core/common/routes/app_routes.dart';
import '../../../core/common/widgets/app_bar_widget.dart';
import '../../../core/common/widgets/show_adaptive_diologe.dart';
import '../../../generated/assets.dart';
import '../state/profile_bloc.dart';

class MyProfilePage extends StatefulWidget {
  MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  PlatformFile? pickedFile;

  Future selectFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
      print("object");
      print(pickedFile!.path);
    });
    if (pickedFile != null) {
      context.read<ProfileBloc>().add(
            EditProfile(
              profileSettingParams: ProfileSettingParams(
                data: FormData.fromMap(
                  {
                    'image': await MultipartFile.fromFile(pickedFile!.path!,
                        filename: 'image.jpg'),
                    'full_name': 'mahmou'
                  },
                ),
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(getToken());
    return BlocProvider(
      create: (context) {
        final bloc = locator.get<ProfileBloc>();
        if (getToken() != null) {
          bloc.add(EditProfile(profileSettingParams: ProfileSettingParams()));
        }

        return bloc;
      },
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "الملف الشخصي",
                style: CustomTextStyle.titleMedium(context,
                    color: AppColors.white),
              ),
              backgroundColor: AppColors.primaryColor,
            ),
            body: state.editProfileStatue.isSuccess() ||
                    state.editProfileStatue.isInitial()
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  selectFile(context);
                                },
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primaryColor,
                                    border: Border.all(
                                        color: AppColors.primaryColor),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: pickedFile != null
                                          ? FileImage(
                                              File(pickedFile!.path ?? ""),
                                              // Use File to convert path to Image
                                            )
                                          : state.editProfileStatue.model
                                                      ?.appUser?.image !=
                                                  null
                                              ? NetworkImage(
                                                  "${AppStrings.imageString}${state.editProfileStatue.model?.appUser?.image}",
                                                )
                                              : AssetImage(Assets.pngMen),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primaryColor,
                                  ),
                                  child: SvgPicture.asset(
                                    Assets.svgPen,
                                  ),
                                ),
                              )
                            ],
                          ),
                          if (getToken() != null)
                            buildSettingItem(
                                Assets.svgPassword, "إعدادات تعيين كلمة المرور",
                                () {
                              Navigator.of(context).pushNamed(
                                Routes.changePasswordInProfile,
                              );
                            }),
                          if (getToken() != null)
                            if (getType().toString() == "client")
                              buildSettingItem(
                                Assets.svgPassword,
                                "إعدادات الحساب",
                                () {
                                  Navigator.of(context).pushNamed(
                                    Routes.editProfile,
                                  );
                                },
                              ),
                          if (getToken() != null)
                            if (getType().toString() == "client")
                              buildSettingItem(
                                Assets.svgFav,
                                "المفضلة",
                                () {
                                  Navigator.of(context).pushNamed(
                                    Routes.allFav,
                                  );
                                },
                              ),
                          if (getToken() != null)
                            if (getType().toString() == "client")
                              buildSettingItem(
                                Assets.svgStar,
                                "عناويني",
                                () {
                                  Navigator.of(context).pushNamed(
                                    Routes.allAddresses,
                                  );
                                },
                              ),
                          buildSettingItem(
                            Assets.svgLike,
                            "السياسة والخصوصية",
                            () {
                              Navigator.of(context).pushNamed(
                                Routes.privacy,
                              );
                            },
                          ),
                          buildSettingItem(
                            Assets.svgLike,
                            "نبذة عنا",
                            () {
                              Navigator.of(context).pushNamed(
                                Routes.aboutUs,
                              );
                            },
                          ),
                          if (getType().toString() == "service_provider")
                            buildSettingItem(Assets.svgLike, "الحسابات البنكية",
                                () {
                              Navigator.of(context).pushNamed(
                                Routes.bank,
                              );
                            }),
                          if (getToken() != null)
                            buildSettingItem(
                              Assets.svgLike,
                              "تسجيل الخروج",
                              () {
                                showAdaptiveAlertDialog(
                                  context: context,
                                  // title: AppLocalizations.of(context)!.translate('sign_out'),
                                  actions: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 18,
                                          ),
                                          child: Text(
                                            "خروج",
                                            style: CustomTextStyle.titleMedium(
                                              context,
                                              color: AppColors.primaryColor,
                                            )!
                                                .copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            left: 2,
                                            right: 2,
                                            top: 2,
                                          ),
                                          alignment:
                                              AlignmentDirectional.center,
                                          child: Text(
                                            "هل أنت متأكد",
                                            style: CustomTextStyle.titleMedium(
                                              context,
                                              color: AppColors.black,
                                            )!
                                                .copyWith(
                                              fontSize: 15,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 18.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              // height: 48.h,
                                              width: 80,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  surfaceTintColor:
                                                      AppColors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5.0,
                                                    ),
                                                  ),
                                                  shadowColor: AppColors.grey
                                                      .withOpacity(
                                                    0.9,
                                                  ),
                                                  elevation: 3,
                                                ),
                                                child: Text(
                                                  "لا",
                                                  textAlign: TextAlign.center,
                                                  style: CustomTextStyle
                                                          .titleSmall(
                                                    context,
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  )!
                                                      .copyWith(
                                                    fontSize: 11,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              // height: 48.h,
                                              width: 80,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        AppColors.primaryColor,
                                                    shadowColor: AppColors.grey
                                                        .withOpacity(
                                                      0.9,
                                                    ),
                                                    elevation: 3,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5.0,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "نعم",
                                                    textAlign: TextAlign.center,
                                                    style: CustomTextStyle
                                                            .titleSmall(context,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: AppColors
                                                                    .white)!
                                                        .copyWith(
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                  onPressed: () async {
                                                    setToken(null);
                                                    Navigator.of(context)
                                                        .pushNamedAndRemoveUntil(
                                                            Routes
                                                                .chooseAccount,
                                                            (Route<dynamic>
                                                                    route) =>
                                                                false);
                                                  }),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 18.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          if (getToken() == null)
                            buildSettingItem(
                              Assets.svgLike,
                              "تسجيل الدخول",
                              () {
                                Navigator.of(context).pushNamed(
                                  Routes.chooseAccount,
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: ShimmerWidget(),
                  ),
          );
        },
      ),
    );
  }

  Widget buildSettingItem(String icon, String text, void Function()? onTap) {
    return InkWell(
      hoverColor: AppColors.primaryColor,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AppColors.scafold,
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(text),
              ],
            ),
            Icon(
              Icons.arrow_back_ios_new,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:client_app/core/common/widgets/show_adaptive_diologe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/colors.dart';
import '../config/styles.dart';

class LogOut extends StatelessWidget {
  final String text;
  final Color color;
  final Color colorText;
  final double fontSize;

  const LogOut({
    required this.text,
    this.color = AppColors.primaryColor,
    this.colorText = AppColors.white,
    this.fontSize = 25,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showAdaptiveAlertDialog(
          context: context,
          // title: AppLocalizations.of(context)!.translate('sign_out'),
          actions: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
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
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "تأكيد",
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      // height: 48.h,
                      width: 80,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            surfaceTintColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                5.0,
                              ),
                            ),
                            shadowColor: AppColors.grey.withOpacity(
                              0.9,
                            ),
                            elevation: 3,
                          ),
                          child: Text(
                            "لا",
                            textAlign: TextAlign.center,
                            style: CustomTextStyle.titleSmall(
                              context,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            )!
                                .copyWith(
                              fontSize: 11,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                    Container(
                      // height: 48.h,
                      width: 80,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shadowColor: AppColors.grey.withOpacity(
                              0.9,
                            ),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                5.0,
                              ),
                            ),
                          ),
                          child: Text(
                            "نعم",
                            textAlign: TextAlign.center,
                            style: CustomTextStyle.titleSmall(context,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white)!
                                .copyWith(
                              fontSize: 11,
                            ),
                          ),
                          onPressed: () async {
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.0,
                ),
              ],
            )
          ],
        );
      },
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              8,
            ),
          ),
        ),
        child: Center(
          child: Text(
           "ااا",
            style: CustomTextStyle.titleMedium(
              context,
              color: colorText,
              fontWeight: FontWeight.bold,
            )!
                .copyWith(
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}

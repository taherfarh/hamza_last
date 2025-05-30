import 'package:client_app/core/common/constant/dimension.dart';
import 'package:client_app/core/common/local_storage/hive_services.dart';
import 'package:client_app/core/common/routes/app_routes.dart';
import 'package:client_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common/config/colors.dart';
import '../../../../core/common/config/styles.dart';
import '../../../../core/common/widgets/elevated_button_widget.dart';
import 'on_boarding_content.dart';

class ChooseAccount extends StatefulWidget {
  double width;

  ChooseAccount({super.key, required this.width});

  @override
  State<ChooseAccount> createState() => _ChooseAccountState();
}

class _ChooseAccountState extends State<ChooseAccount> {
  int? _selectedIndex;

  void _onItemClick(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
    if (index == 0) {
      print("client");
      setType("client");
      print(getType());
    } else if (index == 1) {
      print("service_provider");
      setType("service_provider");
      print(getType());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            helloSection(context),
            bodySection(context),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _onItemClick(0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedIndex == 0
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: SvgPicture.asset(
                      Assets.svgUser,
                      width: ScreenSizeUtil.width(context) / 3,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _onItemClick(1),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedIndex == 1
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Image.asset(
                      Assets.pngServices,
                      width: ScreenSizeUtil.width(context) / 3,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              child: ElevatedButtonWidget(
                  width: widget.width,
                  onPressed: () {
                    if (_selectedIndex == null) {
                      setType("client");
                    }
                    Navigator.of(context).pushNamed(
                      Routes.logIn,
                    );
                  },
                  text: "متابعة"),
            )
          ],
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

  Widget bodySection(BuildContext context) {
    return Column(
      children: [
        Text(
          contents[3].title,
          style: CustomTextStyle.headlineMedium(context,
              color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        ),
        Text(
          contents[3].desc,
          style: CustomTextStyle.titleSmall(context, color: AppColors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/core/common/lang/app_localization.dart';
import 'package:client_app/core/common/widgets/elevated_button_widget.dart';
import 'package:client_app/features/root/presentation/pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/choose_account.dart';
import '../widget/on_boarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Color(0xFF000000),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: _currentPage + 1 == contents.length
          ? RootPage()
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                TextButton(
                  onPressed: () {
                    _controller.jumpToPage(3);
                  },
                  style: TextButton.styleFrom(
                    elevation: 0,
                    textStyle: CustomTextStyle.titleSmall(context)
                  ),
                  child:  Text(
                    "Skip".tr(context),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: _controller,
                    onPageChanged: (value) =>
                        setState(() => _currentPage = value),
                    itemCount: contents.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              // Wrap the Image.asset with Expanded
                              child: SvgPicture.asset(
                                contents[i].image,
                                // Remove fixed height here, let it be flexible
                              ),
                            ),
                            SizedBox(
                              height: (height >= 840) ? 60 : 30,
                            ),
                            Text(
                              contents[i].title,
                              style: CustomTextStyle.headlineMedium(context,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              contents[i].desc,
                              style: CustomTextStyle.bodyLarge(context,
                                  color: AppColors.black),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                          (int index) => _buildDots(
                            index: index,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(30),
                        child: ElevatedButtonWidget(width: width, onPressed:  () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          );
                        }, text: "التالي")
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

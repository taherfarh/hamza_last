import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/core/common/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lottie/lottie.dart';

import '../../../core/common/injection/injection.dart';
import '../../../generated/assets.dart';
import '../state/profile_bloc.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<ProfileBloc>()
        ..add(AboutUs())
        ..add(OurVision())
        ..add(OurMessage())
        ..add(
          Privacy(),
        ),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(context, "نبذة عني"),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: state.aboutUsStatue.isSuccess() &&
                      state.ouVisionStatue.isSuccess() &&
                      state.ouMessageStatue.isSuccess()
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "من نحن",
                            style: CustomTextStyle.titleMedium(context,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Html(
                              data:
                                  state.aboutUsStatue.model?.aboutUs?.aboutUs ??
                                      ""),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "رؤيتنا",
                            style: CustomTextStyle.titleMedium(context,
                                fontWeight: FontWeight.bold),
                          ),
                          Html(
                              data: state.ouVisionStatue.model?.ourVision
                                      ?.ourVision ??
                                  ""),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "رسالتنا",
                            style: CustomTextStyle.titleMedium(context,
                                fontWeight: FontWeight.bold),
                          ),
                          Html(
                              data: state.ouMessageStatue.model?.ourMessage
                                      ?.ourMessage ??
                                  ""),
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
            ),
          );
        },
      ),
    );
  }
}

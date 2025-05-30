import 'package:client_app/core/common/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lottie/lottie.dart';

import '../../../core/common/injection/injection.dart';
import '../../../generated/assets.dart';
import '../state/profile_bloc.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<ProfileBloc>()..add(Privacy()),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(context, "السياسة والخصوصية"),
            body: state.privacyStatue.isSuccess()
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        Html(
                            data: state.privacyStatue.model?.privacyPolicy
                                    ?.privacyPolicy ??
                                "_")
                      ],
                    )),
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

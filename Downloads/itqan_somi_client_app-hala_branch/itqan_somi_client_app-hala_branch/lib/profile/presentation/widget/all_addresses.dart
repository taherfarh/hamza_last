import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/core/common/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../core/common/injection/injection.dart';
import '../../../generated/assets.dart';
import '../state/profile_bloc.dart';

class AllAddresses extends StatelessWidget {
  const AllAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "عناويني"),
      body: BlocProvider(
        create: (context) =>
            locator.get<ProfileBloc>()..add(AllAddressesEvent()),
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state.allAddressesStatue.isSuccess()
                ? ListView.builder(
                    itemCount:
                        state.allAddressesStatue.model?.addresses?.data?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: AppColors.scafold,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "العنوان",
                                    style: CustomTextStyle.bodySmall(context,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(state.allAddressesStatue.model?.addresses
                                          ?.data?[index].title ??
                                      "_"),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "الموقع",
                                    style: CustomTextStyle.bodySmall(context,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(state.allAddressesStatue.model?.addresses
                                          ?.data?[index].location ??
                                      "_"),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "النوع",
                                    style: CustomTextStyle.bodySmall(context,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(state.allAddressesStatue.model?.addresses
                                          ?.data?[index].type ??
                                      "_"),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "البلد",
                                    style: CustomTextStyle.bodySmall(context,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(state.allAddressesStatue.model?.addresses
                                          ?.data?[index].country ??
                                      "_"),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "الطابق",
                                    style: CustomTextStyle.bodySmall(context,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(state.allAddressesStatue.model?.addresses
                                          ?.data?[index].floor ??
                                      "_"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Lottie.asset(
                      Assets.lottieTimer,
                      fit: BoxFit.fill,
                      repeat: true,
                      height: 150,
                    ),
                  );
          },
        ),
      ),
    );
  }
}

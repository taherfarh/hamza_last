import 'package:client_app/features/home/presentation/state/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/common/config/colors.dart';
import '../../../../../core/common/constant/strings.dart';
import '../../../../../generated/assets.dart';
import '../../bloc/home_bloc.dart';

class ProvideServicesWidget extends StatefulWidget {
  List<Map<String, String>> contentList;
  String selectedFilter;

  ProvideServicesWidget(
      {required this.contentList, required this.selectedFilter});

  @override
  State<ProvideServicesWidget> createState() => _ProvideServicesWidgetState();
}

class _ProvideServicesWidgetState extends State<ProvideServicesWidget> {
  static String? selectedServicesProvider;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Expanded(
          flex: 3,
          child: ListView.builder(
            padding: EdgeInsets.all(20),
            itemCount: state
                .allProviderModelStatue.model?.serviceProviders?.data?.length,
            itemBuilder: (context, index) {
              return Card(
                color: AppColors.scafold,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: state.allProviderModelStatue.model
                                ?.serviceProviders?.data![index].image ==
                            null
                        ? AssetImage(Assets.pngPerson)
                        : NetworkImage(
                            '${AppStrings.imageString}${state.allProviderModelStatue.model?.serviceProviders?.data![index].image}'), // Replace with your image asset
                  ),
                  title: Text(state.allProviderModelStatue.model
                          ?.serviceProviders?.data?[index].fullName ??
                      "_"),
                  subtitle: Text(DateTime.parse(state
                              .allProviderModelStatue
                              .model
                              ?.serviceProviders
                              ?.data?[index]
                              .createdAt ??
                          "2024-11-26T10:11:43.000000Z")
                      .toLocal()
                      .toString()),
                  trailing: Radio<String>(
                    value: state.allProviderModelStatue.model?.serviceProviders
                            ?.data?[index].fullName ??
                        "_",
                    groupValue: selectedServicesProvider,
                    onChanged: (value) {
                      setState(() {
                        selectedServicesProvider = value!;
                        print("object");
                        print(state.allProviderModelStatue.model
                            ?.serviceProviders?.data?[index].id);
                        context.read<HomeProvider>().setProvideServicesId(state
                                .allProviderModelStatue
                                .model
                                ?.serviceProviders
                                ?.data?[index]
                                .id
                                .toString() ??
                            "");
                        print(context.read<HomeProvider>().provideServicesId);
                      });
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

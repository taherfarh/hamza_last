import 'package:client_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../core/common/constant/dimension.dart';
import '../../../core/common/injection/injection.dart';
import '../../../core/common/routes/app_routes.dart';
import '../../../core/common/widgets/app_bar_widget.dart';
import '../../../generated/assets.dart';
import 'details_item.dart';

class DepartmentDetails extends StatelessWidget {
  const DepartmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    int id = args['id'];
    return BlocProvider(
      create: (context) =>
          locator.get<HomeBloc>()..add(ServicesByCategories(id)),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(context, "تفاصيل القسم"),
            body: state.servicesCategoriesStatue.isSuccess()
                ? ListView.builder(
                    itemCount: state
                        .servicesCategoriesStatue.model?.services?.data?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              Routes.detailsPage,
                              arguments: {
                                'id': state.servicesCategoriesStatue.model
                                    ?.services?.data?[index].id
                              },
                            );
                          },
                          child: DepartmentItem(
                            homeState: state,
                            index: index,
                          ),);
                    },
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

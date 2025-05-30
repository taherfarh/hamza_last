import 'package:flutter/material.dart';

import '../../../../../core/common/constant/dimension.dart';
import '../../../../../core/common/routes/app_routes.dart';
import '../../../../../core/common/widgets/app_bar_widget.dart';
import '../popular_services_provider.dart';

class AllServicesProvider extends StatelessWidget {
  const AllServicesProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final state = args['state'];
    return Scaffold(
      appBar: appBar(context, "عرض الكل"),
      body:  ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: state.popularServicesProviderStatue.model
        !.popularServiceProviders!.data!.length > 6? 6 : state.popularServicesProviderStatue.model
            ?.popularServiceProviders?.data?.length??
            0,
        itemBuilder: (context, index) {
          return FittedBox(
            child: PopularServicesProviderPage(
              state: state,
              index: index,
            ),
          );
        },
      ),



    );
  }
}

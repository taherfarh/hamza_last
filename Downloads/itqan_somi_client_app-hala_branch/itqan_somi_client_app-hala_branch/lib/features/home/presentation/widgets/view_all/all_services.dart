import 'package:flutter/material.dart';

import '../../../../../core/common/constant/dimension.dart';
import '../../../../../core/common/widgets/app_bar_widget.dart';
import '../services_card_widget.dart';

class AllServices extends StatelessWidget {
  const AllServices({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final state = args['state'];
    return Scaffold(
      appBar: appBar(context, "عرض الكل"),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount:
            state.popularServicesStatue.model!.popularServices!.data!.length,
        itemBuilder: (context, index) {
          return FittedBox(
              child: ServiceCard(
            state: state,
            index: index,
          ));
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/common/constant/dimension.dart';
import '../../../../../core/common/widgets/app_bar_widget.dart';
import '../services_card_widget.dart';
import '../services_form_setting_card.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final state = args['state'];
    return Scaffold(
      appBar: appBar(context, "عرض الكل"),
      body:  ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: state
            .servicesFormSettingStatue.model!.services!.data!.length > 6? 6 :state
            .servicesFormSettingStatue.model?.services?.data?.length,
        itemBuilder: (context, index) {
          return FittedBox(
              child: ServicesFormSettingCard(
                index: index,
                state: state,
              ));
        },
      ),

    );
  }
}

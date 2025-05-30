import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/features/home/presentation/widgets/services_details_widget/similir_card_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/common/config/styles.dart';
import '../../../../../core/common/constant/dimension.dart';
import '../../../../../core/common/routes/app_routes.dart';
import '../../bloc/home_bloc.dart';

class AboutWidget extends StatelessWidget {
  HomeState homeState;

  AboutWidget({super.key, required this.homeState});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: AppColors.scafold,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "الوصف",
                  style: CustomTextStyle.bodyMedium(context,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  homeState.detailsServicesStatue.model?.service?.desc ?? '-',
                  style: CustomTextStyle.bodyMedium(context),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "متوفر في",
          style: CustomTextStyle.titleSmall(context,
              color: AppColors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          homeState.detailsServicesStatue.model?.service?.locationAddress ??
              "غير متوفر في هذه الفترة",
          style: CustomTextStyle.titleSmall(context,
              color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Text(
              "${homeState.detailsServicesStatue.model?.service?.locationNeighborhood ?? "_"} - ${homeState.detailsServicesStatue.model?.service?.locationCity ?? "_"}",
              style: CustomTextStyle.titleSmall(
                context,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Card(
          color: AppColors.scafold,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "العمل في",
                  style: CustomTextStyle.bodyMedium(context,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                homeState.detailsServicesStatue.model!.service!.workingHours!
                        .isEmpty
                    ? SizedBox(
                        width: double.infinity,
                        child: Text("لا يوجد أوقات عمل"),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: homeState.detailsServicesStatue.model
                            ?.service?.workingHours?.length,
                        itemBuilder: (context, index) {
                          final startTime = DateTime.parse("2025-01-01 ${homeState.detailsServicesStatue.model?.service?.workingHours?[index].startHour}"); // تاريخ افتراضي
                          final endTime = DateTime.parse("2025-01-01 ${homeState.detailsServicesStatue.model?.service?.workingHours?[index].endHour}");

                          // تنسيق الوقت إلى صيغة 12 ساعة (AM/PM)
                          final formattedStartTime = DateFormat.jm().format(startTime);
                          final formattedEndTime = DateFormat.jm().format(endTime);
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(homeState.detailsServicesStatue.model
                                      ?.service?.workingHours?[index].day ??
                                  "_"),
                              Text(
                                "$formattedStartTime$formattedEndTime",
                              )
                            ],
                          );
                        },
                      )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        if( homeState
            .detailsServicesStatue.model!.service!.questions!.isNotEmpty)
        Text(
          "الأسئلة الشائعة",
          style:
              CustomTextStyle.titleSmall(context, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: homeState
                .detailsServicesStatue.model?.service?.questions?.length,
            itemBuilder: (context, index) {
              return Card(
                color: AppColors.scafold,
                child: ExpansionTile(
                  leading: Icon(
                    Icons.add_circle,
                    color: AppColors.primaryColor,
                  ),
                  title: Text(
                    homeState.detailsServicesStatue.model?.service
                            ?.questions?[index].question ??
                        "_",
                    style: CustomTextStyle.titleSmall(context),
                  ),
                  children: <Widget>[
                    ListTile(
                        title: Text(homeState.detailsServicesStatue.model
                                ?.service?.questions?[index].answer ??
                            "_")),
                  ],
                ),
              );
            }),
        SizedBox(
          height: 10,
        ),
        Text(
          "الخدمات المماثلة",
          style:
              CustomTextStyle.titleSmall(context, fontWeight: FontWeight.bold),
        ),
        homeState.detailsServicesStatue.model!.similarServices!.isNotEmpty?
        SizedBox(
          height: ScreenSizeUtil.height(context) / 3.50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeState
                    .detailsServicesStatue.model?.similarServices?.length ??
                0,
            itemBuilder: (context, index) {
              return FittedBox(
                  child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.detailsPage,
                      arguments: {
                        'id': homeState.detailsServicesStatue.model
                            ?.similarServices?[index].id
                      });
                },
                child: SimilarCard(
                  state: homeState,
                  index: index,
                ),
              ));
            },
          ),
        ):
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "لا توجد خدمات مماثلة حاليًا",
            style: CustomTextStyle.titleMedium(context, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

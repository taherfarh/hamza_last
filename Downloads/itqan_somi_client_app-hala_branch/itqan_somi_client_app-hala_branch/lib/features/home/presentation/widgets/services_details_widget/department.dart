import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/config/colors.dart';
import '../../../../../core/common/config/styles.dart';
import '../../../../../core/common/constant/dimension.dart';
import '../../../../../core/common/constant/strings.dart';
import '../../../../../generated/assets.dart';
import '../../bloc/home_bloc.dart';
import '../../state/home_provider.dart';

class Department extends StatefulWidget {
  HomeState homeState;

  Department({super.key, required this.homeState});

  @override
  State<Department> createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  Set<String> selectedAdditions = {};
  Set<String> additionsId = {};
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          "الاضافات",
          style: CustomTextStyle.titleSmall(context, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final additionTitle = widget.homeState.detailsServicesStatue.model?.service?.additions?[index].title ?? "_";
            final isSelected = selectedAdditions.contains(additionTitle); // Check if the addition is selected

            return Card(
              color: AppColors.light_gray,
              child: ListTile(
                leading: Card(
                  child: widget.homeState.detailsServicesStatue.model?.service?.additions?[index].image == null
                      ? Image.asset(Assets.pngPerson)
                      : Image.network(
                    "${AppStrings.imageString}${widget.homeState.detailsServicesStatue.model?.service?.additions?[index].image}",
                    width: 50,
                    height: 50,
                  ),
                ),
                title: Text(
                  additionTitle,
                  style: CustomTextStyle.titleSmall(context, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.homeState.detailsServicesStatue.model?.service?.additions?[index].desc ?? "_",
                      style: CustomTextStyle.bodySmall(context, color: AppColors.grey)?.copyWith(fontSize: 10),
                    ),
                    Text(
                      "${widget.homeState.detailsServicesStatue.model?.service?.additions?[index].price} ريال سعودي ",
                      style: CustomTextStyle.bodySmall(context, color: AppColors.grey)?.copyWith(fontSize: 10),
                    ),
                  ],
                ),
                trailing: Checkbox(
                  value: isSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        selectedAdditions.add(additionTitle);
                        additionsId.add(widget.homeState.detailsServicesStatue.model!.service!.additions![index].id.toString());
                        context.read<HomeProvider>().setAddition(additionsId.toList());
                        print(context.read<HomeProvider>().additionId);
                      } else {
                        selectedAdditions.remove(additionTitle);
                        additionsId.remove(widget.homeState.detailsServicesStatue.model!.service!.additions![index].id.toString());
                        context.read<HomeProvider>().setAddition(additionsId.toList());
                        print(context.read<HomeProvider>().additionId);

                      }
                    });
                  },
                ),
              ),
            );
          },
          itemCount: widget.homeState.detailsServicesStatue.model?.service?.additions?.length,
        ),
        SizedBox(height: 100),
      ],
    );
  }
}

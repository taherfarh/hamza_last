import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/core/common/widgets/app_bar_widget.dart';
import 'package:client_app/features/payment/presentation/widgets/select_details_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/config/colors.dart';
import '../../../../core/common/constant/dimension.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String selectedFilter = "الدفع كاش";

  // Filters list
  List<String> filters = ["الدفع اونلاين", "الدفع كاش"];
  List<IconData> icons = [Icons.money, Icons.monetization_on];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "الحجوزات"),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "قم باختيار وسائل الدفع",
              style: CustomTextStyle.titleSmall(context,
                  fontWeight: FontWeight.bold,color: AppColors. black),
            ),
            SizedBox(height: 10,),
            Center(
              child: Container(
                height: ScreenSizeUtil.height(context) / 5.50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemExtent: ScreenSizeUtil.width(context) / 2.10,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            selectedFilter = filters[index];
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedFilter == filters[index]
                              ? AppColors.primaryColor
                              : AppColors.scafold,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        height: 10,
                        width: ScreenSizeUtil.width(context) / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              filters[index],
                              style: TextStyle(
                                color: selectedFilter == filters[index]
                                    ? AppColors.white
                                    : AppColors.black,
                                fontWeight: selectedFilter == filters[index]
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            Icon(icons[index],
                                size: 50,
                                color: selectedFilter == filters[index]
                                    ? AppColors.white
                                    : AppColors.black)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SelectDetailsContent(selectedFilter: selectedFilter,)
          ],
        ),
      ),
    );
  }
}

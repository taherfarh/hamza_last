import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:flutter/material.dart';

class CashPay extends StatelessWidget {
  const CashPay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "معلومات الدفع",
            style: CustomTextStyle.titleSmall(context,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20,),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "السعر",
                style: CustomTextStyle.titleSmall(context),
              ),
              Text(
                "200.00 ",
                style: CustomTextStyle.titleSmall(context,color: AppColors.grey),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ضريبة القيمة المضافة",
                style: CustomTextStyle.titleSmall(context,),
              ),
              Text(
                "200.00",
                style: CustomTextStyle.titleSmall(context,color: AppColors.grey),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "الخصم",
                style: CustomTextStyle.titleSmall(context,),
              ),
              Text(
                "0.00",
                style: CustomTextStyle.titleSmall(context,color: AppColors.grey),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "الاجمالي",
                style: CustomTextStyle.titleSmall(context,
                    fontWeight: FontWeight.bold,color: AppColors.primaryColor),
              ),
              Text(
                "0.00",
                style: CustomTextStyle.titleSmall(context,color: AppColors.primaryColor,fontWeight: FontWeight.bold,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

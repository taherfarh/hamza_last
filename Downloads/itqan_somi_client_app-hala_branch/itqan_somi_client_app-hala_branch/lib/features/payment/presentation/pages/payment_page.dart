import 'package:client_app/core/common/widgets/app_bar_widget.dart';
import 'package:client_app/core/common/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/config/colors.dart';
import '../../../../core/common/config/styles.dart';
import '../../../../core/common/constant/dimension.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../core/common/widgets/text_field_widget.dart';

class PaymentPage extends StatelessWidget {


  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "الدفع"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "الخدمات",
                style: CustomTextStyle.bodySmall(context,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: ScreenSizeUtil.height(context) / 4,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: AppColors.light_gray,
                      child: Row(
                        children: [
                          Card(
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSscMQdSeh_fhd99Maw3ZS0xeNASHGS3Wuatg&s",
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "اسم الخدمة",
                                style: CustomTextStyle.titleSmall(context,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "وصف الخدمة",
                                style: CustomTextStyle.titleSmall(context,
                                    color: AppColors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: 3,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    Routes.addNewLocationPage,
                  );
                },
                label: 'عنوانك',
                labelColor: AppColors.black,
                hintText: 'أدخل موقعك',
                icon: Icons.location_on,
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "اختر من الخريطة",
                    style: CustomTextStyle.titleSmall(context,
                            fontWeight: FontWeight.bold)
                        ?.copyWith(fontSize: 10),
                  ),
                  Text(
                    "استخدم العنوان الحالي",
                    style: CustomTextStyle.titleSmall(context,
                            fontWeight: FontWeight.bold)
                        ?.copyWith(fontSize: 10),
                  ),
                  Text(
                    "إضافة عنوان جديد",
                    style: CustomTextStyle.titleSmall(context,
                            fontWeight: FontWeight.bold)
                        ?.copyWith(fontSize: 10),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                label: 'الوصف',
                labelColor: AppColors.black,
                onTap: () {},
                hintText: 'قم بكتابة وصف تريد تقديمه لمقدم الخدمة',
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "معلومات الدفع",
                style: CustomTextStyle.titleSmall(context,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("السعر"),
                      Text(
                        "200.00 ",
                        style: CustomTextStyle.titleSmall(context,
                            color: AppColors.grey),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ضريبة القيمة المضافة"),
                      Text(
                        "200.00 ",
                        style: CustomTextStyle.titleSmall(context,
                            color: AppColors.grey),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("الخصم"),
                      Text(
                        "00.00 ",
                        style: CustomTextStyle.titleSmall(context,
                            color: AppColors.grey),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "الاجمالي",
                        style: CustomTextStyle.titleSmall(context,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor),
                      ),
                      Text(
                        "200.00 ",
                        style: CustomTextStyle.titleSmall(context,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButtonWidget(
                    width: ScreenSizeUtil.width(context),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        Routes.bookingPage,
                      );
                    },
                    text: "حجز موعد"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

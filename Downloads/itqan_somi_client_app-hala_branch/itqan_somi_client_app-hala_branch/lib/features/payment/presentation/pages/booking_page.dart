import 'package:client_app/core/common/widgets/shimmer.dart';
import 'package:client_app/features/payment/presentation/widgets/select_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/common/config/colors.dart';
import '../../../../core/common/config/styles.dart';
import '../../../../core/common/constant/dimension.dart';
import '../../../../core/common/injection/injection.dart';
import '../../../../core/common/local_storage/hive_services.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../core/common/widgets/app_bar_widget.dart';
import '../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../generated/assets.dart';
import '../../data/model/params/filter_order_params.dart';
import '../bloc/payment_bloc.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  // Track selected filter
  String selectedFilter = "الكل";

  // Filters list
  List<String> filters = [
    "الكل",
    "المقبولة",
    "الجارية",
    "ملغاة",
  ];


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) {
        return locator.get<PaymentBloc>()
          ..add(
            AllOrder(
              filterOrderParams: FilterOrderParams(status: ""),
            ),
          );
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "الطلبات",
            style: CustomTextStyle.titleMedium(context, color: AppColors.white),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        body: getToken() != null
            ? Padding(
                padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenSizeUtil.height(context) / 15,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedFilter = filters[index];
                                  if (selectedFilter == "الجارية") {
                                    context.read<PaymentBloc>().add(
                                          AllOrder(
                                            filterOrderParams:
                                                FilterOrderParams(
                                                    status: "pending"),
                                          ),
                                        );
                                  } else if (selectedFilter == "المقبولة") {
                                    context.read<PaymentBloc>().add(AllOrder(
                                        filterOrderParams: FilterOrderParams(
                                            status: "accepted")));
                                  } else if (selectedFilter == "ملغاة") {
                                    context.read<PaymentBloc>().add(
                                          AllOrder(
                                            filterOrderParams:
                                                FilterOrderParams(
                                                    status: "canceled"),
                                          ),
                                        );
                                  } else if (selectedFilter == "الكل") {
                                    context.read<PaymentBloc>().add(
                                          AllOrder(
                                            filterOrderParams:
                                                FilterOrderParams(status: ""),
                                          ),
                                        );
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: selectedFilter == filters[index]
                                      ? AppColors.orange
                                      : AppColors.scafold,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),
                                height: 10,
                                width: ScreenSizeUtil.width(context) / 3,
                                child: Center(
                                  child: Text(
                                    filters[index],
                                    style: TextStyle(
                                      color: selectedFilter == filters[index]
                                          ? AppColors.white
                                          : AppColors.black,
                                      fontWeight:
                                          selectedFilter == filters[index]
                                              ? FontWeight.bold
                                              : FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SelectDetailsContent(
                        selectedFilter: selectedFilter,
                      )
                    ],
                  ),
                ),
              )
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock,
                      size: 100,
                    ),
                     SizedBox(height: 10,),
                    Text("يرجى تسجيل الدخول"),
                    SizedBox(height: 10,),
                    ElevatedButtonWidget(
                        color: AppColors.primaryColor,
                        width: ScreenSizeUtil.width(context),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            Routes.chooseAccount,
                          );
                        },
                        text: "تسجيل"),
                  ],
                ),
              ),
      ),
    );
  }
}

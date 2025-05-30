import 'package:client_app/core/common/widgets/app_bar_widget.dart';
import 'package:client_app/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:client_app/features/payment/presentation/widgets/select_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/config/colors.dart';
import '../../../../core/common/constant/dimension.dart';
import '../../../../core/common/injection/injection.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  // Track selected filter
  String selectedFilter = "حالة الحجز";

  // Filters list
  List<String> filters = ["تفاصيل الحجز", "حالة الحجز"];

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    int id = args['orderId'];
    return BlocProvider(
      create: (context) => locator.get<PaymentBloc>()
        ..add(
          ShowOrder(id: id),
        ),
      child: Scaffold(
        appBar: appBar(context, "الحجوزات"),
        body:  Padding(
          padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: ScreenSizeUtil.height(context) / 15,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
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
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                            height: 10,
                            width:
                            ScreenSizeUtil.width(context) / 2.50,
                            child: Center(
                              child: Text(
                                filters[index],
                                style: TextStyle(
                                  color:
                                  selectedFilter == filters[index]
                                      ? AppColors.white
                                      : AppColors.black,
                                  fontWeight:
                                  selectedFilter == filters[index]
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SelectDetailsContent(
                  selectedFilter: selectedFilter,
                    id:id,
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}

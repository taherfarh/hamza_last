import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/core/common/constant/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/common/helper/app_util.dart';
import '../../../../../core/common/injection/injection.dart';
import '../../../../../core/common/routes/app_routes.dart';
import '../../../../../core/common/widgets/app_bar_widget.dart';
import '../../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../../generated/assets.dart';
import '../../../data/model/model/all_addresses_model.dart';
import '../../../data/model/params/add_carts_params.dart';
import '../../bloc/home_bloc.dart';
import '../../state/home_provider.dart';

class AddToCartWidget extends StatefulWidget {
  final List<Map<String, String>> workingHours;
  final HomeState homeState;
  final List<String> location;
  final int servicesId;

  const AddToCartWidget({
    super.key,
    required this.workingHours,
    required this.homeState,
    required this.location,
    required this.servicesId,
  });

  @override
  State<AddToCartWidget> createState() => _AddToCartWidgetState();
}

class _AddToCartWidgetState extends State<AddToCartWidget> {
  TimeOfDay? selectedTime;
  DateTime? selectedDate;
  String? selectedLocation;
  Map<String, int> locationIdMap = {};
  Datum? selectedAddress;

  void _selectTime(String day) {
    final hours =
        widget.workingHours.firstWhere((entry) => entry['day'] == day);
    final startTime = TimeOfDay.fromDateTime(
        DateTime.parse('1970-01-01 ${hours['start_time']}'));
    final endTime = TimeOfDay.fromDateTime(
        DateTime.parse('1970-01-01 ${hours['end_time']}'));

    // Generate available time slots in 30-minute intervals
    List<TimeOfDay> timeSlots = [];
    TimeOfDay current = startTime;

    while (current.hour < endTime.hour ||
        (current.hour == endTime.hour && current.minute < endTime.minute)) {
      timeSlots.add(current);
      current = TimeOfDay(hour: current.hour, minute: current.minute + 30);
      if (current.minute >= 60) {
        current = TimeOfDay(hour: current.hour + 1, minute: 0);
      }
    }

    // Show time picker dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Text('اختر توقيت', style: TextStyle(fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: ListBody(
              children: timeSlots.map((timeSlot) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTime = timeSlot;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300)),
                    ),
                    child: Text(
                      timeSlot.format(context),
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('إلغاء', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _selectDate(BuildContext context) async {
    // Find a valid initial date
    DateTime initialDate = selectedDate ?? DateTime.now();
    while (!isSelectable(initialDate)) {
      initialDate = initialDate.add(Duration(days: 1));
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
      selectableDayPredicate: (DateTime date) {
        // Check if the day is in the working list
        String dayOfWeek = DateFormat('EEEE').format(date).toLowerCase();
        return widget.workingHours
            .any((entry) => entry['day']?.toLowerCase() == dayOfWeek);
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
          String day = DateFormat('EEEE').format(picked);
          _selectTime(day);
        },
      );
    }
  }

  bool isSelectable(DateTime date) {
    String dayOfWeek = DateFormat('EEEE').format(date).toLowerCase();
    return widget.workingHours
        .any((entry) => entry['day']?.toLowerCase() == dayOfWeek);
  }

  @override
  Widget build(BuildContext context) {
    print(
        "${selectedDate.toString().split(' ')[0]} ${selectedTime?.format(context).split(' ')[0]}");
    return BlocProvider(
      create: (context) => locator.get<HomeBloc>(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.addCartsStatue.isFail()) {
            if (state.addCartsStatue.error ==
                "The date field must be a date after now.") {
              showSnackBar(
                context: context,
                text: "يجب عليك اختيار تاريخ بعد اليوم",
                icon: Icons.cancel,
                colors: Colors.red,
              );
            }

            if (state.addCartsStatue.error ==
                "this service for a different service provider from your cart do you want to delete the last service provider?") {
              showDialog(
                context: context,
                builder: (BuildContext contextt) {
                  return AlertDialog(
                    title: Text('هذه الخدمة لمزود خدمة مختلف'),
                    content: Text('هل تريد حذف مزود الخدمة الأخير؟'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('لا'),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                      TextButton(
                        child: Text('نعم'),
                        onPressed: () {
                          print(context.read<HomeProvider>().additionId);
                          context.read<HomeBloc>().add(
                                AddCart(
                                  params: AddCartsParams(
                                      additionIds:context.read<HomeProvider>().additionId,
                                      addressId: selectedAddress?.id.toString(),
                                      date:
                                          "${selectedDate.toString().split(' ')[0]} ${selectedTime?.format(context).split(' ')[0]}",
                                      serviceId: widget.servicesId.toString(),
                                      confirmDelete: "1"),
                                ),
                              );
                        },
                      ),
                    ],
                  );
                },
              );
            }
            if (state.addCartsStatue.error ==
                "This service is not available in this date!.") {
              showSnackBar(
                context: context,
                text: "الخدمة غير متوفرة في هذا التاريخ",
                icon: Icons.cancel,
                colors: Colors.red,
              );
            }
            else {
              showSnackBar(
                context: context,
                text: state.addCartsStatue.error.toString(),
                icon: Icons.check_circle_outline,
                colors: Colors.green,
              );
            }
          }
          if (state.addCartsStatue.isSuccess()) {
            showSnackBar(
              context: context,
              text: "تم الإضافة إلى السلة بنجاح",
              icon: Icons.check_circle_outline,
              colors: Colors.green,
            );
            Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.rootPage, (Route<dynamic> route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(context, "أضف إلى السلة"),
            body: SizedBox(
              height: MediaQuery.of(context).size.height / 1.20,
              width: double.infinity,
              child: state.addCartsStatue.isLoading()
                  ? Center(
                      child: Lottie.asset(
                        Assets.lottieTimer,
                        fit: BoxFit.fill,
                        repeat: true,
                        height: 150,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "التاريخ",
                            style: CustomTextStyle.titleMedium(context,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: ScreenSizeUtil.width(context) / 2,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(10)),
                              child:
                                  (selectedDate != null && selectedTime != null)
                                      ? Text(
                                          'يوم: ${selectedDate?.month}/${selectedDate?.day} \nالوقت: ${selectedTime!.format(context)}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Text("حدد تاريخ"),
                            ),
                          ),
                          Text(
                            "الموقع",
                            style: CustomTextStyle.titleMedium(context,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fillColor: AppColors.light_gray,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                            ),
                            hint: Text(
                              'اختر موقع مناسب',
                              style: TextStyle(color: AppColors.black),
                            ),
                            value: selectedLocation,
                            onChanged: (String? newValue) {
                              setState(
                                () {
                                  selectedLocation = newValue;
                                  selectedAddress = widget.homeState
                                      .allAddressesStatue.model?.addresses?.data
                                      ?.firstWhere(
                                    (address) =>
                                        address.location ==
                                        newValue, // Match by name
                                  );
                                  if (selectedAddress != null) {
                                    print(
                                        "Selected location ID: ${selectedAddress?.id}");
                                  } else {
                                    print("Location not found!");
                                  }
                                },
                              );
                            },
                            items:
                                widget.location.toSet().map((String location) {
                              return DropdownMenuItem<String>(
                                value: location,
                                child: Text(location),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed(
                                Routes.addNewLocationPage,
                              );
                            },
                            child: Text(
                              "أضف موقع جديد",
                              style: CustomTextStyle.titleMedium(context,
                                  color:Colors.red,fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Center(
                            child: ElevatedButtonWidget(
                              width: ScreenSizeUtil.width(context),
                              onPressed: () {
                                if (selectedTime == null ||
                                    selectedDate == null ||
                                    selectedLocation == null) {
                                  showSnackBar(
                                    context: context,
                                    text: "تأكد من اختيار جميع البيانات",
                                    icon: Icons.cancel,
                                    colors: Colors.red,
                                  );
                                }
                                context.read<HomeBloc>().add(
                                      AddCart(
                                        params: AddCartsParams(
                                            additionIds:context.read<HomeProvider>().additionId,
                                            addressId:
                                                selectedAddress?.id.toString(),
                                            date:
                                                "${selectedDate.toString().split(' ')[0]} ${selectedTime?.format(context).split(' ')[0]}",
                                            serviceId:
                                                widget.servicesId.toString(),
                                            confirmDelete: "0"),
                                      ),
                                    );
                              },
                              text: "أضف للسلة",
                              color: AppColors.orange,
                              textColor: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/core/common/constant/dimension.dart';
import 'package:client_app/core/common/widgets/app_bar_widget.dart';
import 'package:client_app/core/common/widgets/elevated_button_widget.dart';
import 'package:client_app/features/addresses/data/model/params/add_address_params.dart';
import 'package:client_app/features/addresses/presentation/state/addresses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/config/colors.dart';
import '../../../../core/common/helper/app_util.dart';
import '../../../../core/common/injection/injection.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../core/common/widgets/text_field_widget.dart';

class AddNewLocation extends StatefulWidget {
  const AddNewLocation({super.key});

  @override
  State<AddNewLocation> createState() => _AddNewLocationState();
}

class _AddNewLocationState extends State<AddNewLocation> {
  int _selectedIndex = 0;
  String type = "house";

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildType(int index, String title) {
    return GestureDetector(
      onTap: () {
        _onTabSelected(index);
        type = title;
      },
      child: Container(
        width: 100,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? AppColors.primaryColor
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ),
    );
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController floorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<AddressesBloc>(),
      child: BlocConsumer<AddressesBloc, AddressesState>(
        listener: (context, state) {
          if (state.createAddressesStatue.isSuccess()) {
            showSnackBar(
              context: context,
              text: "تم حفظ العنوان بنجاح",
              icon: Icons.check_circle_outline,
              colors: Colors.green,
            );
            Navigator.of(context).pushReplacementNamed(
              Routes.rootPage,
            );
          }
          if(state.createAddressesStatue.isFail()){
            showSnackBar(
              context: context,
              text: state.createAddressesStatue.error ??"_",
              icon: Icons.cancel,
              colors: Colors.green,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(context, "اضافة عنوان جديد"),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      fontWeightt: FontWeight.bold,
                      controller: titleController,
                      label: 'الاسم',
                      labelColor: AppColors.black,
                      hintText: 'إضافة اسم العنوان',
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // TextFieldWidget(
                    //   label: 'الموقع',
                    //   fontWeightt: FontWeight.bold,
                    //   labelColor: AppColors.black,
                    //   hintText: 'اضف موقعك',
                    //   obscureText: false,
                    // ),
                    // TextFieldWidget(
                    //   label: 'الموقع',
                    //   fontWeightt: FontWeight.bold,
                    //   labelColor: AppColors.black,
                    //   hintText: 'اضف موقعك',
                    //   obscureText: false,
                    // ),
                    Text(
                      "النوع",
                      style: CustomTextStyle.titleMedium(context,
                          color: AppColors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildType(0, 'office'),
                        _buildType(1, 'house'),
                        _buildType(2, 'other'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      label: 'العنوان',
                      controller: locationController,
                      fontWeightt: FontWeight.bold,
                      labelColor: AppColors.black,
                      hintText: 'إضافة اسم العنوان',
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextFieldWidget(
                            label: 'المدينة',
                            fontWeightt: FontWeight.bold,
                            controller: cityController,
                            labelColor: AppColors.black,
                            hintText: 'إضافة اسم المدينة',
                            obscureText: false,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFieldWidget(
                            label: 'البلد',
                            controller: countryController,
                            fontWeightt: FontWeight.bold,
                            labelColor: AppColors.black,
                            hintText: 'إضافة اسم البلد',
                            obscureText: false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextFieldWidget(
                            controller: houseController,
                            label: 'المنزل',
                            fontWeightt: FontWeight.bold,
                            labelColor: AppColors.black,
                            hintText: 'الاسم',
                            obscureText: false,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: TextFieldWidget(
                            label: 'الطابق',
                            controller: floorController,
                            labelColor: AppColors.black,
                            fontWeightt: FontWeight.bold,
                            hintText: 'إضافة رقم الطابق',
                            obscureText: false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child:
                      state.createAddressesStatue.isLoading()? Center(child: CircularProgressIndicator()):
                      ElevatedButtonWidget(
                          width: ScreenSizeUtil.width(context),
                          onPressed: () {
                            context.read<AddressesBloc>().add(
                                  AddAddresses(
                                    addAddressesParams: AddAddressesParams(
                                      title: titleController.text,
                                      type: type,
                                      defaultt: "1",
                                      longitude: "23.232",
                                      location: locationController.text,
                                      latitude: "23.232",
                                      house: houseController.text,
                                      floor: floorController.text,
                                      country: countryController.text,
                                      city: cityController.text,
                                    ),
                                  ),
                                );
                          },
                          text: "حفظ الموقع"),
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

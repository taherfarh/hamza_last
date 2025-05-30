import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/config/colors.dart';
import '../../../../../core/common/config/styles.dart';
import '../../../../../core/common/constant/dimension.dart';
import '../../../../../core/common/helper/app_util.dart';
import '../../../../../core/common/injection/injection.dart';
import '../../../../../core/common/routes/app_routes.dart';
import '../../../../../core/common/widgets/app_bar_widget.dart';
import '../../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../../core/common/widgets/text_field_widget.dart';
import '../../data/model/params/bank_account_param.dart';
import '../state/dash_borard_bloc.dart';

class AddNewBankAccount extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController IBAN = TextEditingController();
  TextEditingController bank = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<DashBorardBloc>(),
      child: Scaffold(
        appBar: appBar(context, "الحسابات البنكية"),
        body: BlocConsumer<DashBorardBloc, DashBorardState>(
          listener: (context, state) {
            if (state.createBankStatus.isSuccess()) {
              showSnackBar(
                context: context,
                text: "تم الإنشاء بنجاح",
                icon: Icons.check_circle_outline,
                colors: Colors.green,
              );
              Navigator.of(context).pushReplacementNamed(
                Routes.bank,
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFieldWidget(
                    keyBoardType: TextInputType.emailAddress,
                    label: 'اسم الحساب',
                    controller: title,
                    hintText: 'قم بكتابة اسم الحساب',
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    keyBoardType: TextInputType.emailAddress,
                    label: ' رقم الحساب',
                    controller: number,
                    hintText: 'قم بكتابة رقم الحساب البنكي',
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    keyBoardType: TextInputType.emailAddress,
                    label: 'رقم IBAN',
                    hintText: 'قم بكتابة رقم الايبان',
                    controller: IBAN,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    keyBoardType: TextInputType.emailAddress,
                    label: 'نوع البنك',
                    hintText: 'قم باختيار البنك التابع له الحساب',
                    obscureText: false,
                    controller: bank,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  state.createBankStatus.isLoading()
                      ? Center(child: CircularProgressIndicator())
                      : ElevatedButtonWidget(
                    width: ScreenSizeUtil.width(context),
                    text: "اضافة حساب بنكي جديد",
                          onPressed: () {
                            context.read<DashBorardBloc>().add(
                                  CreateBAnkAccount(
                                    createAccountBankParams:
                                        CreateAccountBankParams(
                                            title: title.text,
                                            bank: bank.text,
                                            IBAN: IBAN.text,
                                            number: number.text),
                                  ),
                                );
                          },
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

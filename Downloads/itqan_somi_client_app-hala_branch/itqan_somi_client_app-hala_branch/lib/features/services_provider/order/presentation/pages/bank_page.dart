import 'package:client_app/core/common/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/common/config/styles.dart';
import '../../../../../core/common/constant/dimension.dart';
import '../../../../../core/common/injection/injection.dart';
import '../../../../../core/common/routes/app_routes.dart';
import '../../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../../generated/assets.dart';
import '../state/dash_borard_bloc.dart';

class BankPage extends StatelessWidget {
  const BankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return locator.get<DashBorardBloc>()
          ..add(
            AccountBankEvent(),
          );
      },
      child: BlocConsumer<DashBorardBloc, DashBorardState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              centerTitle: true,
              title: Text(
                "الحساب البنكي",
                style: CustomTextStyle.titleMedium(context,
                    color: AppColors.white),
              ),
            ),
            body: state.getBank.isSuccess()
                ? state.getBank.model!.bankAccounts!.data!.isEmpty
                    ? Center(
                        child: Image.asset(Assets.pngBank),
                      )
                    : Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "بيانات الحساب البنكي",
                              style: CustomTextStyle.titleMedium(context,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              flex: 2,
                              child: ListView.builder(
                                  physics: AlwaysScrollableScrollPhysics(),
                                  itemCount: (state.getBank.model?.bankAccounts?.data?.length),
                                  itemBuilder: (context, index) {
                                    return Card(
                                      color: AppColors.white,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 5,right: 5),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text("اسم الحساب"),
                                            Text(state.getBank.model?.bankAccounts?.data?[index].title??"_"),
                                            Container(
                                              height: 20,
                                            ),
                                            Text("رقم الحساب"),
                                            Text(state.getBank.model?.bankAccounts?.data?[index].number??"_"),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text("رقم البيان"),
                                            Text(state.getBank.model?.bankAccounts?.data?[index].iban??"_"),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text("نوع البنك"),
                                            Text(state.getBank.model?.bankAccounts?.data?[index].bank??"_"),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            Center(
                              child: ElevatedButtonWidget(
                                  width: ScreenSizeUtil.width(context),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                      Routes.addBankAccount,
                                    );
                                  },
                                  text: "اضافة حساب بنكي جديد"),
                            ),
                          ],
                        ),
                      )
                : Center(
                    child: Lottie.asset(
                      Assets.lottieTimer,
                      fit: BoxFit.fill,
                      repeat: true,
                      height: 150,
                    ),
                  ),
          );
        },
      ),
    );
  }
}

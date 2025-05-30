import 'package:client_app/core/common/widgets/app_bar_widget.dart';
import 'package:client_app/features/payment/data/model/params/payment_params.dart';
import 'package:client_app/features/payment/data/model/params/send_id_method_params.dart';
import 'package:client_app/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:client_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/common/constant/dimension.dart';
import '../../../../core/common/helper/app_util.dart';
import '../../../../core/common/injection/injection.dart';
import '../../../../core/common/local_storage/hive_services.dart';
import '../../../../core/common/routes/app_routes.dart';
import '../../../../core/common/widgets/elevated_button_widget.dart';
import '../../../../core/common/widgets/text_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController paymentMethodController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final id = args['id'];
    return BlocProvider(
      create: (context) => locator.get<PaymentBloc>()
        ..add(
          AuthPayment(),
        ),
      child: BlocConsumer<PaymentBloc, PaymentState>(
        listener: (context, state) {
          if (state.authPaymentStatus.isSuccess()) {
            setGeneral("paymentToken", state.authPaymentStatus.model?.token);
            setGeneral("orderId", id.toString());
            print(getGeneral("paymentToken"));
          }
          if (state.paymentLinkStatus.isSuccess()) {
            setGeneral("paymentMethodId",
                state.paymentLinkStatus.model?.id.toString());
            Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.webPaymentForm, (Route<dynamic> route) => false,
                arguments: {"url": state.paymentLinkStatus.model?.clientUrl});
          }
          if (state.paymentLinkStatus.isFail()) {
            showSnackBar(
              context: context,
              text: state.paymentLinkStatus.error.toString(),
              icon: Icons.cancel,
              colors: Colors.red,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: appBar(context, "إكمال الدفع"),
              body: state.authPaymentStatus.isSuccess()
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Image.asset(
                              Assets.pngPaymob,
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                            ),
                            Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFieldWidget(
                                          controller: fullNameController,
                                          label: 'الاسم الكامل',
                                          hintText: 'الاسم الكامل',
                                          keyBoardType: TextInputType.text,
                                          icon: Icons.person,
                                          validator:
                                              FormBuilderValidators.compose(
                                            [
                                              FormBuilderValidators.required(),
                                            ],
                                          ),
                                          obscureText: false,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: TextFieldWidget(
                                          controller: emailController,
                                          label: 'الايميل',
                                          hintText: 'الايميل',
                                          keyBoardType:
                                              TextInputType.emailAddress,
                                          icon: Icons.email,
                                          validator:
                                              FormBuilderValidators.compose([
                                            FormBuilderValidators.required(),
                                          ]),
                                          obscureText: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  TextFieldWidget(
                                    controller: phoneController,
                                    label: 'رقم الهاتف',
                                    hintText: 'رقم الهاتف',
                                    keyBoardType: TextInputType.number,
                                    icon: Icons.phone_android,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                    ]),
                                    obscureText: false,
                                  ),
                                  const SizedBox(height: 10),
                                  TextFieldWidget(
                                    controller: priceController,
                                    label: 'السعر',
                                    hintText: 'السعر',
                                    keyBoardType: TextInputType.number,
                                    icon: Icons.price_change,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                    ]),
                                    obscureText: false,
                                  ),
                                  const SizedBox(height: 20),
                                  TextFieldWidget(
                                    controller: descriptionController,
                                    label: 'الوصف',
                                    hintText: 'الوصف',
                                    keyBoardType: TextInputType.text,
                                    icon: Icons.description,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                    ]),
                                    obscureText: false,
                                  ),
                                  const SizedBox(height: 20),
                                  TextFieldWidget(
                                    controller: paymentMethodController,
                                    label: 'Payment method',
                                    hintText: 'payment method',
                                    keyBoardType: TextInputType.text,
                                    icon: Icons.payment_outlined,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                    ]),
                                    obscureText: false,
                                  ),
                                  const SizedBox(height: 20),
                                  state.paymentLinkStatus.isLoading()
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : ElevatedButtonWidget(
                                          width: ScreenSizeUtil.width(context),
                                          onPressed: () async {
                                            if (formKey.currentState
                                                    ?.validate() ??
                                                false) {
                                              context.read<PaymentBloc>().add(
                                                    PaymentLinkEvent(
                                                      paymentParams:
                                                          PaymentParams(
                                                        description:
                                                            descriptionController
                                                                .text,
                                                        fullName:
                                                            fullNameController
                                                                .text,
                                                        email: emailController
                                                            .text,
                                                        amountCents:
                                                            priceController
                                                                .text,
                                                        paymentMethods:
                                                            paymentMethodController
                                                                .text,
                                                        phoneNumber:
                                                            "+${phoneController.text}",
                                                      ),
                                                    ),
                                                  );
                                            }
                                          },
                                          text: "دفع"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: Lottie.asset(
                        Assets.lottieTimer,
                        fit: BoxFit.fill,
                        repeat: true,
                        height: 150,
                      ),
                    ));
        },
      ),
    );
  }
}

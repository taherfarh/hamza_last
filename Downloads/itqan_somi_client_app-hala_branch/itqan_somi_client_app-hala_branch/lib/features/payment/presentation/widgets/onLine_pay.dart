import 'package:client_app/core/common/config/styles.dart';
import 'package:client_app/generated/assets.dart';
import 'package:flutter/material.dart';

class OnLinePay extends StatefulWidget {
  const OnLinePay({super.key});

  @override
  State<OnLinePay> createState() => _OnLinePayState();
}

class _OnLinePayState extends State<OnLinePay> {

  String _selectedPaymentMethod = 'visa';

  void _onPaymentMethodChanged(String? value) {
    setState(() {
      _selectedPaymentMethod = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'حدد البطاقة',
            style: CustomTextStyle.titleMedium(context, fontWeight: FontWeight.bold),          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PaymentOption(
                imagePath: Assets.pngPaypal,
                value: 'paypal',
                groupValue: _selectedPaymentMethod,
                onChanged: _onPaymentMethodChanged,
              ),
              PaymentOption(
                imagePath: Assets.pngPay,
                value: 'apple',
                groupValue: _selectedPaymentMethod,
                onChanged: _onPaymentMethodChanged,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PaymentOption(
                imagePath: Assets.pngMada,
                value: 'mada',
                groupValue: _selectedPaymentMethod,
                onChanged: _onPaymentMethodChanged,
              ),
              PaymentOption(
                imagePath: Assets.pngVisa,
                value: 'visa',
                groupValue: _selectedPaymentMethod,
                onChanged: _onPaymentMethodChanged,
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'قم بملأ بيانات البطاقة',
            style: CustomTextStyle.titleMedium(context, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final String imagePath;
  final String value;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  PaymentOption({
    required this.imagePath,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: 40,
          height: 40,
        ),
        SizedBox(width: 8),
        Radio<String>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
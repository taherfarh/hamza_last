import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../config/colors.dart';

class TextFieldWidget extends StatelessWidget {
  String label;
  String hintText;
  IconData? icon;
  bool obscureText;
  void Function()? onTap;
  int? maxLine;
  Color labelColor;
  TextInputType? keyBoardType;
  String? Function(String?)? validator;
  TextEditingController? controller = TextEditingController();
  List<TextInputFormatter>? inputFormatters ;
  void Function()? onEditingComplete;
  FontWeight? fontWeightt ;
  TextInputAction? textInputAction;
   String? name;

  TextFieldWidget({
    super.key,
     this.icon,
    this.keyBoardType,
    this.name,
    this.textInputAction,
    this.onEditingComplete,
    required this.hintText,
     this.fontWeightt,
    required this.label,
    required this.obscureText,
    this.onTap,
    this.inputFormatters,
    this.controller,
    this.validator,
    this.maxLine,
    this.labelColor =Colors.grey
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, color:labelColor ,fontWeight: fontWeightt),
        ),
        SizedBox(height: 4),
        FormBuilderTextField(
          key: key,
          keyboardType: keyBoardType,
          controller: controller,
          textInputAction: textInputAction,
          onEditingComplete: onEditingComplete,
          validator: validator,
          onTap: onTap,
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
            filled: true,
            fillColor: AppColors.buttonColor,
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            prefixIcon: Icon(icon, color: Colors.grey),
          ),
          textAlign: TextAlign.right,
          name: name ??"",
        ),
      ],
    );
  }
}

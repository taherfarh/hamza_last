// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hamza/core/responsive/responsive_size.dart';

class CustomTextFromfield extends StatelessWidget {
  const CustomTextFromfield({
    super.key,
    required this.controlar,
    required this.validator,
    required this.label,
    required this.obscureText,
    required this.textInputType,
    required this.iconData,
    required this.function,
  });

  final TextEditingController controlar;
  final String validator;
  final String label;
  final bool obscureText;
  final TextInputType textInputType;
  final IconData iconData;
  final Function() function;

  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return validator;
          }
          return null;
        },
        controller: controlar,
        obscureText: obscureText,
        keyboardType: textInputType,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          filled: true,
          fillColor: Colors.white,
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
         
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(width: 1, color: Colors.blue),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1, color: Color.fromARGB(255, 209, 207, 207)),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          label:Text(label,style: TextStyle(
                fontSize: ResponsiveSize(context: context, size: 20).size,
                fontWeight: FontWeight.bold,
                color: Colors.grey
              ),),
          labelStyle: const TextStyle(color: Colors.grey),
          suffixIcon: IconButton(
              onPressed: function,
              icon: Icon(
                iconData,
                color: Colors.grey,
              )),
        ));
  }
}

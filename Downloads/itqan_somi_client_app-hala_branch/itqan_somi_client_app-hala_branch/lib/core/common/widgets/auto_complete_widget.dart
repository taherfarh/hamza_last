import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/colors.dart';



class AutomataCompleteWidget extends StatelessWidget {
   AutomataCompleteWidget({super.key,  required this.suggestions,this.onSubmitted,required this.hintText});
  final List<String>? suggestions;
  dynamic Function(String)? onSubmitted;
  String? hintText ;
  @override
  Widget build(BuildContext context) {
    return EasyAutocomplete(
      autofocus: false,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
            vertical: 0, horizontal: 10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppColors.black,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
          borderSide:  BorderSide(
              color: AppColors.primaryColor,
              style: BorderStyle.solid),
        ),
      ),
      suggestions: suggestions,

      onChanged: (value) {},
      onSubmitted:onSubmitted,
    );
  }
}

import 'package:client_app/core/common/widgets/elevated_button_widget.dart';
import 'package:client_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../core/common/config/colors.dart';
import '../../../../../core/common/config/styles.dart';
import '../../../data/model/params/filter_params.dart';
import '../../state/home_provider.dart';

class RatingWidget extends StatefulWidget {
  const RatingWidget({super.key});

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  static String? rateSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            color: AppColors.scafold,
            child:  ListTile(
                    leading: Text(
                      '${index + 1}',
                      style: CustomTextStyle.titleSmall(context,
                          fontWeight: FontWeight.bold),
                    ),
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (starIndex) {
                        return Icon(
                          starIndex <= index ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 15.0, // Size of the stars
                        );
                      }),
                    ),
                    trailing: Radio<String>(
                      value: '${index + 1}',
                      groupValue: rateSelected,
                      onChanged: (value) {
                        setState(() {
                          rateSelected = value!;
                          print(rateSelected);
                          context.read<HomeProvider>().setRate(
                              rateSelected.toString() );
                          print(context.read<HomeProvider>().rate);
                        });
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}

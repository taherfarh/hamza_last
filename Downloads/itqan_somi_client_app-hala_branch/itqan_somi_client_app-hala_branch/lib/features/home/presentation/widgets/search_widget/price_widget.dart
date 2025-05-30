import 'package:client_app/core/common/config/colors.dart';
import 'package:client_app/core/common/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/home_provider.dart';

class PriceWidget extends StatefulWidget {
  const PriceWidget({super.key});

  @override
  State<PriceWidget> createState() => _PriceWidgetState();
}

class _PriceWidgetState extends State<PriceWidget> {
  static double _currentPrice = 1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("السعر",
                style: CustomTextStyle.headlineSmall(context,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1 رس", // Starting price label
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  "3000 رس", // Maximum price label
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: AppColors.primaryColor,
                // Brown color for the active slider track
                inactiveTrackColor: AppColors.primaryColor,
                // Light brown for the inactive track
                thumbColor: AppColors.primaryColor,
                // Brown color for the slider thumb
                overlayColor: AppColors.primaryColor.withOpacity(0.2),
                // Brown with opacity for the overlay
                trackHeight: 4.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
              ),
              child: Slider(
                value: _currentPrice,
                min: 1,
                max: 3000,
                divisions: 20,
                label: "${_currentPrice.toInt()}رس",
                onChanged: (value) {
                  setState(() {
                    _currentPrice = value;
                    context
                        .read<HomeProvider>()
                        .setPrice(_currentPrice.toString());
                    print(context.read<HomeProvider>().price);
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${_currentPrice.toInt()}رس",
                // Display the current selected price
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

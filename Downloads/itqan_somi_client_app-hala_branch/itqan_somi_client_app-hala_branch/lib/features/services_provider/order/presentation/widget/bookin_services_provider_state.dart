import 'package:client_app/core/common/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../../generated/assets.dart';
import '../state/dash_borard_bloc.dart';

class BookingServicesProviderState extends StatefulWidget {
  const BookingServicesProviderState({super.key});

  @override
  State<BookingServicesProviderState> createState() =>
      _BookingServicesProviderStateState();

}
final List<TimelineStep> steps = [];

class _BookingServicesProviderStateState
    extends State<BookingServicesProviderState> {
  @override
  bool isAccept = false;
  bool done = false;
  bool dateLine = false;
  List date = [];

  @override
  Widget build(BuildContext context) {
    print(isAccept);
    print("isAccept");
    return BlocConsumer<DashBorardBloc, DashBorardState>(
      listener: (context, state) {
        if (state.showOrderStatus.isSuccess()) {
          steps.clear();
          if (state.showOrderStatus.model?.order?.status == "accepted") {
            isAccept = true;
          }
          if (state.showOrderStatus.model?.order?.status == "delivered") {
            done = true;
          }
          for (int i = 0;
              i < state.showOrderStatus.model!.order!.orderItems!.length;
              i++) {
            date.add(state.showOrderStatus.model!.order!.orderItems![i].date);
          }
          for (int i = 0; i < date.length; i++) {
            if (DateTime.parse(date[i]).isAtSameMomentAs(DateTime.now()) ||
                DateTime.now().isAfter(
                  DateTime.parse(date[i]),
                )) {
              dateLine = true;
            }
          }
          steps.add(
            TimelineStep("الخدمة محجوزة بواسطة العميل", "", true),
          );
          steps.add(
            TimelineStep("الحجز مقبول من قبل مقدم الخدمة", "", isAccept),
          );
          steps.add(
            TimelineStep("انتقل إلى الموعد", "", dateLine && isAccept),
          );
          steps.add(
            TimelineStep("إنهاء الخدمة", "", done && dateLine && isAccept),
          );
        }
      },
      builder: (context, state) {
        return state.showOrderStatus.isSuccess()
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children:
                      steps.map((step) => buildTimelineStep(step)).toList(),
                ),
              )
            : Lottie.asset(
                Assets.lottieTimer,
                fit: BoxFit.fill,
                repeat: true,
                height: 150,
              );
      },
    );
  }
}

Widget buildTimelineStep(TimelineStep step) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Timeline Icon and Line
      Column(
        children: [
          // Step Icon
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: step.isCompleted ? AppColors.primaryColor : AppColors.grey,
            ),
            child: step.isCompleted
                ? Icon(
                    Icons.check,
                    color: AppColors.white,
                  )
                : SizedBox(),
          ),
          // Connector Line
          Container(
            width: 2,
            height: 50,
            color: step.isCompleted ? AppColors.primaryColor : AppColors.grey,
          ),
        ],
      ),
      const SizedBox(width: 16), // Space between icon and text
      // Step Details
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            step.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: step.isCompleted ? Colors.black : Colors.grey,
            ),
          ),
          if (step.timestamp.isNotEmpty)
            Text(
              step.timestamp,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
        ],
      ),
    ],
  );
}

class TimelineStep {
  final String title;
  final String timestamp;
  final bool isCompleted;

  TimelineStep(this.title, this.timestamp, this.isCompleted);
}

import 'package:client_app/features/notification/presentation/state/notification_bloc.dart';
import 'package:client_app/features/notification/presentation/widgets/show_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/common/config/colors.dart';
import '../../../../core/common/config/styles.dart';
import '../../../../core/common/widgets/read_more_widget.dart';

class NotificationItem extends StatelessWidget {
  NotificationState notificationState;
  int index;
  String id;

  NotificationItem(
      {super.key,
      required this.notificationState,
      required this.index,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          if (notificationState
                  .allNotification.model?.notifications?.data?[index].readAt ==
              null) {
            context.read<NotificationBloc>().add(
                  MarkAsRead(
                    id: id,
                  ),
                );
          }
          if (notificationState
                  .allNotification.model?.notifications?.data?[index].readAt !=
              null) {
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: AppColors.white,
                context: context,
                builder: (BuildContext buildContext) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: ShowNotificationPage(id: id),
                  );
                });
          }
        },
        child: notificationState.markAsRead.isLoading()
            ? Container()
            : Container(
                padding: const EdgeInsets.all(16),
                //  height:MediaQuery.sizeOf(context).height*0.1,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                  color: (notificationState.allNotification.model?.notifications
                              ?.data?[index].readAt ==
                          null)
                      ? AppColors.orange.withOpacity(0.5)
                      : AppColors.scafold,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ReadMoreText(
                          //
                          //   // stripHtml(
                          //     dataNotifier?.aNNOUNCEMENTBODY ?? '',
                          //   // ),
                          //   style: CustomTextStyle.titleSmall(context)?.copyWith(
                          //     height: 1.5,
                          //   ),
                          //   trimLines: 2,
                          //   colorClickableText: Colors.pink,
                          //   trimMode: TrimMode.Line,
                          //   trimCollapsedText: 'Show more',
                          //   trimExpandedText: 'less',
                          //   moreStyle: TextStyle(
                          //     fontSize: 14,
                          //     fontWeight: FontWeight.bold,
                          //     color: AppColors.primaryColor,
                          //   ),
                          //   lessStyle: TextStyle(
                          //     fontSize: 14,
                          //     fontWeight: FontWeight.bold,
                          //     color: AppColors.primaryColor,
                          //   ),
                          // ),
                          ReadMoreWidget(
                            htmlText: notificationState
                                    .allNotification
                                    .model
                                    ?.notifications
                                    ?.data?[index]
                                    .data
                                    ?.message ??
                                '',
                            maxLines: 1,
                          ),
                          // Container(
                          //   child: Html(
                          //     data: dataNotifier?.aNNOUNCEMENTBODY ?? '',
                          //     style: {
                          //       'body': Style(
                          //         maxLines: 2,
                          //       ),
                          //     },
                          //   ),
                          // ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              DateFormat('d MMMM y hh:mm a', 'ar').format(
                                  DateTime.parse(notificationState
                                              .allNotification
                                              .model
                                              ?.notifications
                                              ?.data?[index]
                                              .createdAt ??
                                          "_")
                                      .toLocal()),
                              style: CustomTextStyle.titleSmall(
                                context,
                                color: AppColors.orange,
                              )!
                                  .copyWith(fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      (notificationState.allNotification.model?.notifications
                                  ?.data?[index].readAt ==
                              null)
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ],
                ),
              ));
  }
}

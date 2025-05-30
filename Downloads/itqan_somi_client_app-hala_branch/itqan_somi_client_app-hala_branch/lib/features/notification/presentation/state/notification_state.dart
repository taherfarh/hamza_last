part of 'notification_bloc.dart';

@immutable
class NotificationState extends Equatable {
  final BlocStatus<AllNotificationModel> allNotification;
  final BlocStatus<Response> markAllAsRead;
  final BlocStatus<Response> markAsRead;
  final BlocStatus<ShowNotificationModel> showNotification;

  const NotificationState({
    this.allNotification = const BlocStatus(),
    this.markAllAsRead = const BlocStatus(),
    this.markAsRead = const BlocStatus(),
    this.showNotification = const BlocStatus(),
  });

  NotificationState copyWith({
    BlocStatus<AllNotificationModel>? allNotification,
    BlocStatus<Response>? markAllAsRead,
    BlocStatus<Response>? markAsRead,
    BlocStatus<ShowNotificationModel>? showNotification,
  }) {
    return NotificationState(
        allNotification: allNotification ?? this.allNotification,
        markAllAsRead: markAllAsRead ?? this.markAllAsRead,
        markAsRead: markAsRead ?? this.markAsRead,
        showNotification: showNotification ?? this.showNotification,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [allNotification, markAllAsRead, markAsRead, showNotification,];
}

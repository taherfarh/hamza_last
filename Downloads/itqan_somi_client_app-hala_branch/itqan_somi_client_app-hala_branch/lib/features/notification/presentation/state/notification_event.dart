part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent {}

class AllNotification extends NotificationEvent {
  AllNotification();

  @override
  List<Object?> get props => [];
}

class MarkAllAsRead extends NotificationEvent {
  MarkAllAsRead();

  @override
  List<Object?> get props => [];
}

class MarkAsRead extends NotificationEvent {
  String id;

  MarkAsRead({required this.id});

  @override
  List<Object?> get props => [id];
}

class ShowNotification extends NotificationEvent {
  String id;

  ShowNotification({required this.id});

  @override
  List<Object?> get props => [id];
}

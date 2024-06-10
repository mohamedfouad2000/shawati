part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class NotificationSucc extends NotificationState {
  final NotificationModel model;
  NotificationSucc({required this.model});
}

final class NotificationError extends NotificationState {
  final String msg;
  NotificationError({required this.msg});
}

final class GetNotificationCountLoading extends NotificationState {}

final class GetNotificationCountSucc extends NotificationState {
  final int count;
  GetNotificationCountSucc({required this.count});
}

final class GetNotificationCountError extends NotificationState {
  final String msg;
  GetNotificationCountError({required this.msg});
}

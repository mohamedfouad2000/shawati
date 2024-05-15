part of 'location_cubit.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationSucc extends LocationState {
  final String msq;
  LocationSucc({required this.msq});
}

final class LocationError extends LocationState {
  final String msg;
  LocationError({required this.msg});
}

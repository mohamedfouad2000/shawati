part of 'add_or_remove_fav_cubit.dart';

@immutable
sealed class AddOrRemoveFavState {}

final class AddOrRemoveFavInitial extends AddOrRemoveFavState {}

final class AddOrRemoveFavLoading extends AddOrRemoveFavState {}

final class ChangeIcon extends AddOrRemoveFavState {}

final class AddOrRemoveFavSucc extends AddOrRemoveFavState {
  final String msq;
  AddOrRemoveFavSucc({required this.msq});
}

final class AddOrRemoveFavError extends AddOrRemoveFavState {
  final String msg;
  AddOrRemoveFavError({required this.msg});
}

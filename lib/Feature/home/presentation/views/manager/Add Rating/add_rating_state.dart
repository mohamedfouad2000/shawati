part of 'add_rating_cubit.dart';

@immutable
sealed class AddRatingState {}

final class AddRatingInitial extends AddRatingState {}

final class AddRatingLoading extends AddRatingState {}

final class AddRatingSucc extends AddRatingState {
  final String msq;
  AddRatingSucc({required this.msq});
}

final class AddRatingError extends AddRatingState {
  final String msg;
  AddRatingError({required this.msg});
}

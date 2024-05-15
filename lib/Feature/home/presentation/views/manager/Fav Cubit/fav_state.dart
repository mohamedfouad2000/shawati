part of 'fav_cubit.dart';

@immutable
sealed class FavState {}

final class FavInitial extends FavState {}

final class FavLoading extends FavState {}

final class FavSuccess extends FavState {
  final FavModel model;
  FavSuccess({required this.model});
}

final class FavFailed extends FavState {
  final String message;
  FavFailed({required this.message});
}

part of 'get_max_min_cubit.dart';

@immutable
sealed class GetMaxMinState {}

final class GetMaxMinInitial extends GetMaxMinState {}

final class GetMinLoading extends GetMaxMinState {}

final class GetMinSucc extends GetMaxMinState {
  // final Model;
  // GetMinSucc({required this.Model});
}

final class GetMinError extends GetMaxMinState {
  final String msg;
  GetMinError({required this.msg});
}

final class GetMaxLoading extends GetMaxMinState {}

final class GetMaxSucc extends GetMaxMinState {
  final int min;
  final int max;
  // final Model;
  GetMaxSucc({required this.max, required this.min});
}

final class GetMaxError extends GetMaxMinState {
  final String msg;
  GetMaxError({required this.msg});
}

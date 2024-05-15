import 'package:shawati/Feature/home/data/model/search_model/search_model.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchDataLoading extends SearchState {}

final class ChangeIcon extends SearchState {}

final class SearchDataSucc extends SearchState {
  final SearchModel model;
  SearchDataSucc({required this.model});
}

final class SearchDataError extends SearchState {
  final String msg;
  SearchDataError({required this.msg});
}

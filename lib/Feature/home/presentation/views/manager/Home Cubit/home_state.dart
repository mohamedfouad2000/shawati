import 'package:shawati/Feature/home/data/model/home_model/home_model.dart';
import 'package:shawati/Feature/home/data/model/profile_model/profile_model.dart';
import 'package:shawati/Feature/home/data/model/search_model/search_model.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSucc extends HomeState {
  final HomeModel model;
  HomeSucc({required this.model});
}

final class HomeError extends HomeState {
  final String msg;
  HomeError({required this.msg});
}

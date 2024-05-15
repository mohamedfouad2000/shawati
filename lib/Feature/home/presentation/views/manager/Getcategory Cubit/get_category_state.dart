import 'package:shawati/Feature/home/data/model/home_model/category.dart';

sealed class GetCategoryState {}

final class GetCategoryInitial extends GetCategoryState {}

final class GetCategoryLoading extends GetCategoryState {}

final class GetCategorySucc extends GetCategoryState {
  final List<Category> list;
  GetCategorySucc({required this.list});
}

final class GetCategoryError extends GetCategoryState {
  final String msg;
  GetCategoryError({required this.msg});
}

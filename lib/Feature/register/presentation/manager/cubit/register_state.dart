import 'package:shawati/Feature/register/data/models/register_model/register_model.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSucc extends RegisterState {
  final RegisterModel model;
  RegisterSucc({
    required this.model,
  });
}

final class RegisterError extends RegisterState {
  final String eroorMsq;
  RegisterError({
    required this.eroorMsq,
  });
}

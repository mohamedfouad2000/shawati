import 'package:shawati/Feature/register/data/models/register_model/register_model.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final RegisterModel model;
  LoginSuccess(this.model);
}

class LoginFailed extends LoginState {
  final String msg;
  LoginFailed(this.msg);
}

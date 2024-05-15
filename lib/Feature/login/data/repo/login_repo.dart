import 'package:dartz/dartz.dart';
import 'package:shawati/Core/errors/failures.dart';
import 'package:shawati/Feature/register/data/models/register_model/register_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, RegisterModel>> loginUser(
      {required String phone, required String password});
}

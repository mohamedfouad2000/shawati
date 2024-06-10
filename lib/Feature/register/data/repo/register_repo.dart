import 'package:dartz/dartz.dart';
import 'package:shawati/Core/errors/failures.dart';
import 'package:shawati/Feature/register/data/models/register_model/register_model.dart';

abstract class RegisterRepo {
  Future<Either<Failure, RegisterModel>> registerUser(
      {required String name,
      required String phone,
      required String password,
      required String lang,
      required String fcmToken,
      required String confirmPassword});
}

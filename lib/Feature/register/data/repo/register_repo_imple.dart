import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Core/errors/failures.dart';
import 'package:shawati/Core/remote/dio_helper.dart';
import 'package:shawati/Feature/register/data/models/register_model/register_model.dart';
import 'package:shawati/Feature/register/data/repo/register_repo.dart';

class RegisterRepoImpl extends RegisterRepo {
  @override
  Future<Either<Failure, RegisterModel>> registerUser(
      {required String name,
      required String phone,
      required String password,
      required String confirmPassword}) async {
    RegisterModel? model;
    try {
      Response<dynamic> res =
          await DioHelper.postData(url: xREGISTERURL, data: {}, query: {
        'name': name,
        'phone': phone,
        'password': password,
        'password_confirmation': confirmPassword,
        'role': 1
      });
      print(res.data);
      if (res.data['status'] == 201) {
        model = RegisterModel.fromJson(res.data);
        return right(model);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(msq: e.toString()));
    }
  }
}

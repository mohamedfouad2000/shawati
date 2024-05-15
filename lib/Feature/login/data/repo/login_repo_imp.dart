import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Core/errors/failures.dart';
import 'package:shawati/Core/remote/dio_helper.dart';
import 'package:shawati/Feature/login/data/repo/login_repo.dart';
import 'package:shawati/Feature/register/data/models/register_model/register_model.dart';

class LoginRepoImpl extends LoginRepo {
  @override
  Future<Either<Failure, RegisterModel>> loginUser(
      {required String phone, required String password}) async {
    print("data");
    print(phone);
    print(password);

    RegisterModel? model;
    try {
      Response<dynamic> res =
          await DioHelper.postData(url: xLOGINURL, data: {}, query: {
        'phone': phone,
        'password': password,
      });
      print(res.data);
      if (res.data['status'] == 201 &&
          res.data['data']['user']['power'] == 'customer') {
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

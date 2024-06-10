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
      {required String phone,
      required String lang,
      required String password,
      required String fcmToken}) async {
    print("data");
    print(phone);
    print(password);

    RegisterModel? model;
    try {
      Response<dynamic> res = await DioHelper.postData(
          url: xLOGINURL,
          data: {},
          query: {
            'phone': phone,
            'password': password,
            'fcm_token': fcmToken,
            'lang': lang
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

  @override
  Future<Either<Failure, String>> logOut({required String fcmToken}) async {
    try {
      Response<dynamic> res = await DioHelper.postData(
          url: xLogoutUrl, data: {}, query: {'fcm_token': fcmToken});
      // print(res.data);
      print('print Aha Print ${res.data}');
      if (res.data['status'] == 201) {
        return right(res.data['msg'].toString());
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

import 'package:dio/dio.dart';
import 'package:shawati/Core/constans/const.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    print("dio Init");
    dio = Dio(BaseOptions(
      baseUrl: xBASEURL,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData({
    required String url,
    required data,
    Map<String, dynamic>? query,
  }) async {
    print('////request is  $url $data $query');

    dio!.options.headers = {
      'Authorization': 'Bearer $TOKEN',
      'Accept': 'application/json'
    };
    return await dio!.post(url, data: data, queryParameters: query);
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    print('////request is  $url $data $query');
    dio!.options.headers = {
      'Authorization': 'Bearer $TOKEN',
      'Accept': 'application/json'
    };
    print(" $url $data $query ");

    return await dio!.get(url, data: data, queryParameters: query);
  }

  // static Future<Response> getDataWhenLogin({
  //   required String url,
  // }) async {
  //   {
  //     print('from Get');
  //     dio!.options.headers = {};
  //   }
  //   return await dio!.get(url, data: {});
  // }
}

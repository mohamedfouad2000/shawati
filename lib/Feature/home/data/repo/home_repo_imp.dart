import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Core/errors/failures.dart';
import 'package:shawati/Core/remote/dio_helper.dart';
import 'package:shawati/Feature/home/data/model/booking_model/booking_model.dart';
import 'package:shawati/Feature/home/data/model/fav_model/fav_model.dart';
import 'package:shawati/Feature/home/data/model/home_model/category.dart';
import 'package:shawati/Feature/home/data/model/home_model/home_model.dart';
import 'package:shawati/Feature/home/data/model/min_max_model/min_max_model.dart';
import 'package:shawati/Feature/home/data/model/notification_model/notification_model.dart';
import 'package:shawati/Feature/home/data/model/payment_model/payment_model.dart';
import 'package:shawati/Feature/home/data/model/profile_model/profile_model.dart';
import 'package:shawati/Feature/home/data/model/search_model/search_model.dart';
import 'package:shawati/Feature/home/data/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failure, HomeModel>> getHomeData(
      {required int cateId, required String text}) async {
    HomeModel model;
    try {
      Response<dynamic> res = await DioHelper.getData(url: xHOMEURL, query: {
        if (cateId != -1) 'category_id': cateId,
        if (text != '') 'text': text,
      });
      print(res.data);
      if (res.data['status'] == 201) {
        model = HomeModel.fromJson(res.data);
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
  Future<Either<Failure, ProfileModel>> getProfile() async {
    ProfileModel model;
    try {
      Response<dynamic> res = await DioHelper.getData(url: xPROFILEURL);
      print(res.data);
      if (res.data['status'] == 201) {
        model = ProfileModel.fromJson(res.data);
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
  Future<Either<Failure, BookingModel>> getBooking() async {
    BookingModel model;
    try {
      Response<dynamic> res = await DioHelper.getData(url: xBookingEURL);

      print(res.data);
      if (res.data['status'] == 201) {
        model = BookingModel.fromJson(res.data);
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
  Future<Either<Failure, String>> updateProfile({
    required String name,
    required String phone,
    File? image,
    required String password,
    required String confpassword,
  }) async {
    try {
      print('$name $phone $image $password $confpassword');
      Response<dynamic> res = await DioHelper.postData(
        url: xUPDATEURL,
        data: FormData.fromMap({
          'name': name,
          'phone': phone,
          if (image != null)
            'image': await MultipartFile.fromFile(image.path,
                filename: image.path.split('/').last),
          'password': password,
          'password_confirmation': confpassword,
        }),
      );
      print(res.data);
      if (res.data["status"] == 201) {
        print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        return right(res.data["msg"]);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SearchModel>> searchData({
    required String text,
    required String categoryId,
    required String minPrice,
    required String maxPrice,
    required String bed,
    required String floor,
    required String bath,
    required String priceDuration,
    required String minarea,
    required String maxarea,
    required double lat,
    required double long,
  }) async {
    SearchModel model;
    try {
      print(
          'ahaha $categoryId $minPrice $maxPrice $bed $floor $bath $text $minarea $maxarea $priceDuration $lat $long');
      Response<dynamic> res = await DioHelper.getData(url: xSEARCHURL, query: {
        'category_id': categoryId,
        if (minPrice != '') 'min_price': minPrice,
        if (maxPrice != '') 'max_price': maxPrice,
        'bed': bed,
        'floor': floor,
        'bath': bath,
        'text': text,
        'min_area': minarea,
        'max_area': maxarea,
        'price_duration': priceDuration,
        'lat': lat != -1 ? lat : '',
        'long': long != -1 ? long : '',
      });
      print(res.data);
      if (res.data['status'] == 201) {
        model = SearchModel.fromJson(res.data);
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
  Future<Either<Failure, List<Category>>> getCategory() async {
    List<Category> category = [];
    try {
      Response<dynamic> res = await DioHelper.getData(url: xCATEGORIESURL);
      print(res.data);
      if (res.data['status'] == 201) {
        for (var item in res.data['data']) {
          category.add(Category.fromJson(item));
        }
        // model = HomeModel.fromJson(res.data);
        return right(category);
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
  Future<Either<Failure, String>> addBooking(
      {required int id,
      required String start,
      required String paymentMethod,
      required File image,
      required String end}) async {
    try {
      print(
          'aha is  id is $id $start ${image.path.split('/').last} $end $paymentMethod');
      Response<dynamic> res = await DioHelper.postData(
        url: xADDBOOKINGURL,
        data: FormData.fromMap({
          'service_id': id,
          'start_at': start,
          'end_at': end,
          'payment_method_id': paymentMethod,
          'attachment': await MultipartFile.fromFile(image.path,
              filename: image.path.split('/').last),
        }),
      );
      print(res.data);
      if (res.data["status"] == 201) {
        print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        return right(res.data["msg"]);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, NotificationModel>> getNotifications() async {
    // notifications
    NotificationModel model;
    try {
      Response<dynamic> res = await DioHelper.getData(url: xNOTIFICATIONURL);
      print(res.data);
      if (res.data['status'] == 201) {
        // for (var item in res.data['data']) {
        //   category.add(Category.fromJson(item));
        // }
        model = NotificationModel.fromJson(res.data);
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
  Future<Either<Failure, FavModel>> getFavList() async {
    FavModel? model = FavModel();

    try {
      Response<dynamic> res = await DioHelper.getData(url: xNOTIFICATIONURL);
      print(res.data);

      if (res.data['status'] == 201) {
        model = FavModel.fromJson(res.data);
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
  Future<Either<Failure, String>> setLocation(
      {required double lat, required double long}) async {
    try {
      Response<dynamic> res = await DioHelper.postData(
          data: {}, url: xSETLocation, query: {'lat': lat, 'lng': long});

      print(res.data);
      if (res.data['status'] == 201) {
        return right(res.data['msg']);
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
  Future<Either<Failure, String>> addSupport(
      {required String subject, required String message}) async {
    try {
      print(subject);
      print(message);
      Response<dynamic> res = await DioHelper.postData(
          url: xSupport,
          data: {},
          query: {'subject': subject, 'message': message});
      print(res.data);
      if (res.data["status"] == 201) {
        print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        return right(res.data["msg"]);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PaymentModel>> getPaymentMethod() async {
    PaymentModel model;
    try {
      Response<dynamic> res = await DioHelper.getData(url: xGetPayMENTMETHODS);
      print(res.data);
      if (res.data['status'] == 201) {
        // for (var item in res.data['data']) {
        //   category.add(Category.fromJson(item));
        // }
        model = PaymentModel.fromJson(res.data);
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
  Future<Either<Failure, String>> addRating(
      {required int id,
      required double rating,
      required String comment}) async {
    try {
      Response<dynamic> res = await DioHelper.postData(
          url: xAddRating,
          data: {},
          query: {'rating': rating, 'review': comment, 'service_id': id});
      print(res.data);
      if (res.data["status"] == 201) {
        print('||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
        return right(res.data["msg"]);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addFav({required int id}) async {
    try {
      Response<dynamic> res =
          await DioHelper.postData(url: xAddFav, data: {}, query: {
        'service_id': id,
      });
      print(res.data);
      if (res.data["status"] == 201) {
        print('');
        return right(res.data["msg"]);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> removeFav({required int id}) async {
    try {
      Response<dynamic> res =
          await DioHelper.postData(url: xRemoveFav, data: {}, query: {
        'service_id': id,
      });
      print(res.data);
      if (res.data["status"] == 201) {
        print('');
        return right(res.data["msg"]);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MinMaxModel>> getMinMaxPrice() async {
    MinMaxModel model;
    try {
      Response<dynamic> res = await DioHelper.getData(
        url: xGetMinMaxPrice,
        data: {},
      );
      print("aha");
      print(res.data);
      if (res.data["status"] == 201) {
        model = MinMaxModel.fromJson(res.data);
        return right(model);
      } else {
        return left(ServerFailure(msq: res.data['msg'].toString()));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }
}

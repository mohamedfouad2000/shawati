import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:shawati/Core/errors/failures.dart';
import 'package:shawati/Feature/home/data/model/admin_model/admin_model.dart';
import 'package:shawati/Feature/home/data/model/booking_model/booking_model.dart';
import 'package:shawati/Feature/home/data/model/booking_model/rental.dart';
import 'package:shawati/Feature/home/data/model/booking_with_id_model/booking_with_id_model.dart';
import 'package:shawati/Feature/home/data/model/fav_model/fav_model.dart';
import 'package:shawati/Feature/home/data/model/home_model/category.dart';
import 'package:shawati/Feature/home/data/model/home_model/home_model.dart';
import 'package:shawati/Feature/home/data/model/min_max_model/min_max_model.dart';
import 'package:shawati/Feature/home/data/model/notification_model/notification_model.dart';
import 'package:shawati/Feature/home/data/model/payment_model/payment_model.dart';
import 'package:shawati/Feature/home/data/model/profile_model/profile_model.dart';
import 'package:shawati/Feature/home/data/model/search_model/search_model.dart';
import 'package:shawati/Feature/home/data/model/serves_price_details_model/serves_price_details_model.dart';
import 'package:shawati/Feature/home/data/model/terms_and_privacy_model/terms_and_privacy_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, AdminModel>> addSupportDataMobileAndEmail();
  Future<Either<Failure, TermsAndPrivacyModel>> getTermsAndPrivacy();
  Future<Either<Failure, BookingWithIdModel>> getBookingDeatilsWithId(
      {required int id});
  Future<Either<Failure, String>> paymentMethod({
    required int bookingId,
    required int paymentMethodId,
    required File image,
  });
  Future<Either<Failure, String>> deleteAccount();
  Future<Either<Failure, HomeModel>> getHomeData(
      {required int cateId, required String text});
  Future<Either<Failure, String>> setLocation(
      {required double lat, required double long});
  Future<Either<Failure, ProfileModel>> getProfile();
  Future<Either<Failure, String>> updateProfile({
    required String name,
    required String phone,
    File? image,
    required String password,
    required String confpassword,
  });
  Future<Either<Failure, String>> addSupport(
      {required String subject, required String message});

  Future<Either<Failure, BookingModel>> getBooking();
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
  });

  Future<Either<Failure, List<Category>>> getCategory();

  Future<Either<Failure, String>> addBooking({
    required int id,
    required String start,
    required String end,
    required String coupon,

    // required String paymentMethod,
    // required File image,
  });
  Future<Either<Failure, NotificationModel>> getNotifications();

  Future<Either<Failure, FavModel>> getFavList();

  Future<Either<Failure, PaymentModel>> getPaymentMethod();
  Future<Either<Failure, String>> addRating({
    required int id,
    required double rating,
    required String comment,
  });
  Future<Either<Failure, String>> removeFav({required int id});
  Future<Either<Failure, String>> addFav({required int id});
  Future<Either<Failure, MinMaxModel>> getMinMaxPrice();
  Future<Either<Failure, ServesPriceDetailsModel>> getPricesDetails({
    required int serid,
    required String startAt,
    required String endAt,
    required String coupon,
    required int bookingId,
  });
  Future<Either<Failure, String>> changeLang({required String lang});
  Future<Either<Failure, int>> getBookingCount();
  Future<Either<Failure, int>> getNotificationsCount();
}

import 'package:shawati/Feature/home/data/model/booking_model/rental.dart';

class BookingWithIdModel {
  Rental? data;
  String? msg;
  int? status;

  BookingWithIdModel({this.data, this.msg, this.status});

  factory BookingWithIdModel.fromJson(Map<String, dynamic> json) {
    return BookingWithIdModel(
      data: json['data'] == null
          ? null
          : Rental.fromJson(json['data'] as Map<String, dynamic>),
      msg: json['msg'] as String?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'msg': msg,
        'status': status,
      };
}

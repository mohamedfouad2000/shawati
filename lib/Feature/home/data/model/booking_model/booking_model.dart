import 'data.dart';

class BookingModel {
  Data? data;
  String? msg;
  int? status;

  BookingModel({this.data, this.msg, this.status});

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        msg: json['msg'] as String?,
        status: json['status'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'msg': msg,
        'status': status,
      };
}

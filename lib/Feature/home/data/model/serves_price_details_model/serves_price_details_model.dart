import 'data.dart';

class ServesPriceDetailsModel {
  Data? data;
  String? msg;
  int? status;

  ServesPriceDetailsModel({this.data, this.msg, this.status});

  factory ServesPriceDetailsModel.fromJson(Map<String, dynamic> json) {
    return ServesPriceDetailsModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
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

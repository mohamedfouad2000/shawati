import 'data.dart';

class FavModel {
  Data? data;
  String? msg;
  int? status;

  FavModel({this.data, this.msg, this.status});

  factory FavModel.fromJson(Map<String, dynamic> json) => FavModel(
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

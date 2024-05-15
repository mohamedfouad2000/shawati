import 'data.dart';

class HomeModel {
  Data? data;
  String? msg;
  int? status;

  HomeModel({this.data, this.msg, this.status});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
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

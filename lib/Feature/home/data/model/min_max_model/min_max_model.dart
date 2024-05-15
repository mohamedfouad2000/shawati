import 'data.dart';

class MinMaxModel {
  Data? data;
  String? msg;
  int? status;

  MinMaxModel({this.data, this.msg, this.status});

  factory MinMaxModel.fromJson(Map<String, dynamic> json) => MinMaxModel(
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

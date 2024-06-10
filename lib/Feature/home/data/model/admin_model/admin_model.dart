import 'data.dart';

class AdminModel {
  Data? data;
  String? msg;
  int? status;

  AdminModel({this.data, this.msg, this.status});

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
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

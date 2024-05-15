import 'data.dart';

class RegisterModel {
  Data? data;
  String? msg;
  int? status;

  RegisterModel({this.data, this.msg, this.status});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
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

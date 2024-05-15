import 'data.dart';

class ProfileModel {
  Data? data;
  String? msg;
  int? status;

  ProfileModel({this.data, this.msg, this.status});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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

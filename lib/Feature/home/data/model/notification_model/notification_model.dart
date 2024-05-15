import 'data.dart';

class NotificationModel {
  Data? data;
  String? msg;
  int? status;

  NotificationModel({this.data, this.msg, this.status});

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
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

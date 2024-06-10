import 'datum.dart';

class NotificationModel {
  List<DatumNotif>? data;
  String? msg;
  int? status;

  NotificationModel({this.data, this.msg, this.status});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DatumNotif.fromJson(e as Map<String, dynamic>))
          .toList(),
      msg: json['msg'] as String?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'msg': msg,
        'status': status,
      };
}

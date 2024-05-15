import 'data.dart';

class SearchModel {
  Data? data;
  String? msg;
  int? status;

  SearchModel({this.data, this.msg, this.status});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
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

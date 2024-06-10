import 'data.dart';

class TermsAndPrivacyModel {
  TermAndPrivacyData? data;
  String? msg;
  int? status;

  TermsAndPrivacyModel({this.data, this.msg, this.status});

  factory TermsAndPrivacyModel.fromJson(Map<String, dynamic> json) {
    return TermsAndPrivacyModel(
      data: json['data'] == null
          ? null
          : TermAndPrivacyData.fromJson(json['data'] as Map<String, dynamic>),
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

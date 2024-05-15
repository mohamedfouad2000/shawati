import 'package:shawati/Feature/home/data/model/home_model/contact_details.dart';
import 'package:shawati/Feature/home/data/model/home_model/service.dart';

class Data {
  List<Service>? services;
  ContactDetails? contactDetails;

  Data({this.services, this.contactDetails});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      contactDetails: json['contact_details'] == null
          ? null
          : ContactDetails.fromJson(
              json['contact_details'] as Map<String, dynamic>));

  Map<String, dynamic> toJson() => {
        'services': services?.map((e) => e.toJson()).toList(),
        'contact_details': contactDetails?.toJson(),
      };
}

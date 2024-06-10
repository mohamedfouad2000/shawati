import 'package:shawati/Feature/home/data/model/home_model/category.dart';
import 'package:shawati/Feature/home/data/model/home_model/contact_details.dart';
import 'package:shawati/Feature/home/data/model/home_model/report.dart';
import 'package:shawati/Feature/home/data/model/home_model/service.dart';

class Data {
  List<Category>? categories;
  List<Service>? services;
  ContactDetails? contactDetails;
  Report? report;

  Data({this.categories, this.services, this.contactDetails, this.report});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: (json['categories'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
        services: (json['services'] as List<dynamic>?)
            ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
            .toList(),
        contactDetails: json['contact_details'] == null
            ? null
            : ContactDetails.fromJson(
                json['contact_details'] as Map<String, dynamic>),
        report: json['report'] == null
            ? null
            : Report.fromJson(json['report'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'categories': categories?.map((e) => e.toJson()).toList(),
        'services': services?.map((e) => e.toJson()).toList(),
        'contact_details': contactDetails?.toJson(),
        'report': report?.toJson(),
      };
}

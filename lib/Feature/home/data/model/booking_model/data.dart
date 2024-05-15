import 'package:shawati/Feature/home/data/model/home_model/contact_details.dart';

import 'rental.dart';

class Data {
  List<Rental>? rental;
  List<Rental>? upcoming;
  ContactDetails? contactDetails;

  Data({this.rental, this.upcoming, this.contactDetails});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      rental: (json['rental'] as List<dynamic>?)
          ?.map((e) => Rental.fromJson(e as Map<String, dynamic>))
          .toList(),
      upcoming: (json['upcoming'] as List<dynamic>?)
          ?.map((e) => Rental.fromJson(e as Map<String, dynamic>))
          .toList(),
      contactDetails: json['contact_details'] == null
          ? null
          : ContactDetails.fromJson(
              json['contact_details'] as Map<String, dynamic>));

  Map<String, dynamic> toJson() => {
        'rental': rental?.map((e) => e.toJson()).toList(),
        'upcoming': upcoming?.map((e) => e.toJson()).toList(),
        'contact_details': contactDetails?.toJson(),
      };
}

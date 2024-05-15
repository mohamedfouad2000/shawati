import 'package:shawati/Feature/home/data/model/home_model/contact_details.dart';

import 'favorite.dart';

class Data {
  List<Favorite>? favorites;
  ContactDetails? contactDetails;

  Data({this.favorites, this.contactDetails});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        favorites: (json['favorites'] as List<dynamic>?)
            ?.map((e) => Favorite.fromJson(e as Map<String, dynamic>))
            .toList(),
        contactDetails: json['contact_details'] == null
            ? null
            : ContactDetails.fromJson(
                json['contact_details'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'favorites': favorites?.map((e) => e.toJson()).toList(),
        'contact_details': contactDetails?.toJson(),
      };
}

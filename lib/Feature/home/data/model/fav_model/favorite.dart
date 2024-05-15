import 'package:shawati/Feature/home/data/model/home_model/service.dart';

class Favorite {
  int? id;
  int? userId;
  int? serviceId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Service? service;

  Favorite({
    this.id,
    this.userId,
    this.serviceId,
    this.createdAt,
    this.updatedAt,
    this.service,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        serviceId: json['service_id'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        service: json['service'] == null
            ? null
            : Service.fromJson(json['service'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'service_id': serviceId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'service': service?.toJson(),
      };
}

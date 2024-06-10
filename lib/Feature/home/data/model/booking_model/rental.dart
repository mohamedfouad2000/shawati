import 'package:shawati/Feature/home/data/model/home_model/service.dart';

class Rental {
  int? id;
  int? serviceId;
  int? brandId;
  dynamic couponId;
  int? amount;
  int? insurance;
  int? totalAmount;
  int? taxes;
  int? customerId;
  int? providerId;
  dynamic bookingStatusId;
  String? startAt;
  String? endAt;
  dynamic paymentStatusId;
  dynamic description;
  String? lng;
  String? lat;
  String? attachment;
  DateTime? createdAt;
  DateTime? updatedAt;
  Service? service;

  Rental(
      {this.id,
      this.serviceId,
      this.brandId,
      this.couponId,
      this.amount,
      this.insurance,
      this.totalAmount,
      this.taxes,
      this.customerId,
      this.providerId,
      this.bookingStatusId,
      this.startAt,
      this.endAt,
      this.paymentStatusId,
      this.description,
      this.lng,
      this.lat,
      this.createdAt,
      this.updatedAt,
      this.service,
      this.attachment});

  factory Rental.fromJson(Map<String, dynamic> json) => Rental(
        id: json['id'] as int?,
        serviceId: json['service_id'] as int?,
        brandId: json['brand_id'] as int?,
        couponId: json['coupon_id'] as dynamic,
        amount: json['amount'] as int?,
        insurance: json['insurance'] as int?,
        totalAmount: json['total_amount'] as int?,
        taxes: json['taxes'] as int?,
        customerId: json['customer_id'] as int?,
        providerId: json['provider_id'] as int?,
        bookingStatusId: json['booking_status_id'] as dynamic,
        startAt: json['start_at'] as String?,
        endAt: json['end_at'] as String?,
        paymentStatusId: json['payment_status_id'] as dynamic,
        description: json['description'] as dynamic,
        lng: json['lng'] as String?,
        lat: json['lat'] as String?,
        attachment: json['attachment'] as String?,
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
        'service_id': serviceId,
        'brand_id': brandId,
        'coupon_id': couponId,
        'amount': amount,
        'insurance': insurance,
        'total_amount': totalAmount,
        'taxes': taxes,
        'customer_id': customerId,
        'provider_id': providerId,
        'booking_status_id': bookingStatusId,
        'start_at': startAt,
        'end_at': endAt,
        'payment_status_id': paymentStatusId,
        'description': description,
        'lng': lng,
        'lat': lat,
        'attachment': attachment,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'service': service?.toJson(),
      };
}

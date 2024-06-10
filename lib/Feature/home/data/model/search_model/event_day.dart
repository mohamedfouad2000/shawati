class EventDay {
  int? id;
  int? serviceId;
  String? day;
  String? price;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  EventDay({
    this.id,
    this.serviceId,
    this.day,
    this.price,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory EventDay.fromJson(Map<String, dynamic> json) => EventDay(
        id: json['id'] as int?,
        serviceId: json['service_id'] as int?,
        day: json['day'] as String?,
        price: json['price'] as String?,
        status: json['status'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'service_id': serviceId,
        'day': day,
        'price': price,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

class Gallery {
  int? id;
  int? serviceId;
  String? path;
  int? type;
  DateTime? createdAt;
  DateTime? updatedAt;

  Gallery({
    this.id,
    this.serviceId,
    this.path,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        id: json['id'] as int?,
        serviceId: json['service_id'] as int?,
        path: json['path'] as String?,
        type: json['type'] as int?,
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
        'path': path,
        'type': type,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

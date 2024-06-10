class Feature {
  int? id;
  String? image;
  String? featureName;
  String? featureNameAr;
  DateTime? createdAt;
  DateTime? updatedAt;

  Feature({
    this.id,
    this.image,
    this.featureName,
    this.featureNameAr,
    this.createdAt,
    this.updatedAt,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        id: json['id'] as int?,
        image: json['image'] as String?,
        featureName: json['feature_name'] as String?,
        featureNameAr: json['feature_name_ar'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'feature_name': featureName,
        'feature_name_ar': featureNameAr,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

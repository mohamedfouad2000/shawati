class DatumNotif {
  int? id;
  int? userId;
  dynamic provOrAdminId;
  String? body;
  String? title;
  String? modelId;
  String? bodyAr;
  String? titleAr;
  int? modelType;
  int? seen;
  DateTime? createdAt;
  DateTime? updatedAt;

  DatumNotif({
    this.id,
    this.userId,
    this.provOrAdminId,
    this.bodyAr,
    this.body,
    this.title,
    this.titleAr,
    this.modelId,
    this.modelType,
    this.seen,
    this.createdAt,
    this.updatedAt,
  });

  factory DatumNotif.fromJson(Map<String, dynamic> json) => DatumNotif(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        provOrAdminId: json['prov_or_admin_id'] as dynamic,
        body: json['body'] as String?,
        title: json['title'] as String?,
        modelId: json['model_id'] as String?,
        modelType: json['model_type'] as int?,
        titleAr: json['title_ar'] as String?,
        bodyAr: json['body_ar'] as String?,
        seen: json['seen'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'prov_or_admin_id': provOrAdminId,
        'body': body,
        'title': title,
        'model_id': modelId,
        'model_type': modelType,
        'seen': seen,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'title_ar': titleAr,
        'body_ar': bodyAr
      };
}

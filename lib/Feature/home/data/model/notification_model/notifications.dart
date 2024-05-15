class Notifications {
  int? id;
  int? userId;

  String? text;
  bool? seen;
  String? createdAt;
  String? updatedAt;

// id user_id text seen created_at updated_at
  Notifications({
    this.id,
    this.userId,
    this.text,
    this.seen,
    this.createdAt,
    this.updatedAt,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        text: json['text'] as String?,
        seen: json['seen'] as bool?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'text': text,
        'seen': seen,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}

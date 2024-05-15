class User {
  String? name;
  String? phone;
  String? image;
  int? id;

  User({this.name, this.phone, this.image, this.id});

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        image: json['image'] as String?,
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'image': image,
        'id': id,
      };
}

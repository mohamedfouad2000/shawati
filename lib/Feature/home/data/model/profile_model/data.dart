class Data {
  int? id;
  String? name;
  String? phone;
  String? image;

  Data({this.id, this.name, this.phone, this.image});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'image': image,
      };
}

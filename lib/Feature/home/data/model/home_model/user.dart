class OwnerData {
  int? id;
  String? name;
  String? image;
  String? phone;

  OwnerData({
    this.id,
    this.name,
    this.image,
    this.phone,
  });

  OwnerData.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    image = json['image'] as String?;
    phone = json['phone'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['phone'] = phone;

    return data;
  }
}

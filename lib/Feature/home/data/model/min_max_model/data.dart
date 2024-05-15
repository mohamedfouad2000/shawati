class Data {
  int? maxPrice;
  int? minPrice;

  Data({this.maxPrice, this.minPrice});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        maxPrice: json['max_price'] as int?,
        minPrice: json['min_price'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'max_price': maxPrice,
        'min_price': minPrice,
      };
}

class EventDaysDetail {
  String? date;
  String? price;

  EventDaysDetail({this.date, this.price});

  factory EventDaysDetail.fromJson(Map<String, dynamic> json) {
    return EventDaysDetail(
      date: json['date'] as String?,
      price: json['price'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'price': price,
      };
}

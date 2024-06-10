import 'event_days_detail.dart';

class Data {
  List<EventDaysDetail>? eventDaysDetails;
  List<dynamic>? unAvaliableDays;
  int? total;
  int? eventDaysPrices;
  int? totalNormalDays;
  int? totalEventDays;
  dynamic totalAfterApplyCoupon;

  Data(
      {this.eventDaysDetails,
      this.total,
      this.eventDaysPrices,
      this.unAvaliableDays,
      this.totalNormalDays,
      this.totalAfterApplyCoupon,
      this.totalEventDays});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      eventDaysDetails: (json['event_days_details'] as List<dynamic>?)
          ?.map((e) => EventDaysDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      unAvaliableDays: json['un_avaliable_days'] as List?,
      total: json['total'] as int?,
      eventDaysPrices: json['event_days_prices'] as int?,
      totalNormalDays: json['total_normal_days'] as int?,
      totalEventDays: json['total_event_days'] as int?,
      totalAfterApplyCoupon: json['total_after_apply_coupon'] as dynamic);

  Map<String, dynamic> toJson() => {
        'event_days_details': eventDaysDetails?.map((e) => e.toJson()).toList(),
        'total': total,
        'un_avaliable_days': unAvaliableDays,
        'event_days_prices': eventDaysPrices,
        'total_normal_days': totalNormalDays,
        'total_event_days': totalEventDays,
        'total_after_apply_coupon': totalAfterApplyCoupon
      };
}

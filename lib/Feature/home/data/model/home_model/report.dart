class Report {
  int? totalEarnings;
  int? totalBooking;
  int? totlaServices;

  Report({this.totalEarnings, this.totalBooking, this.totlaServices});

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        totalEarnings: json['total_earnings'] as int?,
        totalBooking: json['total_booking'] as int?,
        totlaServices: json['totla_services'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'total_earnings': totalEarnings,
        'total_booking': totalBooking,
        'totla_services': totlaServices,
      };
}

import 'package:flutter/material.dart';

import 'package:custom_calendar_viewer/custom_calendar_viewer.dart';
import 'package:intl/intl.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';

class TestCalender extends StatefulWidget {
  const TestCalender(
      {super.key, required this.highlightedDates, required this.days});
  final List<DateTime> highlightedDates;
  final String days;

  @override
  _TestCalenderState createState() => _TestCalenderState();
}

class _TestCalenderState extends State<TestCalender> {
  // CalendarController _controller;
  List<Date>? dates = [];

  @override
  void initState() {
    super.initState();
    String days = widget.days
        .replaceAll('[', '')
        .replaceAll('"', '')
        .replaceAll(']', '')
        .replaceAll(' ', ' ')
        .replaceAll("\\", "")
        .trim();
    List<DateTime> times = [];
    print(days);
    for (int i = 0; i < days.split(',').length; i++) {
      // print();

      try {
        //05/05/2024 3:52 PM, 05/14/2024 3:52 PM, 05/09/2024 3:52 PM, 05/16/2024 3:52 PM
        // print('ahaa');
        // print(days.split(',')[i]);
        DateTime x;
        //15/05/2024
        // if (LocalizationCubit.get(context).isArabic()) {

        x = DateFormat.yMd('en_US')
            .parseLoose(days.split(',')[i].trim().substring(0, 10));
        // } else {
        //   x = DateFormat("MM/dd/yyyy ").parse(days.split(',')[i].trim());
        // }
        print('index is $i ${days.split(',')[i].trim()}');

        // x = DateFormat("MM/dd/yyyy ").parse(days.split(',')[i].trim());
        times.add(x);

        print('Ahah is ${times[i]}');
      } catch (e) {
        print('error is $e');

        // controller?.selectedRange = PickerDateRange(
        //     widget.highlightedDates.first, widget.highlightedDates.last);

        // widget.highlightedDates = [
        //   DateTime(2024, 6, 3),
        //   DateTime(2024, 6, 7),
        // ];
      }
    }
    for (var element in widget.highlightedDates) {
      dates!.add(Date(date: element, color: Colors.red));
    }
    for (var element in times) {
      dates!.add(Date(date: element, color: ConstColor.kMainColor));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomCalendarViewer(
        dates: dates,
        local: LocalizationCubit.get(context).isArabic() ? 'ar' : 'en',
        activeColor: ConstColor.kMainColor,
        calendarBorderColor: ConstColor.kMainColor,
        // calendarBorderRadius: 10,
        // calendarBorderWidth: 20,
        startYear: DateTime.now().year,
        // showHeader: false,
        headerAlignment: MainAxisAlignment.center,
        calendarStyle: CustomCalendarStyle.normal,
        spaceBetweenMovingArrow: 0,
        showBorderAfterDayHeader: true,
        // movingArrowSize: 25,
        // dropArrowSize: 55,
        daysMargin: const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),

        // iconPadding: const EdgeInsets.all(1000000000000000),
        // activeStyle: const TextStyle(
        //   color: Colors.white,
        //   fontSize: 60,
        // ),
        showTooltip: true,
        toolTipMessage: '',
        separatedWidget: const Divider(),
        toolTipPadding: const EdgeInsets.all(10),
        calendarStartDay: CustomCalendarStartDay.monday,

        // daysNameColors: const [Colors.yellow],
        // closeDateBefore: dates?.first.date ?? DateTime.now(),
        // onDayTapped: (date) {
        //   print(date);
        // },
        // activeColor: Colors.blue,
        showCurrentDayBorder: true,
        // calendarStartDay: CustomCalendarStartDay.monday,
        // showBorderAfterDayHeader: true,
        // showMonthAndYearHeader: true,
        // todayStart: dates?.first.date,
        // showHeader: true,
        // showTooltip: true,

        // // calendarType: CustomCalendarType.multiDatesAndRanges,
        // calendarStyle: CustomCalendarStyle.normal,
        // // animateDirection: CustomCalendarAnimatedDirection.vertical,
        // movingArrowSize: 24,
        // spaceBetweenMovingArrow: 20,
        // closeDateBefore: DateTime.now(),
        // closedDatesColor: Colors.grey.withOpacity(0.7),
        // //showHeader: false,
        // // showBorderAfterDayHeader: true,
        // // showTooltip: true,
        // toolTipMessage: '',
        // //headerAlignment: MainAxisAlignment.center,
        // calendarStartDay: CustomCalendarStartDay.monday,
        // onCalendarUpdate: (date) {
        //   // Handel your code here.
        //   print('onCalendarUpdate');
        //   print(date);
        // },
        // onDayTapped: (date) {
        //   // Handel your code here.
        //   // print('onDayTapped');
        //   // print(date);
        // },
        // onDatesUpdated: (newDates) {
        //   // print('onDatesUpdated');
        //   // print(newDates.length);
        // },
        // onRangesUpdated: (newRanges) {
        //   // print('onRangesUpdated');
        //   // print(newRanges.length);
        // },
        //showCurrentDayBorder: false,
      ),
    );
  }
}

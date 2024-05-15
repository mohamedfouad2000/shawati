import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';

class CalendarDetails extends StatefulWidget {
  const CalendarDetails({
    super.key,
    required this.fromdate,
    required this.todate,
  });
  final String fromdate;
  final String todate;

  @override
  State<CalendarDetails> createState() => _CalendarDetailsState();
}

class _CalendarDetailsState extends State<CalendarDetails> {
  @override
  Widget build(BuildContext context) {
    //"16-04-2024,23-04-2024,24-04-2024"
    //15/05/2024
    print(widget.fromdate);
    String days = widget.fromdate
        .replaceAll('[', '')
        .replaceAll('"', '')
        .replaceAll(']', '')
        .replaceAll('\\', '')
        .trim();
    // 16-04-2024,23-04-2024,24-04-2024
    List<DateTime> Times = [];
    print(days);
    for (int i = 0; i < days.split(',').length; i++) {
      // print();

      try {
        //05/05/2024 3:52 PM, 05/14/2024 3:52 PM, 05/09/2024 3:52 PM, 05/16/2024 3:52 PM
        // print('ahaa');
        // print(days.split(',')[i]);
        print('index is $i ${days.split(',')[i].trim()}');
        //15/05/2024
        var x = DateFormat("MM/dd/yyyy ").parse(days.split(',')[i].trim());
        Times.add(x);

        print(Times[i]);
      } catch (e) {}
    }

    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: CalendarDatePicker2(
          config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.multi,
              centerAlignModePicker: true),
          onValueChanged: (value) {
            print(value);
            print(Times);
            setState(() {
              Times.remove(value);
            });
          },
          value: Times
          // onValueChanged: (dates) => _dates = dates,
          ),
    );
  }
}

// int.parse(fromdate.substring(0, 4)),
//             int.parse(fromdate.substring(5, 7)),
//             int.parse(fromdate.substring(9, 11))

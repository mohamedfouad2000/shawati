import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';

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
        Times.add(x);

        print('Ahah is ${Times[i]}');
      } catch (e) {
        print('error is $e');
      }
    }

    return CalendarDatePicker2(
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
        );
  }
}

// int.parse(fromdate.substring(0, 4)),
//             int.parse(fromdate.substring(5, 7)),
//             int.parse(fromdate.substring(9, 11))
String reverseStringWithSpaces(String input) {
  // Split the input string into words
  List<String> words = input.split(' ');

  // Reverse the order of the words
  List<String> reversedWords = words.reversed.toList();

  // Reverse each individual word
  List<String> reversedIndividualWords = reversedWords.map((word) {
    // Reverse the characters in the word
    String reversedWord = word.split('').reversed.join('');
    return reversedWord;
  }).toList();

  // Join the reversed words back together with spaces
  String reversedString = reversedIndividualWords.join(' ');

  return reversedString;
}

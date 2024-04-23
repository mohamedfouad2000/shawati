import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class CalendarDetails extends StatelessWidget {
  const CalendarDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker2(
      config: CalendarDatePicker2Config(
          calendarType: CalendarDatePicker2Type.range,
          centerAlignModePicker: true),
      value: const [],
      // onValueChanged: (dates) => _dates = dates,
    );
  }
}

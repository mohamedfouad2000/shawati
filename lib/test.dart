import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class testMan extends StatefulWidget {
  const testMan({
    super.key,
  });

  @override
  State<testMan> createState() => _testManState();
}

class _testManState extends State<testMan> {
  List<DateTime?> Times = [];
  final DateRangePickerController _datePickerController =
      DateRangePickerController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfDateRangePicker(
            // onViewChanged: (viewChangedArgs) {
            //   // Access the visible dates
            //   List<DateTime> visibleDates =
            //       viewChangedArgs.visibleDateRange as List<DateTime>;

            //   // Print each visible date
            //   for (DateTime date in visibleDates) {
            //     print(date);
            //   }
            // },
            monthCellStyle: const DateRangePickerMonthCellStyle(
                selectionTextStyle: TextStyle(color: Colors.white),
                blackoutDatesDecoration: BoxDecoration(
                    color: Colors.red,
                    // border: Border.all(color: Color(0xFFF44436), width: 1),
                    shape: BoxShape.circle),
                blackoutDateTextStyle: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.lineThrough),
                specialDatesTextStyle: TextStyle(color: Colors.white),
                selectionColor: Colors.white),
            controller: _datePickerController,
            onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
              // Print the selected date ranges
              // for (var range in dateRangePickerSelectionChangedArgs.value) {
              //   print(
              //       'Start Date: ${range.startDate}, End Date: ${range.endDate}');
              // }
            },
            view: DateRangePickerView.month,
            backgroundColor: Colors.white,
            // onViewChanged: (i) {
            //   print(i);
            // },
            monthViewSettings:
                const DateRangePickerMonthViewSettings(firstDayOfWeek: 6),
            selectionMode: DateRangePickerSelectionMode.multiRange,
            showActionButtons: true,
            onSubmit: (val) {
              print("s");
              print(val);
            },
            onCancel: () {
              print(_datePickerController.selectedRanges);

              //  _datePickerController.selectedRanges = null;
            }),
        IconButton(
            onPressed: () {
              print(_datePickerController.selectedRanges);
              Times = [];

              _datePickerController.selectedRanges?.forEach((element) {
                DateTime? x = element.startDate;
                print(x);
                print(element.endDate.toString());

                print(DateTime.now().isBefore(x!));

                print("Out Of While");

                if (element.endDate.toString() == 'null') {
                  Times.add(element.startDate);
                } else {
                  while (x!.isBefore(element.endDate!)) {
                    print(x);

                    Times.add(x);
                    x = x.add(const Duration(days: 1));
                  }
                  Times.add(element.endDate);
                }
              });

              print(Times.toSet().toList().length);
            },
            icon: const Icon(Icons.add))
      ],
    );
  }
}

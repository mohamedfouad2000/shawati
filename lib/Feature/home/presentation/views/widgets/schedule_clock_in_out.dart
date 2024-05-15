import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Booking%20cubit/booking_cubit.dart';
import 'package:shawati/generated/l10n.dart';

class ScheduleClockInOut extends StatefulWidget {
  const ScheduleClockInOut({super.key, required this.from, required this.to});
  final String from;
  final String to;

  @override
  State<ScheduleClockInOut> createState() => _ScheduleClockInOutState();
}

class _ScheduleClockInOutState extends State<ScheduleClockInOut> {
  List<DateTime> Times = [];
  List<int> dates = [];

  // Function to check if a date is selectable
  bool _isSelectable(DateTime day) {
    return dates.contains(day.day);
  }

  bool _isSelectableDate(DateTime day) {
    // Define the logic to determine which dates are selectable
    // For example, let's allow only even days in the month of May 2024
    if (day.year == 2024 && day.month == 5) {
      return day.day.isOdd;
    }
    // By default, all other dates are selectable
    return true;
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   String days = widget.from
  //       .replaceAll('[', '')
  //       .replaceAll(']', '')
  //       .replaceAll('"', '')
  //       .replaceAll('\\', '')
  //       .trim();
  //   print(days);
  //   for (int i = 0; i < days.split(',').length; i++) {
  //     // print();

  //     try {
  //       //05/05/2024 3:52 PM, 05/14/2024 3:52 PM, 05/09/2024 3:52 PM, 05/16/2024 3:52 PM
  //       // print('ahaa');
  //       // print(days.split(',')[i]);
  //       print('index is $i ${days.split(',')[i].trim()}');
  //       //
  //       var x = DateFormat("MM/dd/yyyy ").parse(days.split(',')[i].trim());
  //       Times.add(x);

  //       print(Times[i]);
  //     } catch (e) {}
  //   }
  //   for (var e in Times) {
  //     dates.add(e.day);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // widget.from
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              // selectableDayPredicate: _isSelectable,
              initialDate: widget.from != ''
                  ? DateFormat("MM/dd/yyyy ").parse(widget.from.trim())
                  : DateTime.now(),
              firstDate: widget.from != ''
                  ? DateFormat("MM/dd/yyyy ").parse(widget.from.trim())
                  : DateTime.now(),
              lastDate: BlocProvider.of<BookingCubit>(context).checkout ??
                  (widget.to != ''
                      ? DateFormat("MM/dd/yyyy ").parse(widget.to.trim())
                      : DateTime.now().add(const Duration(days: 30))),
            );

            if (pickedDate != null) {
              print(
                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
                  DateFormat('dd/MMMM/yyyy').format(pickedDate);
              print(
                  formattedDate); //formatted date output using intl package =>  2021-03-16
              setState(() {
                BlocProvider.of<BookingCubit>(context)
                    .changecheckin(pickedDate);
              });
              // CreationDatecont.text =
              //     formattedDate; //set output date to TextField value.
            } else {}
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
              // color: const Color(0xffE9F0FF),
              borderRadius: BorderRadius.circular(23),
              // color: const Color(0xffE9F0FF),
              border: Border.all(color: ConstColor.kMainColor),
            ),
            child: Row(
              children: [
                const ImageIcon(
                  AssetImage(
                    AssetsData.note,
                  ),
                ),
                Expanded(
                  child: Text(
                    " ${S.of(context).CHECKIN}",
                    style: StylesData.font13.copyWith(color: Colors.black),
                  ),
                ),
                Text(
                  DateFormat('MMMM dd').format(
                          BlocProvider.of<BookingCubit>(context).checkin ??
                              DateTime.now()) ??
                      '',
                  style: StylesData.font13.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        InkWell(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              // selectableDayPredicate: _isSelectable,
              initialDate: BlocProvider.of<BookingCubit>(context).checkin ??
                  (widget.from != ''
                      ? DateFormat("MM/dd/yyyy ").parse(widget.from.trim())
                      : DateTime.now()),

              firstDate: BlocProvider.of<BookingCubit>(context).checkin ??
                  (widget.from != ''
                      ? DateFormat("MM/dd/yyyy ").parse(widget.from.trim())
                      : DateTime.now()),
              lastDate: widget.to != ''
                  ? DateFormat("MM/dd/yyyy ").parse(widget.to.trim())
                  : DateTime.now().add(
                      const Duration(days: 30),
                    ),
              context: context,

              // selectableDayPredicate: _isSelectableDate,

              //DateTime.now() - not to allow to choose before today.
            );

            if (pickedDate != null) {
              print(
                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
                  DateFormat('dd/MMMM/yyyy').format(pickedDate);
              print(
                  formattedDate); //formatted date output using intl package =>  2021-03-16
              setState(() {
                BlocProvider.of<BookingCubit>(context)
                    .changecheckout(pickedDate);
              });
              // CreationDatecont.text =
              //     formattedDate; //set output date to TextField value.
            } else {}
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
              // color: const Color(0xffE9F0FF),
              borderRadius: BorderRadius.circular(23),
              // color: const Color(0xffE9F0FF),
              border: Border.all(color: ConstColor.kMainColor),
            ),
            child: Row(
              children: [
                ImageIcon(
                  const AssetImage(
                    AssetsData.clock,
                  ),
                  color: ConstColor.kMainColor,
                ),
                Expanded(
                  child: Text(
                    S.of(context).CHECKOUT,
                    style: StylesData.font13.copyWith(color: Colors.black),
                  ),
                ),
                Text(
                  DateFormat('MMMM dd').format(
                          BlocProvider.of<BookingCubit>(context).checkout ??
                              DateTime.now()) ??
                      '',
                  style: StylesData.font13.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

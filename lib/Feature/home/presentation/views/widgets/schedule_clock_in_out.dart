import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Booking%20cubit/booking_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/ServesPrices%20Cubit/serves_prices_cubit.dart';
import 'package:shawati/generated/l10n.dart';

class ScheduleClockInOut extends StatefulWidget {
  const ScheduleClockInOut(
      {super.key,
      required this.from,
      required this.to,
      required this.listDays,
      required this.id});
  final String from;
  final String to;
  final String listDays;
  final int id;

  @override
  State<ScheduleClockInOut> createState() => _ScheduleClockInOutState();
}

class _ScheduleClockInOutState extends State<ScheduleClockInOut> {
  DateTime? firstDay;
  List<int> dates = [];
  List<DateTime> Times = [];

  String textFrom = '';

  // // Function to check if a date is selectable
  bool _isSelectable(DateTime day) {
    return Times.contains(day);
  }

  // bool _isSelectableDate(DateTime day) {
  //   // Define the logic to determine which dates are selectable
  //   // For example, let's allow only even days in the month of May 2024
  //   if (day.year == 2024 && day.month == 5) {
  //     return day.day.isOdd;
  //   }
  //   // By default, all other dates are selectable
  //   return true;
  // }

  @override
  void initState() {
    super.initState();
    print("The day is ${widget.from}");
    String days = widget.listDays
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll('"', '')
        .replaceAll('\\', '')
        .trim();
    // 16-04-2024,23-04-2024,24-04-2024
    // List<DateTime> Times = [];

    print(days);
    for (int i = 0; i < days.split(',').length; i++) {
      // print();

      try {
        // ["05\/21\/2024 12:00 AM","05\/20\/2024 12:00 AM","05\/19\/2024 12:00 AM","05\/22\/2024 12:00 AM"]

        DateTime x;
        //15/05/2024
        // if (LocalizationCubit.get(context).isArabic()) {

        x = DateFormat.yMd('en_US')
            .parseLoose(days.split(',')[i].trim().substring(0, 10));
        print('x is ${x.day}');
        print('x is ${DateTime.now().day}');

        (!x.isBefore(DateTime.now()))
            ? Times.add(x)
            : (x.day == DateTime.now().day ? Times.add(x) : null);

        // break;

        // } else {
        //   x = DateFormat("MM/dd/yyyy ").parse(days.split(',')[i].trim());
        // }
        // print('index is $i ${days.split(',')[i].trim()}');

        // x = DateFormat("MM/dd/yyyy ").parse(days.split(',')[i].trim());
        // Times.add(x);

        // print('Ahah is ${Times[i]}');
        // print('Ahah is ${days.split(',')[i].trim().substring(0, 10)}');
      } catch (e) {
        print('error is $e');
      }
    }
    print('textFrom is $Times');
  }
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
    return BlocConsumer<ServesPricesCubit, ServesPricesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                // Times.;
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  selectableDayPredicate: _isSelectable,
                  initialDate:
                      widget.from != '' ? Times.toSet().first : DateTime.now(),
                  firstDate:
                      widget.from != '' ? Times.toSet().first : DateTime.now(),
                  lastDate: BlocProvider.of<BookingCubit>(context).checkout ??
                      (widget.to != ''
                          ? Times.toSet().last
                          : DateTime.now().add(const Duration(days: 30))),
                );

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  // String formattedDate =
                  //     DateFormat('dd/MMMM/yyyy').format(pickedDate);
                  // print(
                  //     formattedDate); //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    BlocProvider.of<BookingCubit>(context).timesCalender = [];
                    BlocProvider.of<BookingCubit>(context)
                        .changecheckin(pickedDate);
                    BlocProvider.of<BookingCubit>(context)
                        .timesCalender
                        .add(BlocProvider.of<BookingCubit>(context).checkin!);
                    BlocProvider.of<BookingCubit>(context)
                        .timesCalender
                        .add(BlocProvider.of<BookingCubit>(context).checkout!);
                  });
                  // CreationDatecont.text =
                  //     formattedDate; //set output date to TextField value.
                } else {}
                if (BlocProvider.of<BookingCubit>(context).checkin != '' &&
                    BlocProvider.of<BookingCubit>(context).checkout != '' &&
                    BlocProvider.of<BookingCubit>(context).checkin != null &&
                    BlocProvider.of<BookingCubit>(context).checkout != null) {
                  BlocProvider.of<ServesPricesCubit>(context).getServesPrices(
                      bookingId: -1,
                      coupon:
                          BlocProvider.of<BookingCubit>(context).coupon.text ??
                              '',
                      startAt: DateFormat('MM/dd/yyyy', 'en').format(
                          BlocProvider.of<BookingCubit>(context).checkin ??
                              DateTime.now()),
                      endAt: DateFormat('MM/dd/yyyy', 'en').format(
                          BlocProvider.of<BookingCubit>(context).checkout ??
                              DateTime.now()),
                      serid: widget.id);
                }
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
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
                  selectableDayPredicate: _isSelectable,
                  initialDate: BlocProvider.of<BookingCubit>(context).checkin ??
                      (widget.from != ''
                          ? Times.toSet().first
                          : DateTime.now()),

                  firstDate: BlocProvider.of<BookingCubit>(context).checkin ??
                      (widget.from != ''
                          ? Times.toSet().first
                          : DateTime.now()),
                  lastDate: widget.to != ''
                      ? Times.toSet().last
                      : DateTime.now().add(
                          const Duration(days: 30),
                        ),
                  context: context,

                  // selectableDayPredicate: _isSelectableDate,

                  //DateTime.now() - not to allow to choose before today.
                );

                if (pickedDate != null) {
                  // print(
                  //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  // String formattedDate =
                  //     DateFormat('dd/MMMM/yyyy').format(pickedDate);
                  // print(
                  //     formattedDate); //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    BlocProvider.of<BookingCubit>(context).timesCalender = [];
                    BlocProvider.of<BookingCubit>(context)
                        .changecheckout(pickedDate);
                    BlocProvider.of<BookingCubit>(context)
                        .timesCalender
                        .add(BlocProvider.of<BookingCubit>(context).checkin!);
                    BlocProvider.of<BookingCubit>(context)
                        .timesCalender
                        .add(BlocProvider.of<BookingCubit>(context).checkout!);
                  });
                  // CreationDatecont.text =
                  //     formattedDate; //set output date to TextField value.
                } else {}

                if (BlocProvider.of<BookingCubit>(context).checkin != '' &&
                    BlocProvider.of<BookingCubit>(context).checkout != '' &&
                    BlocProvider.of<BookingCubit>(context).checkin != null &&
                    BlocProvider.of<BookingCubit>(context).checkout != null) {
                  BlocProvider.of<ServesPricesCubit>(context).getServesPrices(
                      bookingId: -1,
                      coupon:
                          BlocProvider.of<BookingCubit>(context).coupon.text ??
                              '',
                      startAt: DateFormat('MM/dd/yyyy', 'en').format(
                          BlocProvider.of<BookingCubit>(context).checkin ??
                              DateTime.now()),
                      endAt: DateFormat('MM/dd/yyyy', 'en').format(
                          BlocProvider.of<BookingCubit>(context).checkout ??
                              DateTime.now()),
                      serid: widget.id);
                }
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
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
      },
    );
  }
}

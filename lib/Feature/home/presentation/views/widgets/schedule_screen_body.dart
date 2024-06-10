import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/home_view.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Booking%20cubit/booking_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Booking%20cubit/booking_state.dart';
import 'package:shawati/Feature/home/presentation/views/manager/ServesPrices%20Cubit/serves_prices_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/amount_payment.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/schedule_clock_in_out.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/schedule_range.dart';
import 'package:shawati/generated/l10n.dart';

class ScheduleScreenBody extends StatefulWidget {
  const ScheduleScreenBody({super.key, required this.id, required this.days});
  final int id;
  final String days;

  @override
  State<ScheduleScreenBody> createState() => _ScheduleScreenBodyState();
}

class _ScheduleScreenBodyState extends State<ScheduleScreenBody> {
  List<DateTime> Times = [];
  // TextEditingController copon = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String dayss = widget.days
        .replaceAll('[', '')
        .replaceAll('"', '')
        .replaceAll(']', '')
        .replaceAll('\\', '')
        .trim();
    for (int i = 0; i < dayss.split(',').length; i++) {
      // print();

      try {
        // ["05\/21\/2024 12:00 AM","05\/20\/2024 12:00 AM","05\/19\/2024 12:00 AM","05\/22\/2024 12:00 AM"]

        DateTime x;
        //15/05/2024
        // if (LocalizationCubit.get(context).isArabic()) {

        x = DateFormat.yMd('en_US')
            .parseLoose(dayss.split(',')[i].trim().substring(0, 10));
        // } else {
        //   x = DateFormat("MM/dd/yyyy ").parse(dayss.split(',')[i].trim());
        // }
        print('index is $i ${dayss.split(',')[i].trim()}');

        // x = DateFormat("MM/dd/yyyy ").parse(dayss.split(',')[i].trim());
        Times.add(x);

        print('Ahah is ${Times[i]}');
        print('Ahah is ${dayss.split(',')[i].trim().substring(0, 10)}');
      } catch (e) {
        print('error is $e');
      }
    }

    // BlocProvider.of<BookingCubit>(context).checkin = null;
    // BlocProvider.of<BookingCubit>(context).checkout = null;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BookingCubit(HomeRepoImpl()),
          ),
          BlocProvider(create: (context) => ServesPricesCubit(HomeRepoImpl())),
        ],
        child: BlocConsumer<BookingCubit, BookingState>(
          listener: (context, state) {
            if (state is ADDBookingSucc) {
              showToast(
                  msq: LocalizationCubit.get(context).isArabic()
                      ? S.of(context).Successfull
                      : state.msq);
              Nav(context, const HomeView(currentidex: 0));
            } else if (state is ADDBookingError) {
              showToast(msq: state.msg.toString());
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).schedule,
                      style: StylesData.font24Google,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (BlocProvider.of<BookingCubit>(context).checkin != '' &&
                        BlocProvider.of<BookingCubit>(context).checkout != '' &&
                        BlocProvider.of<BookingCubit>(context).checkin !=
                            null &&
                        BlocProvider.of<BookingCubit>(context).checkout != null)
                      const ScheduleRange(),
                    if (BlocProvider.of<BookingCubit>(context).checkin != '' &&
                        BlocProvider.of<BookingCubit>(context).checkout != '')
                      const SizedBox(
                        height: 18,
                      ),
                    ScheduleClockInOut(
                      id: widget.id,
                      listDays: widget.days,
                      from: widget.days
                          .split(',')
                          .first
                          .replaceAll('[', '')
                          .replaceAll(']', '')
                          .replaceAll('"', '')
                          .replaceAll('\\', '')
                          .trim(),
                      to: widget.days
                          .split(',')
                          .last
                          .replaceAll('[', '')
                          .replaceAll(']', '')
                          .replaceAll('"', '')
                          .replaceAll('\\', '')
                          .trim(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    customTextFormedFiled(
                      controller: BlocProvider.of<BookingCubit>(context).coupon,
                      hintText: S.of(context).coupon,
                      onChanged: (p0) {
                        if (BlocProvider.of<BookingCubit>(context).checkin !=
                                '' &&
                            BlocProvider.of<BookingCubit>(context).checkout !=
                                '' &&
                            BlocProvider.of<BookingCubit>(context).checkin !=
                                null &&
                            BlocProvider.of<BookingCubit>(context).checkout !=
                                null) {
                          BlocProvider.of<ServesPricesCubit>(context)
                              .getServesPrices(
                                bookingId: -1,
                                  coupon: BlocProvider.of<BookingCubit>(context)
                                          .coupon
                                          .text ??
                                      '',
                                  startAt: DateFormat('MM/dd/yyyy', 'en')
                                      .format(
                                          BlocProvider.of<BookingCubit>(context)
                                                  .checkin ??
                                              DateTime.now()),
                                  endAt: DateFormat('MM/dd/yyyy', 'en').format(
                                      BlocProvider.of<BookingCubit>(context)
                                              .checkout ??
                                          DateTime.now()),
                                  serid: widget.id);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (BlocProvider.of<BookingCubit>(context).checkin != '' &&
                        BlocProvider.of<BookingCubit>(context).checkout != '' &&
                        BlocProvider.of<BookingCubit>(context).checkin !=
                            null &&
                        BlocProvider.of<BookingCubit>(context).checkout != null)
                      AmountPayment(
                  fromBooking: false,

                          id: widget.id,
                          start: DateFormat('MM/dd/yyyy', 'en').format(
                              BlocProvider.of<BookingCubit>(context).checkin ??
                                  DateTime.now()),
                          end: DateFormat('MM/dd/yyyy', 'en').format(
                              BlocProvider.of<BookingCubit>(context).checkout ??
                                  DateTime.now())),
                    // if (widget.days != null || widget.days != '')
                    //   BlocConsumer<BookingCubit, BookingState>(
                    //     listener: (context, state) {
                    //       if (state is CheckData) {
                    //         BlocProvider.of<BookingCubit>(context)
                    //             .timesCalender = [];
                    //         for (var element in Times) {
                    //           print("is element is $element");
                    //           if ((element.day == DateTime.now().day) ||
                    //               element.isBefore(
                    //                   BlocProvider.of<BookingCubit>(context)
                    //                           .checkin ??
                    //                       DateTime.now()) ||
                    //               element.isAfter(
                    //                   BlocProvider.of<BookingCubit>(context)
                    //                           .checkout ??
                    //                       DateTime.now())) {
                    //             BlocProvider.of<BookingCubit>(context)
                    //                 .timesCalender
                    //                 .add(element);
                    //             // print("element is $element");
                    //           } else {}
                    //         }
                    //       }
                    //     },
                    //     builder: (context, state) {
                    //       return CalendarDatePicker2(
                    //         config: CalendarDatePicker2Config(
                    //             calendarType: CalendarDatePicker2Type.multi,
                    //             centerAlignModePicker: true),
                    //         onValueChanged: (value) {
                    //           print(value);
                    //           print(BlocProvider.of<BookingCubit>(context)
                    //               .timesCalender);
                    //           setState(() {
                    //             BlocProvider.of<BookingCubit>(context)
                    //                 .timesCalender
                    //                 .remove(value);
                    //           });
                    //         },
                    //         value: BlocProvider.of<BookingCubit>(context)
                    //             .timesCalender,
                    //         // onValueChanged: (dates) => _dates = dates,,
                    //       );
                    //     },
                    //   ),

                    if (widget.days != null || widget.days != '')
                      const SizedBox(
                        height: 20,
                      ),

                    // const Spacer(),
                    if (BlocProvider.of<BookingCubit>(context).checkin != '' &&
                        BlocProvider.of<BookingCubit>(context).checkout != '' &&
                        BlocProvider.of<BookingCubit>(context).checkin !=
                            null &&
                        BlocProvider.of<BookingCubit>(context).checkout != null)
                      defaultButton(
                          fun: () {
                            BlocProvider.of<BookingCubit>(context).addBooking(
                                coupon: BlocProvider.of<BookingCubit>(context)
                                        .coupon
                                        .text ??
                                    '',
                                id: widget.id,
                                start: DateFormat('MM/dd/yyyy', 'en').format(
                                    BlocProvider.of<BookingCubit>(context)
                                            .checkin ??
                                        DateTime.now()),
                                end: DateFormat('MM/dd/yyyy', 'en').format(
                                    BlocProvider.of<BookingCubit>(context)
                                            .checkout ??
                                        DateTime.now()));
                            // BlocProvider.of<BookingCubit>(context).addBooking(
                            //     id: widget.id,
                            //     start: DateFormat('yyyy-MM-dd').format(
                            //         BlocProvider.of<BookingCubit>(context)
                            //                 .checkin ??
                            //             DateTime.now()),
                            //     end: DateFormat('yyyy-MM-dd').format(
                            //         BlocProvider.of<BookingCubit>(context)
                            //                 .checkout ??
                            //             DateTime.now()));
                            // NavegatorPush(
                            //     context,
                            //     PaymentScreen(
                            //         id: widget.id,
                            //         start: DateFormat('MM/dd/yyyy', 'en').format(
                            //             BlocProvider.of<BookingCubit>(context)
                            //                     .checkin ??
                            //                 DateTime.now()),
                            //         end: DateFormat('MM/dd/yyyy', 'en').format(
                            //             BlocProvider.of<BookingCubit>(context)
                            //                     .checkout ??
                            //                 DateTime.now())));
                          },
                          textWidget: state is ADDBookingLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  S.of(context).Confirm,
                                  style: StylesData.font13,
                                ),
                          height: 54,
                          c: ConstColor.kMainColor),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

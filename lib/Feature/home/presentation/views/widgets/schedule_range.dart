import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Booking%20cubit/booking_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Booking%20cubit/booking_state.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Home%20Cubit/home_state.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_state.dart';
import 'package:shawati/generated/l10n.dart';

List<String> days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

List<String> daysArabic = [
  'الاثنين',
  'الثلاثاء',
  'الاربعاء',
  'الخميس',
  'الجمعه',
  'السبت',
  'الاحد'
];

class ScheduleRange extends StatelessWidget {
  const ScheduleRange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffE9F0FF),
            border: Border.all(color: ConstColor.kMainColor),
            borderRadius: BorderRadius.circular(23),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      S.of(context).CHECKIN,
                      style: StylesData.font12
                          .copyWith(color: const Color(0xff717784)),
                    ),
                    Text(
                      "${DateFormat('MMMM dd').format(BlocProvider.of<BookingCubit>(context).checkin ?? DateTime.now()).substring(0, 3)} ${DateFormat('MMMM dd').format(BlocProvider.of<BookingCubit>(context).checkin ?? DateTime.now()).substring(DateFormat('MMMM dd').format(BlocProvider.of<BookingCubit>(context).checkin ?? DateTime.now()).length - 2, DateFormat('MMMM dd').format(BlocProvider.of<BookingCubit>(context).checkin ?? DateTime.now()).length)}" ??
                          '',
                      style: StylesData.font24Google,
                    ),
                    Text(
                      LocalizationCubit.get(context).isArabic()
                          ? daysArabic[(BlocProvider.of<BookingCubit>(context)
                                      .checkin
                                      ?.weekday)! -
                                  1 ??
                              0]
                          : days[(BlocProvider.of<BookingCubit>(context)
                                      .checkin
                                      ?.weekday)! -
                                  1 ??
                              0],
                      style: StylesData.font14,
                    ),
                  ],
                ),
              ),
              Image(
                width: 60,
                image: AssetImage(
                  LocalizationCubit.get(context).isArabic()
                      ? AssetsData.lineback
                      : AssetsData.line,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      S.of(context).CHECKOUT,
                      style: StylesData.font12
                          .copyWith(color: const Color(0xff717784)),
                    ),
                    Text(
                      "${DateFormat('MMMM dd').format(BlocProvider.of<BookingCubit>(context).checkout ?? DateTime.now()).substring(0, 3)} ${DateFormat('MMMM dd').format(BlocProvider.of<BookingCubit>(context).checkout ?? DateTime.now()).substring(DateFormat('MMMM dd').format(BlocProvider.of<BookingCubit>(context).checkout ?? DateTime.now()).length - 2, DateFormat('MMMM dd').format(BlocProvider.of<BookingCubit>(context).checkout ?? DateTime.now()).length)}" ??
                          '',
                      style: StylesData.font24Google,
                    ),
                    Text(
                      LocalizationCubit.get(context).isArabic()
                          ? daysArabic[(BlocProvider.of<BookingCubit>(context)
                                      .checkout
                                      ?.weekday)! -
                                  1 ??
                              0]
                          : days[(BlocProvider.of<BookingCubit>(context)
                                      .checkout
                                      ?.weekday)! -
                                  1 ??
                              0],
                      style: StylesData.font14,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

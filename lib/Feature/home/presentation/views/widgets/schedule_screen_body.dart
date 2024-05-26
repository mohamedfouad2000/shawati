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
import 'package:shawati/Feature/home/presentation/views/screens/payment_screen.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/calendar_details.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/date_time_range.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // BlocProvider.of<BookingCubit>(context).checkin = null;
    // BlocProvider.of<BookingCubit>(context).checkout = null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingCubit(HomeRepoImpl()),
      child: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {
          if (state is ADDBookingSucc) {
            showToast(msq: state.msq);
            Nav(context, const HomeView(currentidex: 0));
          } else if (state is ADDBookingError) {
            showToast(msq: state.msg);
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
                      BlocProvider.of<BookingCubit>(context).checkin != null &&
                      BlocProvider.of<BookingCubit>(context).checkout != null)
                    const ScheduleRange(),
                  if (BlocProvider.of<BookingCubit>(context).checkin != '' &&
                      BlocProvider.of<BookingCubit>(context).checkout != '')
                    const SizedBox(
                      height: 18,
                    ),
                  ScheduleClockInOut(
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
                  if (widget.days != null || widget.days != '')
                    CalendarDetails(
                      fromdate: widget.days,
                      todate: widget.days,
                    ),
                  if (widget.days != null || widget.days != '')
                    const SizedBox(
                      height: 10,
                    ),
                  // const Spacer(),
                  if (BlocProvider.of<BookingCubit>(context).checkin != '' &&
                      BlocProvider.of<BookingCubit>(context).checkout != '' &&
                      BlocProvider.of<BookingCubit>(context).checkin != null &&
                      BlocProvider.of<BookingCubit>(context).checkout != null)
                    defaultButton(
                        fun: () {
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
                          NavegatorPush(
                              context,
                              PaymentScreen(
                                  id: widget.id,
                                  start: DateFormat('MM/dd/yyyy').format(
                                      BlocProvider.of<BookingCubit>(context)
                                              .checkin ??
                                          DateTime.now()),
                                  end: DateFormat('MM/dd/yyyy').format(
                                      BlocProvider.of<BookingCubit>(context)
                                              .checkout ??
                                          DateTime.now())));
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
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/model/home_model/service.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Booking%20cubit/booking_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Booking%20cubit/booking_state.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/booking_details_screen_body.dart';
import 'package:shawati/generated/l10n.dart';

class BookingDetailsScreenWithId extends StatefulWidget {
  const BookingDetailsScreenWithId({
    super.key,
    required this.id,
  });
  final int id;

  @override
  State<BookingDetailsScreenWithId> createState() =>
      _BookingDetailsScreenWithIdState();
}

class _BookingDetailsScreenWithIdState
    extends State<BookingDetailsScreenWithId> {
  int modelId = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          title: InkWell(
            onTap: () {
              modelId != 0
                  ? showRatingDialog(context: context, id: modelId ?? 0)
                  : null;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: ConstColor.kMainColor)),
              child: Text(
                S.of(context).AddRating,
                style: StylesData.font20.copyWith(fontSize: 18),
              ),
            ),
          )),
      body: BlocProvider(
        create: (context) => BookingCubit(HomeRepoImpl())
          ..getBookingDeatilsWithId(id: widget.id),
        child: BlocConsumer<BookingCubit, BookingState>(
          listener: (context, state) {
            if (state is GetBookingDataWithIDSucc) {
              setState(() {
                modelId = state.Model.data?.service?.id ?? 0;
              });
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is GetBookingDataWithIDSucc) {
              print(
                  "widget model lat ${state.Model.data?.startAt.toString()} lng ${state.Model.data?.endAt.toString()}");

              return BookingDetailsScreenBody(
                  paymentStatusId: state.Model.data?.paymentStatusId ?? 0,
                  id: state.Model.data?.id ?? 0,
                  startTime: state.Model.data?.startAt ?? '',
                  endTime: state.Model.data?.endAt ?? '',
                  model: state.Model.data?.service ?? Service(),
                  attachment: state.Model.data?.attachment,
                  bookingid: state.Model.data?.id ?? 0,
                  bookingStatusId: state.Model.data?.bookingStatusId);
            } else if (state is GetBookingDataWithIDError) {
              return Text(state.msg.toString());
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

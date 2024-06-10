import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:shawati/Core/constans/const.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/model/home_model/service.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/manager/ServesPrices%20Cubit/serves_prices_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/screens/google_maps_screen.dart';
import 'package:shawati/Feature/home/presentation/views/screens/payment_screen.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/amount_payment.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/booking_product.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/calendar_details.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/map_widget.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/payment_method.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/test_calender.dart';
import 'package:shawati/generated/l10n.dart';

class BookingDetailsScreenBody extends StatefulWidget {
  const BookingDetailsScreenBody({
    super.key,
    required this.model,
    this.attachment,
    required this.bookingStatusId,
    required this.bookingid,
    required this.startTime,
    required this.endTime,
    required this.id,
    required this.paymentStatusId,
  });
  final Service model;
  final String? attachment;
  final int bookingStatusId;
  final int paymentStatusId;

  final int bookingid;
  final String startTime;
  final String endTime;
  final int id;

  @override
  State<BookingDetailsScreenBody> createState() =>
      _BookingDetailsScreenBodyState();
}

class _BookingDetailsScreenBodyState extends State<BookingDetailsScreenBody> {
  List<DateTime> Times = [];
  List<Marker> markers = [];

  @override
  void initState() {
    print(widget.model.eventDays);
    setState(() {
      markers.add(Marker(
        point: LatLng(
            widget.model.lat != '' &&
                    widget.model.lat != 'null' &&
                    widget.model.lat != null
                ? double.parse(widget.model.lat.toString())
                : 0,
            widget.model.lng != '' &&
                    widget.model.lng != 'null' &&
                    widget.model.lng != null
                ? double.parse(widget.model.lng.toString())
                : 0),
        child: const Icon(
          Icons.location_pin,
          size: 60,
          color: Colors.red,
        ),
      ));
    });

    // var x = DateFormat.yMd('en_US').parse(widget.startTime);
    // var y = DateFormat.yMd('en_US').parse(widget.endTime);
    // start = x.toString().substring(0, 10);
    // end = y.toString().substring(0, 10);
    print(
        "widget this is  model lat ${widget.startTime.toString()} lng ${widget.endTime.toString()}");

    // TODO: implement initState
    super.initState();
    if (widget.model.eventDays?.length != null &&
        // ignore: unrelated_type_equality_checks
        widget.model.eventDays != 0) {
      for (int i = 0; i < widget.model.eventDays!.length; i++) {
        Times.add(
            DateFormat.yMd('en_US').parse(widget.model.eventDays![i].day!));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print('opop');
    print(widget.model.lat.toString());
    print(widget.model.lng.toString());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookingProduct(
              paymentStatusId: widget.paymentStatusId,
              name: widget.model.name ?? '',
              place: widget.model.place ?? '',
              bed: widget.model.bed.toString(),
              bath: widget.model.bath.toString(),
              floor: widget.model.floor.toString(),
              clockin: widget.startTime ?? '',
              clockout: widget.endTime ?? '',
              price: widget.model.regularPrice.toString(),
              features: widget.model.features ?? [],
              images: widget.model.gallery ?? [],
              image: widget.model.image ?? '',
              namear: widget.model.nameAr ?? '',
              placear: widget.model.placeAr ?? '',

              // nameAr: model.nameAr ?? '',
            ),
            const SizedBox(
              height: 15,
            ),
            // const BookingPaymentMethod(),
            // const SizedBox(
            //   height: 15,
            // ),

            // InkWell(
            //   onTap: () {
            //     // showEventsDays(context);
            //   },
            //   child: TestCalender(
            //       highlightedDates: Times, days: widget.model.days ?? ''),
            // ),

            const SizedBox(
              height: 8,
            ),
            CalendarDetails(
              fromdate:
                  '${widget.startTime.substring(5, 7)}/${widget.startTime.substring(8, 10)}/${widget.startTime.substring(0, 4)}' ??
                      '',
              todate:
                  '${widget.endTime.trim().substring(5, 7)}/${widget.endTime.trim().substring(8, 10)}/${widget.endTime.trim().substring(0, 4)}' ??
                      '',
            ),
            // const SizedBox(
            //   height: 15,
            // ),
            //2024-01-01
            const SizedBox(
              height: 10,
            ),

            // if (widget.attachment != null)
            //   const SizedBox(
            //     height: 10,
            //   ),

            // if (widget.attachment != null)
            //   SizedBox(
            //     height: 300,
            //     child: CachedImage('$xURLIMAGE${widget.attachment}'),
            //   ),
            const Center(
              child: SizedBox(
                height: 10,
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            SizedBox(
              height: 300,
              child: FlutterMaps(
                latLng: LatLng(
                    widget.model.lat != ''
                        ? double.parse(widget.model.lat.toString())
                        : 0,
                    widget.model.lng != ''
                        ? double.parse(widget.model.lng.toString())
                        : 0),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            if (widget.bookingStatusId != 3)
              BlocProvider(
                create: (context) => ServesPricesCubit(HomeRepoImpl())
                  ..getServesPrices(
                    bookingId: widget.bookingid,
                    coupon: '',
                    serid: widget.model.id ?? 0,
                    startAt:
                        '${widget.startTime.substring(5, 7)}/${widget.startTime.substring(8, 10)}/${widget.startTime.substring(0, 4)}',
                    endAt:
                        '${widget.endTime.trim().substring(5, 7)}/${widget.endTime.trim().substring(8, 10)}/${widget.endTime.trim().substring(0, 4)}',
                  ),
                child: AmountPayment(
                  fromBooking: true,
                  id: widget.model.id ?? 0,
                  start:
                      '${widget.startTime.substring(5, 7)}/${widget.startTime.substring(8, 10)}/${widget.startTime.substring(0, 4)}',
                  end:
                      '${widget.endTime.trim().substring(5, 7)}/${widget.endTime.trim().substring(8, 10)}/${widget.endTime.trim().substring(0, 4)}',
                ),
              ),

            if (widget.bookingStatusId == 3)
              defaultButton(
                  fun: () {
                    NavegatorPush(
                        context,
                        PaymentScreen(
                          coupon: '',
                          bookingId: widget.bookingid,
                          serid: widget.model.id ?? 0,
                          startAt:
                              '${widget.startTime.substring(5, 7)}/${widget.startTime.substring(8, 10)}/${widget.startTime.substring(0, 4)}',
                          endAt:
                              '${widget.endTime.trim().substring(5, 7)}/${widget.endTime.trim().substring(8, 10)}/${widget.endTime.trim().substring(0, 4)}',
                          attachment: widget.attachment ?? '',
                        ));
                  },
                  textWidget: Text(
                    S.of(context).Payment,
                    style: StylesData.font13,
                  ),
                  height: 54,
                  c: ConstColor.kMainColor),

            // Center(
            //   child: TextButton(
            //       onPressed: () {

            //       },
            //       child: Text(widget.attachment != null
            //           ? S.of(context).changeImage
            //           : S.of(context).Upload_your_payment_screen_here)),
            // ),

            // defaultButton(
            //     fun: () {
            //       showRatingDialog(context: context, id: model.id ?? 0);
            //     },
            //     textWidget: const Text("Add Rating"),
            //     c: Colors.yellow)
          ],
        ),
      ),
    );
  }

  Widget FlutterMaps({
    required LatLng latLng,
  }) =>
      FlutterMap(
        options: MapOptions(
            initialCenter: latLng.latitude == 0.0
                ? const LatLng(30.24298477377279, 20.193709855752914)
                : latLng,
            initialZoom: 11,
            interactionOptions:
                const InteractionOptions(flags: InteractiveFlag.doubleTapZoom)),
        children: [
          InkWell(
            onTap: () {
              NavegatorPush(
                  context,
                  FlutterMapsScreen(
                    latLng: LatLng(
                        widget.model.lat != '' &&
                                widget.model.lat != 'null' &&
                                widget.model.lat != null
                            ? double.parse(widget.model.lat.toString())
                            : 0,
                        widget.model.lng != '' &&
                                widget.model.lng != 'null' &&
                                widget.model.lng != null
                            ? double.parse(widget.model.lng.toString())
                            : 0),
                  ));
            },
            child: TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
          ),
          // RichAttributionWidget(
          //   attributions: [
          //     TextSourceAttribution(
          //       'OpenStreetMap contributors',
          //       onTap: () => launchUrl(
          //         Uri.parse('https://openstreetmap.org/copyright'),
          //       ),
          //     ),
          //   ],
          // ),
          MarkerLayer(markers: markers)
        ],
      );
}

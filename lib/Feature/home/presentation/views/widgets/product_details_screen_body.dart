import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/model/home_model/contact_details.dart';
import 'package:shawati/Feature/home/data/model/home_model/service.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/screens/google_maps_screen.dart';
import 'package:shawati/Feature/home/presentation/views/screens/schedule_screen.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/calendar_details.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/map_widget.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/owner_product.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/product_image.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/test_calender.dart';
import 'package:shawati/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class ProductDetailsScreenBody extends StatefulWidget {
  const ProductDetailsScreenBody(
      {super.key, required this.model, required this.owner});
  final Service model;
  final ContactDetails owner;

  @override
  State<ProductDetailsScreenBody> createState() =>
      _ProductDetailsScreenBodyState();
}

class _ProductDetailsScreenBodyState extends State<ProductDetailsScreenBody> {
  List<Marker> markers = [];

  List<DateTime> Times = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < widget.model.eventDays!.length; i++) {
      Times.add(DateFormat.yMd('en_US').parse(widget.model.eventDays![i].day!));
    }
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
  }

  @override
  Widget build(BuildContext context) {
    print("aha ${widget.model.lat} ${widget.model.lng}");

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(
                clockin: widget.model.days ?? '',
                clockout: widget.model.days ?? '',
                features: widget.model.features ?? [],
                images: widget.model.gallery ?? [],
                image: widget.model.image ?? '',
                name: widget.model.name ?? '',
                nameAr: widget.model.nameAr ?? '',
                place: widget.model.place ?? '',
                rate: widget.model.rate ?? 5,
                bed: widget.model.bed ?? 0,
                bath: widget.model.bath ?? 0,
                floor: widget.model.floor ?? 0,
                placear: widget.model.placeAr ?? '',
                price: int.parse(widget.model.regularPrice.toString()) ?? 0),
            const SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).AboutApartment,
              style: StylesData.font24Google.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              LocalizationCubit.get(context).isArabic()
                  ? widget.model.descriptionAr ?? ''
                  : widget.model.description ?? '',
              style: StylesData.font11.copyWith(color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            // Text(
            //   S.of(context).LestingAgent,
            //   style: StylesData.font24Google.copyWith(fontSize: 18),
            // ),
            // const SizedBox(
            //   height: 8,
            // ),

            OwnerProduct(
              owner: widget.owner,
              image: widget.model.user?.image ?? '',
              name: widget.model.user?.name ?? '',
            ),
            const SizedBox(
              height: 10,
            ),
            // Text(
            //   S.of(context).InvalidDays,
            //   style: StylesData.font24Google.copyWith(fontSize: 18),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            Row(
              children: [
                Text(S.of(context).AvailableDays, style: StylesData.font11),
                const SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  backgroundColor: ConstColor.kMainColor,
                  radius: 5,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(S.of(context).eventdays, style: StylesData.font11),
                const SizedBox(
                  width: 5,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 5,
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            // const SizedBox(
            //   height: 8,
            // ),
            // Text(S.of(context).eventdays, style: StylesData.font16),
            // const SizedBox(
            //   height: 8,
            // ),
            InkWell(
              onTap: () {
                showEventsDays(context);
              },
              child: TestCalender(
                  highlightedDates: Times, days: widget.model.days ?? ''),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).Location,
              style: StylesData.font24Google.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 300,
                child: FlutterMaps(
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
                )),
            const SizedBox(
              height: 10,
            ),
            defaultButton(
                fun: () {
                  NavegatorPush(
                      context,
                      ScheduleScreen(
                        id: widget.model.id!,
                        days: widget.model.days.toString(),
                      ));
                },
                textWidget: Text(
                  S.of(context).Applyfilters,
                  style: StylesData.font13,
                ),
                height: 54,
                c: ConstColor.kMainColor),
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
  void showEventsDays(context) {
    var x = AlertDialog(
      surfaceTintColor: Colors.white,
      title: Text(
        S.of(context).eventdays,
      ),
      content: SizedBox(
        height: 200,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: 150,
                  child: widget.model.eventDays!.isNotEmpty
                      ? ListView.builder(
                          itemCount: widget.model.eventDays!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Text(
                                LocalizationCubit.get(context).isArabic()
                                    ? ' ${S.of(context).SAR} ${widget.model.eventDays?[index].price.toString()}    ${widget.model.eventDays?[index].day?.substring(0, 10)}'
                                    : '${widget.model.eventDays?[index].day.toString().substring(0, 10)}    ${widget.model.eventDays?[index].price} ${S.of(context).SAR}',
                              ),
                            );
                          },
                        )
                      : Text(S.of(context).NoData)),
            ],
          ),
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return x;
        });
  }
}

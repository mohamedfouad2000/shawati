import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/model/home_model/contact_details.dart';
import 'package:shawati/Feature/home/data/model/home_model/service.dart';
import 'package:shawati/Feature/home/presentation/views/screens/google_maps_screen.dart';
import 'package:shawati/Feature/home/presentation/views/screens/schedule_screen.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/calendar_details.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/map_widget.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/owner_product.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/product_image.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                image: widget.model.image ?? '',
                name: widget.model.name ?? '',
                nameAr: widget.model.nameAr ?? '',
                place: widget.model.place ?? '',
                rate: widget.model.rate ?? 5,
                bed: widget.model.bed ?? 0,
                bath: widget.model.bath ?? 0,
                floor: widget.model.floor ?? 0,
                price: widget.model.price ?? 0),
            const SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).AboutApartment,
              style: StylesData.font24Google.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.model.description ?? '',
              style: StylesData.font11.copyWith(color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              S.of(context).LestingAgent,
              style: StylesData.font24Google.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            OwnerProduct(owner: widget.owner),
            const SizedBox(
              height: 8,
            ),
            CalendarDetails(
              fromdate: '${widget.model.days}',
              todate: '${widget.model.days}',
            ),
            const SizedBox(
              height: 8,
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
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () => launchUrl(
                  Uri.parse('https://openstreetmap.org/copyright'),
                ),
              ),
            ],
          ),
          MarkerLayer(markers: markers)
        ],
      );
}

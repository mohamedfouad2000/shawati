import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapFlutter extends StatefulWidget {
  const MapFlutter({super.key, required this.latLng});
  final LatLng latLng;

  @override
  State<MapFlutter> createState() => _MapFlutterState();
}

class _MapFlutterState extends State<MapFlutter> {
  // late MapController controller;
  List<Marker> markers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller = MapController();
    setState(() {
      markers.add(Marker(
        point: widget.latLng,
        child: const Icon(
          Icons.location_pin,
          size: 60,
          color: Colors.red,
        ),
      ));
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: MapController(),
      options: MapOptions(
        initialCenter: widget.latLng.latitude == 0.0
            ? const LatLng(30.24298477377279, 20.193709855752914)
            : widget.latLng,
        initialZoom: 11,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
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
}

// import 'package:flutter/cupertino.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class GoogleMapWidget extends StatefulWidget {
//   const GoogleMapWidget({super.key, required this.latLng});
//   final LatLng latLng;

//   @override
//   State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
// }

// class _GoogleMapWidgetState extends State<GoogleMapWidget> {
//   Set<Marker> marker = {};
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print("object is ${widget.latLng}");
//     var myLocationMarker = Marker(
//         markerId: MarkerId(widget.latLng.toString()),
//         position: widget.latLng,
//         infoWindow: const InfoWindow(title: 'Your Location'),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure));

//     // marker.add(myLocationMarker!);
//     // setState(() {});
//     marker.add(myLocationMarker);
//     // }
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: GoogleMap(
//         onMapCreated: (controller) {
//           // if (widget.latLng.latitude != 0) {
//         },
//         initialCameraPosition: CameraPosition(
//           target: widget.latLng.latitude == 0
//               ? const LatLng(30.24298477377279, 31.193709855752914)
//               : widget.latLng,
//           zoom: 10,
//         ),
//         markers: marker,
//       ),
//     );
//   }
// }

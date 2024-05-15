// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:shawati/Core/utils/colors.dart';
// import 'package:shawati/Core/utils/components.dart';
// import 'package:shawati/Core/utils/location_serves.dart';
// import 'package:shawati/Core/utils/styles.dart';
// import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
// import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';
// import 'package:shawati/Feature/home/presentation/views/screens/filter_screen.dart';

// class CustomGoogleMap extends StatefulWidget {
//   const CustomGoogleMap({super.key, l, required this.locationdata});
//   final LocationData locationdata;

//   @override
//   State<CustomGoogleMap> createState() => _CustomGoogleMapState();
// }

// class _CustomGoogleMapState extends State<CustomGoogleMap> {
//   late CameraPosition initialCameraPostion;
//   GoogleMapController? googleMapController;

//   Set<Marker> markers = {};
//   Marker? myLocationMarker;

//   // late LocationService locationService;
//   @override
//   void initState() {
//     initialCameraPostion = CameraPosition(
//         zoom: 17,
//         target: LatLng(
//             widget.locationdata.latitude!, widget.locationdata.longitude!));
//     myLocationMarker = Marker(
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//         markerId: const MarkerId('my_location_marker'),
//         position: LatLng(
//             widget.locationdata.latitude!, widget.locationdata.longitude!));

//     markers.add(myLocationMarker!);
//     setState(() {});
//     // locationService = LocationService();
//     // updateMyLocation();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SearchCubit, SearchState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return Scaffold(
//           appBar: customAppBar(context, title: const Text("Set Location")),
//           body: Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               GoogleMap(
//                 markers: markers,
//                 myLocationEnabled: true,
//                 myLocationButtonEnabled: true,
//                 // zoomControlsEnabled: false,
//                 onTap: (Lat) {
//                   myLocationMarker = Marker(
//                       icon: BitmapDescriptor.defaultMarkerWithHue(
//                           BitmapDescriptor.hueBlue),
//                       markerId: const MarkerId('my_location_marker'),
//                       position: LatLng(Lat.latitude, Lat.longitude));

//                   markers.add(myLocationMarker!);
//                   setState(() {});
//                 },
//                 onCameraMove: (position) {
//                   myLocationMarker = Marker(
//                       icon: BitmapDescriptor.defaultMarkerWithHue(
//                           BitmapDescriptor.hueBlue),
//                       markerId: const MarkerId('my_location_marker'),
//                       position: LatLng(
//                           position.target.latitude, position.target.longitude));

//                   markers.add(myLocationMarker!);

//                   setState(() {});
//                 },
//                 onMapCreated: (controller) {
//                   print("object");
//                   googleMapController = controller;
//                   // controller.getLatLng(const ScreenCoordinate(x: 10, y: 20));
//                 },
//                 initialCameraPosition: initialCameraPostion,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: defaultButton(
//                     fun: () {
//                       LocationData? location = widget.locationdata;
//                       print(myLocationMarker?.position.latitude);
//                       print(myLocationMarker?.position.longitude);
//                       location.latitude != myLocationMarker?.position.latitude;
//                       location.longitude !=
//                           myLocationMarker?.position.longitude;

//                       NavegatorPush(context, FilterScreen(location: location));
//                     },
//                     textWidget: Text("Set Location",
//                         style: StylesData.font12Rubik
//                             .copyWith(color: Colors.white)),
//                     c: ConstColor.kMainColor),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }

//   // void updateMyLocation() async {
//   //   await locationService.checkAndRequestLocationService();
//   //   var hasPermission =
//   //       await locationService.checkAndRequestLocationPermission();
//   //   if (hasPermission) {
//   //     locationService.getRealTimeLocationData((locationData) {
//   //       setMyLocationMarker(locationData);
//   //       setMyCameraPosition(locationData);
//   //     });
//   //   } else {}
//   // }

//   // void setMyCameraPosition(LocationData locationData) {
//   //   var camerPosition = CameraPosition(
//   //       target: LatLng(locationData.latitude!, locationData.longitude!),
//   //       zoom: 15);

//   //   googleMapController
//   //       ?.animateCamera(CameraUpdate.newCameraPosition(camerPosition));
//   // }

//   // void setMyLocationMarker(LocationData locationData) {
//   //    myLocationMarker = Marker(
//   //       markerId: const MarkerId('my_location_marker'),
//   //       position: LatLng(locationData.latitude!, locationData.longitude!));

//   //   markers.add(myLocationMarker);
//   //   setState(() {});
//   // }
// }

// // inquire about location service
// // request permission
// // get location
// // display

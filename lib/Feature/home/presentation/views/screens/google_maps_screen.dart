import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/map_widget.dart';
import 'package:shawati/generated/l10n.dart';

class FlutterMapsScreen extends StatelessWidget {
  const FlutterMapsScreen({super.key, required this.latLng});
  final LatLng latLng;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          title: InkWell(
            onTap: () {
              launchMapsUrl(latLng.latitude, latLng.longitude);
              // print('widget model lat $startTime $endTime');
              // showRatingDialog(context: context, id: model.id ?? 0);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: ConstColor.kMainColor)),
              child: Text(
                S.of(context).GoToThisLocation,
                style: StylesData.font20.copyWith(fontSize: 18),
              ),
            ),
          )),
      //

      body: MapFlutter(latLng: latLng),
    );
  }
}

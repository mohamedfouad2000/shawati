import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/home_view.dart';
import 'package:shawati/Feature/home/presentation/views/manager/location%20cubit/location_cubit.dart';
import 'package:shawati/generated/l10n.dart';

class SetLocationScreen extends StatefulWidget {
  const SetLocationScreen({super.key, required this.location});
  final LocationData location;

  @override
  State<SetLocationScreen> createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, title: Text(S.of(context).setlocation)),
        body: BlocProvider(
          create: (context) => LocationCubit(HomeRepoImpl()),
          child: BlocConsumer<LocationCubit, LocationState>(
            listener: (context, state) {
              if (state is LocationSucc) {
                Nav(context, const HomeView(currentidex: 0));
              }
            },
            builder: (context, state) {
              return Container(
                  child: OpenStreetMapSearchAndPick(
                      buttonTextStyle: const TextStyle(
                          fontSize: 18, fontStyle: FontStyle.normal),
                      // center: LatLong(23, 89),
                      // buttonHeight: ,
                      buttonColor: Colors.blue,
                      buttonText: state is LocationLoading
                          ? S.of(context).Loading
                          : S.of(context).setlocation,
                      onPicked: (pickedData) {
                        setState(() {
                          // SearchCubit.get(context).lat =
                          //     pickedData.latLong.latitude;
                          // SearchCubit.get(context).lat =
                          //     pickedData.latLong.longitude;
                        });
                        print(pickedData.latLong.latitude);
                        print(pickedData.latLong.longitude);
                        print(pickedData.address);

                        BlocProvider.of<LocationCubit>(context).setLocation(
                            lat: pickedData.latLong.latitude,
                            long: pickedData.latLong.longitude);
                        // Navigator.pop(context);
                      }));
            },
          ),
        ));
  }
}

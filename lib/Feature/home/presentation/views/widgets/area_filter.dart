import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Search%20Cubit/search_state.dart';
import 'package:shawati/generated/l10n.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class AreaFIltter extends StatefulWidget {
  const AreaFIltter({
    super.key,
    required this.location,
  });
  final LocationData location;

  @override
  State<AreaFIltter> createState() => _AreaFIltterState();
}

class _AreaFIltterState extends State<AreaFIltter> {
  // int currentIndex = 0;
  var mincontroller = TextEditingController();
  var maxcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (SearchCubit.get(context).lat != null) {
      return BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).Area,
                style: StylesData.font16,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                        height: 45,
                        child: customTextFiled(
                            controller: mincontroller,
                            onChanged: (i) {
                              SearchCubit.get(context).minarea = i;
                            },
                            hintText: S.of(context).min,
                            type: TextInputType.number)),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 20,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: SizedBox(
                        height: 45,
                        child: customTextFiled(
                            controller: maxcontroller,
                            onChanged: (i) {
                              SearchCubit.get(context).maxarea = i;
                            },
                            hintText: S.of(context).max,
                            type: TextInputType.number)),
                  ),
                ],
              )
            ],
          );
        },
      );
    } else {
      return defaultButton(
          fun: () async {
            ShowModeSheet(context);
          },
          textWidget: Text(
            'Set Location',
            style: StylesData.font13.copyWith(color: Colors.black),
          ),
          height: 54,
          c: Colors.white);
    }
  }

  void ShowModeSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              child: OpenStreetMapSearchAndPick(
                  buttonTextStyle: const TextStyle(
                      fontSize: 18, fontStyle: FontStyle.normal),
                  // center: LatLong(23, 89),
                  // buttonHeight: ,
                  buttonColor: Colors.blue,
                  buttonText: 'Set Current Location',
                  onPicked: (pickedData) {
                    setState(() {
                      SearchCubit.get(context).lat =
                          pickedData.latLong.latitude;
                      SearchCubit.get(context).lat =
                          pickedData.latLong.longitude;
                    });
                    print(pickedData.latLong.latitude);
                    print(pickedData.latLong.longitude);
                    print(pickedData.address);
                    Navigator.pop(context);
                  }));
        });
  }
}

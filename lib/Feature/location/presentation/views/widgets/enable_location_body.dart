import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/home_view.dart';
import 'package:shawati/Feature/home/presentation/views/manager/Location%20cubit/location_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/manager/local/localication_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/screens/set_location_screen.dart';

import 'package:shawati/Feature/splash/presentation/views/widgets/tqnia_logo.dart';
import 'package:shawati/generated/l10n.dart';

class EnableLocationBody extends StatelessWidget {
  const EnableLocationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(HomeRepoImpl()),
      child: BlocConsumer<LocationCubit, LocationState>(
        listener: (context, state) {
          if (state is LocationSucc) {
            showToast(
                msq: LocalizationCubit.get(context).isArabic()
                    ? S.of(context).Successfull
                    : state.msq);
            Nav(
                context,
                const HomeView(
                  currentidex: 0,
                ));
          } else if (state is LocationError) {
            showToast(
                msq: LocalizationCubit.get(context).isArabic()
                    ? S.of(context).oppsMessage
                    : state.msg);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  S.of(context).EnableLocation,
                  style: StylesData.font24Google,
                ),
                Text(
                  S.of(context).chooseLocation,
                  style: StylesData.font12,
                ),
                Text(
                  S.of(context).aroundyou,
                  style: StylesData.font12,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Image(
                  image: AssetImage(
                    AssetsData.location,
                  ),
                  height: 120,
                  width: 120,
                ),
                const SizedBox(
                  height: 20,
                ),
                defaultButton(
                    fun: () async {
                      LocationData? data = await getloction();
                      print(data.latitude);
                      print(data.longitude);

                      BlocProvider.of<LocationCubit>(context).setLocation(
                          lat: data.latitude!, long: data.longitude!);
                    },
                    textWidget: Text(
                      S.of(context).AllowAccess,
                      style: StylesData.font13,
                    ),
                    height: 54,
                    c: ConstColor.kMainColor),
                const SizedBox(
                  height: 20,
                ),
                defaultButton(
                    fun: () async {
                      LocationData? data = await getloction();
                      print(data.latitude);
                      print(data.longitude);
                      NavegatorPush(context, SetLocationScreen(location: data));

                      // BlocProvider.of<LocationCubit>(context).setLocation(
                      //     lat: data.latitude!, long: data.longitude!);
                    },
                    textWidget: Text(
                      S.of(context).SetLocationManually,
                      style: StylesData.font13,
                    ),
                    height: 54,
                    c: ConstColor.kMainColor),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    Nav(
                        context,
                        const HomeView(
                          currentidex: 0,
                        ));
                  },
                  child: Text(
                    S.of(context).SkipForNow,
                    style: StylesData.font14.copyWith(color: Colors.black),
                  ),
                ),
                const Spacer(),
                const Center(child: TqniaLogo())
              ],
            ),
          );
        },
      ),
    );
  }
}

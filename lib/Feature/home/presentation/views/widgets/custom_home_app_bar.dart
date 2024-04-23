import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/screens/notification_screen.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: .7),
              borderRadius: const BorderRadius.all(
                Radius.circular(13),
              )),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Image(
              image: AssetImage(AssetsData.locationIcon),
              height: 15,
              width: 15,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Text(
              "Jeddah",
              style: StylesData.font24Google,
            ),
            Text(
              "Be1234m patricson st.",
              style: StylesData.font9,
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            NavegatorPush(context, const NotificationScreen());
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: .7),
                borderRadius: const BorderRadius.all(
                  Radius.circular(13),
                )),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage(AssetsData.notification),
                height: 15,
                width: 15,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsData.testimage),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              )),
        ),
      ],
    );
  }
}

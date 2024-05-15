import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/screens/notification_screen.dart';
import 'package:shawati/generated/l10n.dart';

class CustomBookingAppBar extends StatelessWidget {
  const CustomBookingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            S.of(context).MyBooking,
            style: StylesData.font24Google,
          ),
        ),
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
      ],
    );
  }
}

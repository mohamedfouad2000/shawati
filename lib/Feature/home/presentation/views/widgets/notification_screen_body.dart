import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/notification_item.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/notification_title.dart';

class NotificationScreenBody extends StatelessWidget {
  const NotificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NotificationTitle(),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Dec, 2023 19",
            style: StylesData.font12,
          ),
          const SizedBox(
            height: 15,
          ),
          const NotificationItem(),
          const SizedBox(
            height: 15,
          ),
          const NotificationItem(),
          const SizedBox(
            height: 15,
          ),
          const NotificationItem(),
        ],
      ),
    );
  }
}

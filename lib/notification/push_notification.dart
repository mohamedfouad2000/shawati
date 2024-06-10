import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/presentation/views/screens/booking_details_with_id_screen.dart';

import 'package:shawati/notification/local_notifications/notifications_serves.dart';

class NotificationSound {
  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage? message) async {
    print("backGround");
    print(message?.notification?.body);
    // 1 serves
    //2 requests
  }

  static Future<void> onMessageOpenedApp(RemoteMessage event) async {
    print("on message open");
    print(event.data.toString());
    print(event.notification?.body);
    print('on onMessage${event.data.toString()}');
    int x = event.data['model_id'].toString() == ''
        ? 0
        : int.parse(event.data['model_id'].toString());
    NavegatorPush(
        Get.context!,
        BookingDetailsScreenWithId(
          id: x ?? 0,
        ));

    print(event.notification?.title);
  }

  static Future<void> onMessage(RemoteMessage event) async {
    print("on onMessage");
    // print('on onMessage ${event.notification?.body}');
    // print('on onMessage${event.notification?.title}');
    print('on onMessage${event.data.toString()}');

    // print(event.notification?.titleLocArgs);
    // print(event.notification);
    LocalNotificationService.init(event: event);
    LocalNotificationService.showBasicNotification(
      body: event.notification?.body ?? '',
      title: event.notification?.title ?? '',
      id: 1,
    );

    // print(event.data.toString());
    // print(event.notification?.title);
    Fluttertoast.showToast(
        msg: event.notification!.body.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 18.0);
  }
}

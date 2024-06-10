import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shawati/Core/utils/components.dart';
import 'package:shawati/Feature/home/presentation/views/home_view.dart';
import 'package:shawati/Feature/home/presentation/views/screens/booking_details_with_id_screen.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();
  static onTap(
    NotificationResponse notificationResponse,
  ) {
    print("object is noti");

    print("x is $notificationResponse");
    print("x is ${notificationResponse.input}");

    streamController.add(notificationResponse);

    // Navigator.push(context, route);
  }

  static Future init({required RemoteMessage event}) async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(settings,
        onDidReceiveNotificationResponse: (i) {
      // print("on message open");
      // print(event.data.toString());
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
    }, onDidReceiveBackgroundNotificationResponse: (i) {
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
    });
  }

  //basic Notification
  static void showBasicNotification({
    required String title,
    required String body,
    required int id,
  }) async {
    AndroidNotificationDetails android = const AndroidNotificationDetails(
        'id1', 'basic notification',
        importance: Importance.max,
        priority: Priority.high,
        icon: "flutter_logo",
        channelShowBadge: true);
    NotificationDetails details = NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      details,
      payload: "Payload Data",
    );
  }

  //basic Notification2
  // static void showBasicNotification2() async {
  //   AndroidNotificationDetails android = AndroidNotificationDetails(
  //       'id 3', 'basic notification1',
  //       importance: Importance.max,
  //       priority: Priority.high,
  //       sound:
  //           RawResourceAndroidNotificationSound('sound.wav'.split('.').first));
  //   NotificationDetails details = NotificationDetails(
  //     android: android,
  //   );
  //   await flutterLocalNotificationsPlugin.show(
  //     4,
  //     'Basic Notification',
  //     'body',
  //     details,
  //     payload: "Payload Data",
  //   );
  // }

  // //showRepeatedNotification
  // static void showRepeatedNotification() async {
  //   const AndroidNotificationDetails android = AndroidNotificationDetails(
  //     'id 2',
  //     'repeated notification',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   NotificationDetails details = const NotificationDetails(
  //     android: android,
  //   );
  //   await flutterLocalNotificationsPlugin.periodicallyShow(
  //     1,
  //     'Reapated Notification',
  //     'body',
  //     RepeatInterval.daily,
  //     details,
  //     payload: "Payload Data",
  //   );
  // }

  // //showSchduledNotification
  // static void showSchduledNotification() async {
  //   const AndroidNotificationDetails android = AndroidNotificationDetails(
  //     'schduled notification',
  //     'id 3',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   NotificationDetails details = const NotificationDetails(
  //     android: android,
  //   );
  //   tz.initializeTimeZones();
  //   log(tz.local.name);
  //   log("Before ${tz.TZDateTime.now(tz.local).hour}");
  //   // final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
  //   // log(currentTimeZone);
  //   // tz.setLocalLocation(tz.getLocation(currentTimeZone));
  //   log(tz.local.name);
  //   log("After ${tz.TZDateTime.now(tz.local).hour}");
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     2,
  //     'Schduled Notification',
  //     'body',
  //     tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
  //     // tz.TZDateTime(
  //     //   tz.local,
  //     //   2024,
  //     //   2,
  //     //   10,
  //     //   21,
  //     //   30,
  //     // ),
  //     details,
  //     payload: 'zonedSchedule',
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //   );
  // }

  // //showDailySchduledNotification
  // static void showDailySchduledNotification() async {
  //   const AndroidNotificationDetails android = AndroidNotificationDetails(
  //     'daily schduled notification',
  //     'id 4',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   NotificationDetails details = const NotificationDetails(
  //     android: android,
  //   );
  //   tz.initializeTimeZones();
  //   tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
  //   var currentTime = tz.TZDateTime.now(tz.local);
  //   log("currentTime.year:${currentTime.year}");
  //   log("currentTime.month:${currentTime.month}");
  //   log("currentTime.day:${currentTime.day}");
  //   log("currentTime.hour:${currentTime.hour}");
  //   log("currentTime.minute:${currentTime.minute}");
  //   log("currentTime.second:${currentTime.second}");
  //   var scheduleTime = tz.TZDateTime(
  //     tz.local,
  //     currentTime.year,
  //     currentTime.month,
  //     currentTime.day,
  //     currentTime.hour,
  //     7,
  //   );
  //   log("scheduledTime.year:${scheduleTime.year}");
  //   log("scheduledTime.month:${scheduleTime.month}");
  //   log("scheduledTime.day:${scheduleTime.day}");
  //   log("scheduledTime.hour:${scheduleTime.hour}");
  //   log("scheduledTime.minute:${scheduleTime.minute}");
  //   log("scheduledTime.second:${scheduleTime.second}");
  //   if (scheduleTime.isBefore(currentTime)) {
  //     scheduleTime = scheduleTime.add(const Duration(hours: 1));
  //     log("AfterAddedscheduledTime.year:${scheduleTime.year}");
  //     log("AfterAddedscheduledTime.month:${scheduleTime.month}");
  //     log("AfterAddedscheduledTime.day:${scheduleTime.day}");
  //     log("AfterAddedscheduledTime.hour:${scheduleTime.hour}");
  //     log("AfterAddedscheduledTime.minute:${scheduleTime.minute}");
  //     log("AfterAddedscheduledTime.second:${scheduleTime.second}");
  //     log('Added Duration to scheduled time');
  //   }
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     3,
  //     'Daily Schduled Notification',
  //     'body',
  //     // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
  //     scheduleTime,
  //     details,
  //     payload: 'zonedSchedule',
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //   );
  // }

  // static void cancelNotification(int id) async {
  //   await flutterLocalNotificationsPlugin.cancel(id);
  // }
}

//1.setup. [Done]
//2.Basic Notification. [Done]
//3.Repeated Notification. [Done]
//4.Scheduled Notification. [Done]
//5.Custom Sound. [Done]
//6.on Tab. [Done]
//7.Daily Notifications at specific time. [Done]
//8.Real Example in To Do App.

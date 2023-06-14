// ignore_for_file: unused_local_variable, deprecated_member_use, unused_import, unused_field, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medi/screens/home/widgets/bottomsheet.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/tzdata.dart';
import 'package:timezone/timezone.dart';

class Notificationservices {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('pic');

    var initializationsettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {},
    );

    var initializationsettings = InitializationSettings(
        android: androidInitializationSettings, iOS: initializationsettingsIOS);
    await _notificationsPlugin.initialize(initializationsettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  Future notificationDetails() async {
    return const NotificationDetails(
        android: AndroidNotificationDetails('Channelid', 'Channename',
            importance: Importance.max,
            priority: Priority.high,
             sound:RawResourceAndroidNotificationSound('alarm_clock'),
            playSound: true,
            ongoing: true,
            autoCancel: false,
            visibility: NotificationVisibility.public,
            icon: '@mipmap/ic_launcher',
            category: AndroidNotificationCategory.reminder,
            enableVibration: true,
            enableLights: true,
            ledColor: Color.fromARGB(255, 236, 9, 43),
            ledOnMs: 1,
            ledOffMs: 0,
            color: Color.fromARGB(255, 250, 250, 248),
            largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
            ),
        iOS: DarwinNotificationDetails());
  }

  Future schedulenotification(
      {required int id,
      String? title,
      String? body,
      String? payload,
      required DateTime schedulenotificationdatetime}) async {
    return _notificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        TZDateTime.from(schedulenotificationdatetime, local),
        await notificationDetails(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

}

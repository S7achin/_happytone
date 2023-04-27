// ignore_for_file: depend_on_referenced_packages, unused_local_variable, avoid_print
import 'package:_happytone/src/services/notified_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../features/authentication/models/database_model/task.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation("Asia/Kolkata"));

    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings("logo");

    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {},
    );

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  notificationDetails() {
    // print("notificationDetails called");
    return const NotificationDetails(
      android: AndroidNotificationDetails("channelId", "channelName",
          importance: Importance.max, priority: Priority.max),
      iOS: DarwinNotificationDetails(),
    );
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    // print("Show notification called");
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }

  scheduledNotification(int hour, int minutes, Task task) async {
    // scheduledNotification() async {
    await notificationsPlugin.zonedSchedule(
      task.id!,
      task.title,
      task.note,
      _convertTime(hour, minutes),
      // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
      const NotificationDetails(
          android: AndroidNotificationDetails(
        'your channel id',
        'your channel name',
      )),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: "${task.title}|${task.note}|",
    );
  }

  tz.TZDateTime _convertTime(int hour, int minutes) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.getLocation("Asia/Kolkata"));
    tz.TZDateTime scheduleDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);
    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      print('notification payload: $payload');
    }
    if (payload == "Theme Changed") {
      //going nowhere
    } else {
      Get.to(() => NotifiedPage(payload!));
    }
  }
}


// Future selectNotification(String? payload) async {
  //   if (payload != null) {
  //     print('notification payload: $payload');
  //   } else {
  //     print("Notification Done");
  //   }

  //   if (payload == "Theme Changed") {
  //     //going nowhere
  //   } else {
  //     Get.to(() => NotifiedPage(payload!));
  //   }
  // }




  // await notificationsPlugin.initialize(
    //     initializationSettings,
    //     onDidReceiveBackgroundNotificationResponse: selectNotification();
    //     // onSelectNotification: selectNotification
    // );
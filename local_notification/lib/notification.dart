import 'package:notification1/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_10y.dart';
import 'package:timezone/timezone.dart';

void showNotification() {
  AndroidNotificationDetails anroidDetails = AndroidNotificationDetails(
      'notifications', 'flutter local notification',
      priority: Priority.max, importance: Importance.max);

  DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
    presentAlert: true,
    presentSound: true,
    presentBadge: true,
  );

  NotificationDetails combinedDetails =
      NotificationDetails(android: anroidDetails, iOS: iosDetails);

  notificationPlugin.show(
      0, 'flutter notification', 'local flutter notification', combinedDetails);
}

void showScheduleNotification() {
  AndroidNotificationDetails anroidDetails = AndroidNotificationDetails(
      'notifications', 'flutter local notification',
      priority: Priority.max, importance: Importance.max);

  DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
    presentAlert: true,
    presentSound: true,
    presentBadge: true,
  );

  NotificationDetails combinedDetails =
      NotificationDetails(android: anroidDetails, iOS: iosDetails);

  //To schedule the notification

  DateTime scheduleDate = DateTime.now().add(Duration(seconds: 2));
  notificationPlugin.zonedSchedule(
    0,
    'schedule notification',
    'this is schedule notification',
    TZDateTime.from(scheduleDate, local),
    combinedDetails,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.wallClockTime,
  );
}

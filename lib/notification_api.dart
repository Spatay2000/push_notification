import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'base id',
        'base name',
        importance: Importance.max,
        priority: Priority.high,
        showProgress: true,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future showNotification({
    int id = 0,
    required String title,
    required String body,
    required String payload,
  }) async {
    // var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    // var iOS = IOSInitializationSettings();

    // var initSetting = InitializationSettings(
    //   android: android,
    //   iOS: iOS,
    // );

    FlutterLocalNotificationsPlugin().initialize(
        // initSetting,
        InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: IOSInitializationSettings(),
    ));

    _notifications.show(id, title, body, await _notificationDetails(),
        payload: payload);
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import '../core/constants/app_config.dart';
import '../core/utils/shared_prefs_helper.dart';

class NotificationServices {
  static const String _apiKey = 'ADFRETYUUBFD!#@%*%4455iup!98SCZ@';
  static const String _appVersion = '1.0.0';
  static NotificationServices instance = NotificationServices._();

  NotificationServices._();

  factory NotificationServices() {
    return instance;
  }

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('user granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('user granted provisional permission');
      }
    } else {
      if (kDebugMode) {
        print('user denied permission');
      }
    }
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    if (kDebugMode) {
      print("this is token firebase $token");
    }
    return token!;
  }

  void initLocalNotifications() async {
    var androidInitializationSettings =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
    );
  }

  void firebaseInit() {
    initLocalNotifications();
    FirebaseMessaging.onMessage.listen((message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (kDebugMode) {
        print("notifications title:${notification?.title}");
        print("notifications body:${notification?.body}");
        print('count:${android?.count}');
        print('data:${message.data.toString()}');
      }

      showNotification(message);
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    if (message.notification == null) {
      return;
    }
    if (kDebugMode) {
      print(
        " channel id:  ${message.notification?.android?.channelId.toString()}",
      );
    }

    AndroidNotificationDetails androidNotificationDetails =
    const AndroidNotificationDetails(
        "high_importance_channel",
        "high_importance_channel",
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
        ticker: 'ticker'
    );

    DarwinNotificationDetails darwinNotificationDetails =
    const DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () async {
      await _flutterLocalNotificationsPlugin.show(
        0,
        message.notification?.title.toString() ?? '',
        message.notification?.body.toString() ?? '',
        notificationDetails,
      );
    });
  }

  /// إرسال توكن FCM إلى الخادم
  static Future<bool> sendToken(String fcmToken) async {
    try {
      String? token = SharedPrefsHelper.getString("token");
      if (token == null) {
        log("❌ لم يتم العثور على التوكن.");
        return false;
      }

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'x-api-key': _apiKey,
        'app-version': _appVersion,
      };

      var url = Uri.parse('${AppConfig.baseUrl}/auth/fcm-token');
      var body = json.encode({"fcm_token": fcmToken});

      var response = await http.patch(url, headers: headers, body: body);

      log("🔄 إرسال FCM Token... [${response.statusCode}]");

      if (response.statusCode == 200) {
        log("✅ تم إرسال التوكن بنجاح!");
        return true;
      } else {
        log("⚠️ فشل إرسال التوكن: ${response.body}");
        return false;
      }
    } catch (e) {
      log("❌ خطأ أثناء إرسال التوكن: $e");
      return false;
    }
  }
}

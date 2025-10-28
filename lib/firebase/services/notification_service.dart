import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize(BuildContext context) async {
    await _requestPermissions();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleForegroundNotification(context, message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _onNotificationClick(message);
    });

    FirebaseMessaging.onBackgroundMessage(_handleBackgroundNotification);

    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        _onNotificationClick(message);
      }
    });
  }

  Future<void> _requestPermissions() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional notifications');
    } else {
      print('User denied permission');
    }
  }

  Future<void> _handleForegroundNotification(
    BuildContext context,
    RemoteMessage message,
  ) async {
    _showAlertDialog(
      context,
      message.notification?.title ?? "TITLE",
      message.notification?.body ?? "BODY",
    );
  }

  void _showAlertDialog(BuildContext context, String title, String body) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text(title), content: Text(body));
      },
    );
  }

  void _onNotificationClick(RemoteMessage message) {
    print("Notification clicked");
    // Navigate
  }

  static Future<void> _handleBackgroundNotification(
    RemoteMessage message,
  ) async {
    print('Background message received');
  }
}

// permission handler

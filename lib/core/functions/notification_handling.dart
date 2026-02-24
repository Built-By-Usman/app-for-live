// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();
//
// // Background handler
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   _showNotification(message);
// }
//
// void _showNotification(RemoteMessage message) async {
//   const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
//     'chat_messages', 'Chat Messages',
//     channelDescription: 'Chat message notifications',
//     importance: Importance.max,
//     priority: Priority.high,
//   );
//
//   const NotificationDetails notificationDetails = NotificationDetails(android: androidDetails);
//
//   await flutterLocalNotificationsPlugin.show(
//     id: message.notification.hashCode, // ✅ explicitly name the parameter
//     title: message.notification?.title ?? "New Message",
//     body: message.notification?.body ?? "",
//     notificationDetails: notificationDetails,
//   );
// }
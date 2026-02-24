// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import '../../model/conversation_model.dart';
// import '../constant/app_route.dart';
//
// class NotificationService {
//   static final FlutterLocalNotificationsPlugin _local =
//   FlutterLocalNotificationsPlugin();
//
//   static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
//     'chat_channel', // id
//     'Chat Messages', // name
//     description: 'Chat message notifications',
//     importance: Importance.max,
//   );
//
//   /// ---------------- INIT ----------------
//   static Future<void> init() async {
//     // Android Initialization
//     const AndroidInitializationSettings androidSettings =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     // iOS Initialization (request permissions)
//     final DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//     );
//
//     final InitializationSettings initSettings = InitializationSettings(
//       android: androidSettings,
//       iOS: iosSettings,
//     );
//
//     // Initialize the plugin
//     await _local.initialize(
//       settings: initSettings,
//       onDidReceiveNotificationResponse: (details) async {
//         if (details.payload != null) {
//           _navigateToChat(details.payload!);
//         }
//       },
//     );
//
//     // Create notification channel for Android
//     await _local
//         .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(_channel);
//
//     // Request permission for iOS
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     await messaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     // Handle initial message (app terminated)
//     final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
//     if (initialMessage != null) {
//       _navigateToChat(initialMessage.data['conversationId']);
//     }
//
//     // Foreground messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       showNotification(message);
//     });
//
//     // Background / app opened via notification
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       _navigateToChat(message.data['conversationId']);
//     });
//   }
//
//   /// ---------------- SHOW NOTIFICATION ----------------
//   static Future<void> showNotification(RemoteMessage message) async {
//     if (message.notification == null) return;
//
//     final AndroidNotificationDetails androidDetails =
//     AndroidNotificationDetails(
//       _channel.id,
//       _channel.name,
//       channelDescription: _channel.description,
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );
//
//     final NotificationDetails details = NotificationDetails(android: androidDetails);
//
//     await _local.show(
//       id: message.hashCode, // Unique ID
//       title: message.notification?.title ?? 'New Message',
//       body: message.notification?.body ?? '',
//       notificationDetails: details, // NotificationDetails object
//       payload: message.data['conversationId'], // Optional payload
//     );
//   }
//
//   /// ---------------- NAVIGATION ----------------
//   static Future<void> _navigateToChat(String? conversationId) async {
//     if (conversationId == null) return;
//
//     try {
//       final doc = await FirebaseFirestore.instance
//           .collection('conversations')
//           .doc(conversationId)
//           .get();
//
//       if (!doc.exists) return;
//
//       final conversation = ConversationModel.fromJson(doc);
//
//       Get.toNamed(
//         AppRoute.chatDetail,
//         arguments: {"conversation": conversation},
//       );
//     } catch (e) {
//       print("Navigation error: $e");
//     }
//   }
// }
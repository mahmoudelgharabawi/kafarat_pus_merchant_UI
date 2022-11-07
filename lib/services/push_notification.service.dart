// import 'dart:convert';
// import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
// import 'package:flutter/material.dart';

// import 'package:tecfy_basic_package/tecfy_basic_package.dart';

// enum ObjectType { Order, ChatGroupe }

// class PushNotificationService {
//   static FirebaseMessaging? fcm;

//   static Future init() async {
//     fcm = FirebaseMessaging.instance;

//     if (kIsWeb) {
//       fcm = FirebaseMessaging.instance;
//       await FirebaseMessaging.instance
//           .setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );

//       FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//         var payLoad = jsonDecode(message.data['payload']);
//         RemoteNotification? notification = message.notification;
//         // Forground Notification
//         if (notification != null) {
//           // if (payLoad["objectType"] == ObjectType.Order.name) {
//           //   TimeoutMessage.show(
//           //     notification.title ?? '',
//           //     message: notification.body,
//           //     onClick: () async {
//           //       Order? _order;
//           //       if (payLoad["object"] != null) {
//           //         _order = Order.fromJson(payLoad["object"]);
//           //       } else {
//           //         _order = await OrderService.getOneOrder(
//           //             orderId: payLoad["objectId"]);
//           //       }
//           //       var orderController =
//           //           OrderController(TecfyBasicApp.appGlobalkey.currentState);
//           //       orderController.openEdit(_order!, false);
//           //     },
//           //   );
//           // }
//         }
//       });

//       FirebaseMessaging.onMessageOpenedApp
//           .listen((RemoteMessage message) async {
//         var payLoad = jsonDecode(message.data['payload']);
//         RemoteNotification? notification = message.notification;
//         // App Background Not killed Notification
//         if (notification != null) {
//           // if (payLoad["objectType"] == ObjectType.Order.name) {
//           //   Order? _order;
//           //   if (payLoad["object"] != null) {
//           //     _order = Order.fromJson(payLoad["object"]);
//           //   } else {
//           //     _order =
//           //         await OrderService.getOneOrder(orderId: payLoad["objectId"]);
//           //   }
//           //   var orderController =
//           //       OrderController(TecfyBasicApp.appGlobalkey.currentState);
//           //   orderController.openEdit(_order!, false);
//           // }
//         }
//       });

//       FirebaseMessaging.onBackgroundMessage(
//           _firebaseMessagingBackgroundHandler);
//     } else if ((defaultTargetPlatform == TargetPlatform.iOS) ||
//         (defaultTargetPlatform == TargetPlatform.android)) {
//       fcm = FirebaseMessaging.instance;
//       await FirebaseMessaging.instance
//           .setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );

//       FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//         var payLoad = jsonDecode(message.data['payload']);
//         RemoteNotification? notification = message.notification;
//         // Forground Notification
//         if (notification != null) {
//           // if (payLoad["objectType"] == ObjectType.Order.name) {
//           //   TimeoutMessage.show(
//           //     notification.title ?? '',
//           //     message: notification.body,
//           //     onClick: () async {
//           //       Order? _order;
//           //       if (payLoad["object"] != null) {
//           //         _order = Order.fromJson(payLoad["object"]);
//           //       } else {
//           //         _order = await OrderService.getOneOrder(
//           //             orderId: payLoad["objectId"]);
//           //       }
//           //       var orderController =
//           //           OrderController(TecfyBasicApp.appGlobalkey.currentState);
//           //       orderController.openEdit(_order!, false);
//           //     },
//           //   );
//           // }
//         }
//       });

//       FirebaseMessaging.onMessageOpenedApp
//           .listen((RemoteMessage message) async {
//         var payLoad = jsonDecode(message.data['payload']);
//         RemoteNotification? notification = message.notification;
//         // App Background Not killed Notification
//         if (notification != null) {
//           // if (payLoad["objectType"] == ObjectType.Order.name) {
//           //   Order? _order;
//           //   if (payLoad["object"] != null) {
//           //     _order = Order.fromJson(payLoad["object"]);
//           //   } else {
//           //     _order =
//           //         await OrderService.getOneOrder(orderId: payLoad["objectId"]);
//           //   }
//           //   var orderController =
//           //       OrderController(TecfyBasicApp.appGlobalkey.currentState);
//           //   orderController.openEdit(_order!, false);
//           // }
//         }
//       });
//       // FirebaseMessaging.onBackgroundMessage(
//       //     _firebaseMessagingBackgroundHandler);
//     }

//     var userToken = await fcm?.getToken();

//     // var result = await ApiService().httpPost(
//     //     '${AppHelper.registerToken}merchant', {
//     //   'token': userToken,
//     //   'deviceType': kIsWeb ? 'web' : Platform.operatingSystem
//     // });
//     // print(
//     //     '||||||||||||||||||||||||||||||||||||||||||||||||||| New Token : ${userToken}, ${result.success}');
//   }

//   static Future<void> _firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     try {
//       // await Firebase.initializeApp(
//       //   options: DefaultFirebaseOptions.currentPlatform,
//       // );
//     } catch (e) {
//       debugPrint('Firebase Already Intialized');
//     }
//     print('A bg message just showed up :  ${message.messageId}');
//   }
// }

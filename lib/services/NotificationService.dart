import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';

class NotificationService{
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
  static void initalize(){
    _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();

    final InitializationSettings initializationSettings= InitializationSettings(

    android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    iOS: DarwinInitializationSettings(),
    );
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);

  }
  static void onDidReceiveNotificationResponse(NotificationResponse? response){


  }
  static void displayText({required String title,required String body}){
    final id= DateTime.now().millisecondsSinceEpoch ~/1000;
    final NotificationDetails notificationDetails=NotificationDetails(
      android: AndroidNotificationDetails(
        "app name",
        "app chanel",
        channelDescription: "notificaitonm for my app",
        importance: Importance.max,
        priority: Priority.high,
      ),
          iOS: DarwinNotificationDetails(),
    );
    _flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails);
  }
  static Future<String> loadAsset(String asset, String filename) async {
    final byteData = await rootBundle.load(asset);
    final tmp = await getTemporaryDirectory();
    final file = File("${tmp}/${filename}");
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file.path;
  }
  static Future<void> displayImage(
      {required String title,
        required String body,
        required String icon,
        required String image}) async {
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    var imageLoder = await loadAsset(image, 'bigpicture');
    var logoLoder = await loadAsset(image, 'smallpicture');
    AndroidBitmap<Object> notificationImage = FilePathAndroidBitmap(imageLoder);
    AndroidBitmap<Object> notificationLogo = FilePathAndroidBitmap(logoLoder);

    final styleInfo = BigPictureStyleInformation(notificationImage,
        largeIcon: notificationLogo);

    final NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails("myapp", "my app chanel",
            channelDescription: "Channel Des",
            priority: Priority.high,
            importance: Importance.high,
            styleInformation: styleInfo
        ));
    _flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails);
  }

}
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:medwell/services/NotificationService.dart';

class NotificationDemo extends StatefulWidget {
  const NotificationDemo({super.key});

  @override
  State<NotificationDemo> createState() => _NotificationDemoState();
}

class _NotificationDemoState extends State<NotificationDemo> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print(message);
    });

    FirebaseMessaging.instance.getToken().then((value)  {
      String? token =value;
      print("fcm ::"+ token.toString());
    });
    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification!=null){
        print(message.notification!.title);
        print(message.notification!.body);
        NotificationService.displayFcm(notification: message.notification!);
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notification demo"),),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            NotificationService.displayText(title: "this is title", body: "this is body");
          }, child: Text("notificaiton with text")),
          ElevatedButton(onPressed: (){
            NotificationService.displayImage(title: "Noti with img", body: "Image load", icon: "assets/icons/settings.png", image: "assets/icons/Vector.png");
          }, child: Text("notificaiton with image")),
        ],
      ),
    );
  }
}

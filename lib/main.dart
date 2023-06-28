import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medwell/NotificationDemo.dart';
import 'package:medwell/Screens/AddMedsPage.dart';
import 'package:medwell/Screens/CalenderPage.dart';
import 'package:medwell/Screens/ForgotPasswordPage.dart';
import 'package:medwell/Screens/DetailsPage.dart';
import 'package:medwell/Screens/Forgotpassword.dart';
import 'package:medwell/Screens/LandingPage.dart';
import 'package:medwell/Screens/NavPages.dart';
import 'package:medwell/Screens/ProfilePage.dart';
import 'package:medwell/Screens/RegisterPage.dart';

import 'package:medwell/Screens/ReportPage.dart';
import 'package:medwell/Screens/SettingPage.dart';
import 'package:medwell/Screens/EmailVerify.dart';


import 'Components/Palette.dart';
import 'Screens/FinalLog.dart';
import 'Screens/LoginPage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  NotificationService.initalize();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Pallete.primarySwatch,
      ),

      initialRoute: "/LandingPage",//change the route here

      routes: {
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterPage(),
        "/profile": (context)=> const Profile(),

        "/landing":(context)=>LandingPage(),
        "/EmailVerify":(context)=>const EmailVerify(),

        "/Calender":(context)=>const CalendarPage(),
        "/SettingScreen":(context)=>const SettingScreen(),
        "/AddMedsPage":(context)=> AddMedsPage(),
        "/NavPages":(context)=> NavPages(),
        "/forgotpass":(context)=>ForgotPasswordScreen(),

        "/finalLog":(context)=> const finalLog(),
        "/ReportPage":(context)=> ReportPage(),
        "/Details-page":(context)=>DetailsPage(),
        "/NotificationPage":(context)=>NotificationDemo(),


      },//Add the page here

    );
  }
}

// Navigator.of(context).pushNamed("/profile")

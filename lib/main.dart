import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medwell/NotificationDemo.dart';
import 'package:medwell/Screens/AddMedsPage.dart';
import 'package:medwell/Screens/CalenderPage.dart';
import 'package:medwell/Screens/Changepasswordpage.dart';
import 'package:medwell/Screens/EditMedsPage.dart';
import 'package:medwell/Screens/Feedbackpage.dart';
import 'package:medwell/Screens/ForgotPasswordPage.dart';
import 'package:medwell/Screens/DetailsPage.dart';
import 'package:medwell/Screens/GetStartedPage.dart';
import 'package:medwell/Screens/LandingPage.dart';
import 'package:medwell/Screens/NavPages.dart';
import 'package:medwell/Screens/NewmedsPage.dart';
import 'package:medwell/Screens/ProfilePage.dart';
import 'package:medwell/Screens/RegisterPage.dart';
import 'package:medwell/Screens/ReportPage.dart';
import 'package:medwell/Screens/SettingPage.dart';
import 'package:medwell/Screens/PeriodDetailsPage.dart';
import 'package:medwell/services/NotificationService.dart';
import 'package:medwell/viewmodels/Auth_viewmodel.dart';
import 'package:medwell/viewmodels/Meds_viewmodel.dart';
import 'package:provider/provider.dart';


import 'Components/Palette.dart';
import 'Screens/EmailVerifyPage.dart';
import 'Screens/FinalLogPage.dart';
import 'Screens/HomePage.dart';
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
    return MultiProvider(
      //Add providers here
      providers: [
        ChangeNotifierProvider(create: (_)=>AuthViewModel()),
        ChangeNotifierProvider(create: (_)=>MedsViewModel())
      ],
      child: MaterialApp(
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
          textTheme: GoogleFonts.poppinsTextTheme(), // Customize the font using Google Fonts
          // User this where you want to add poppins>>style: Theme.of(context).textTheme.headline6,
        ),


        //donot change this, rollback before you
        initialRoute: "changepassword",//change the route here


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
          "/forgotpass":(context)=>ForgotPasswordPage(),
          "/finalLog":(context)=> const finalLog(),
          "/ReportPage":(context)=> ReportPage(),
          "/Details-page":(context)=>DetailsPage(),
          "/NotificationPage":(context)=>NotificationDemo(),
          "/FeedbackPage":(context)=>FeedbackPage(),
          "/NewMedsPage":(context)=>NewMedsPage(),
          "/GetstartePage":(context)=>GetStartedPage(),
          "/EditMedsPage":(context)=>EditMedsPage(),
          "/TrackPeriodPage":(context)=>const PeriodDetails(),
          "/changepassword":(context)=>ChangePasswordPage(),
          "/HomePage":(context)=>HomePage(),

        },//Add the page here

      ),
    );
  }
}

// Navigator.of(context).pushNamed("/profile")

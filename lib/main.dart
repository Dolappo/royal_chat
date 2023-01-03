import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:royal_chat/ui/Screens/Login_screen.dart';
import 'package:royal_chat/ui/Screens/chat_feature/chat_screen.dart';
import 'package:royal_chat/ui/Screens/sign_up_screen.dart';
import 'package:royal_chat/ui/Screens/signlog_screen.dart';
import 'package:royal_chat/ui/Screens/welcome_screen.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app.dart';
import 'app/app_setup.router.dart';

void main() async{
 await App.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // await Firebase.initializeApp();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Royal Chat',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      initialRoute: Routes.welcomeScreen,
    );
  }
}


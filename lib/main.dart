import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:royal_chat/Screens/Login_screen.dart';
import 'package:royal_chat/Screens/chat_screen.dart';
import 'package:royal_chat/Screens/sign_up_screen.dart';
import 'package:royal_chat/Screens/signlog_screen.dart';

import 'Screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 @override
  void initState()async {
    // TODO: implement initState
    super.initState();
    await Firebase.initializeApp();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Royal Chat',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context)=>WelcomeScreen(),
        DecisionScreen.id: (context)=> DecisionScreen(),
        LoginScreen.id: (context)=>LoginScreen(),
        SignUpScreen.id: (context)=>SignUpScreen(),
        ChatScreen.id: (context)=>ChatScreen(),
    },
    );
  }
}


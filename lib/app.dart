import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

import 'app/app_setup.locator.dart';


class App {
  static Future<void> initialize() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      // Replace with actual values
      options: const FirebaseOptions(
          apiKey: "AIzaSyBxaNkZZzEnBqetw1l5-bAy0F6k9CjOMJ0",
          appId: "1:688382037407:android:92988a213141f1f59e41aa",
          messagingSenderId: "XXX",
          projectId: "royal-chat-ce14d",
          storageBucket: "royal-chat-ce14d.appspot.com"
      ),
    );
    // await Hive.initFlutter();
    setupLocator();
    // setupBottomSheetUi();
    // setupSnackbarUi();
  }
}

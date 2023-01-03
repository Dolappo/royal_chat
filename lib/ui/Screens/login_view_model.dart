import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:royal_chat/app/app_setup.router.dart';
import 'package:royal_chat/core/keys.dart';
import 'package:royal_chat/core/service/auth_service.dart';
import 'package:royal_chat/core/service/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app_setup.locator.dart';
import '../../core/service/local_storage.dart';

class LoginViewModel extends BaseViewModel {

  final _auth = locator<AuthService>();
  final _nav = locator<NavigationService>();
  final _local = locator<LocalStorage>();
  final _store = locator<FirestoreService>();
  bool showModal = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future<User?> login() async {
    final user = await _auth.loginWithEmail(emailController.text, passwordController.text);
    if(user!=null){
      _store.userEmail = user.email;
      _local.saveData(user.email!, Keys.emailKey);
      _nav.navigateTo(Routes.chatScreen);
    }

  }
}
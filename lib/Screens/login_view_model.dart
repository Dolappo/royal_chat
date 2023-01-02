import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {

  final _auth = FirebaseAuth.instance;
  bool showModal = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future<User> login() async {
    final user = await _auth.signInWithEmailAndPassword
      (email: emailController.text, password: passwordController.text);
    return user.user;
  }
}
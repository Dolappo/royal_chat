import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


import 'package:royal_chat/colors.dart';
import 'package:royal_chat/custom_widgets/button.dart';
import 'package:royal_chat/custom_widgets/input_field.dart';
import 'package:stacked/stacked.dart';

import 'login_view_model.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: ()=> LoginViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.2,
                ),
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                InputField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email',
                  isPassword: false,
                  controller: model.emailController,
                ),
                InputField(
                  keyboardType: TextInputType.visiblePassword,
                  hintText: 'Password',
                  isPassword: true,
                controller: model.passwordController,
                ),
                SizedBox(
                  height: 50,
                ),
                Hero(
                    tag: 'login',
                    child: Button(
                      color: kLoginButtonColor,
                      text: 'Login',
                      onPressed: model.login,
                    )),
              ],
            ),
          ),
        );
      }
    );
  }
}


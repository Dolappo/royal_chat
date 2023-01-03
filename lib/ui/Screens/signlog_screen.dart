import 'package:flutter/material.dart';

import 'package:royal_chat/colors.dart';
import 'package:royal_chat/custom_widgets/button.dart';
import 'package:royal_chat/ui/Screens/sign_up_screen.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app_setup.locator.dart';
import '../../app/app_setup.router.dart';
import 'Login_screen.dart';
class DecisionScreen extends StatefulWidget {
  static const id = 'decision_screen';

  @override
  _DecisionScreenState createState() => _DecisionScreenState();
}

class _DecisionScreenState extends State<DecisionScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'logo',
            child: Container(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/logo.png'),
              ),
            ),
          ),
          SizedBox(height: 50,),
          Hero(
            tag: 'login',
            child: Button(text: 'Login', onPressed: (){
              locator<NavigationService>().navigateTo(Routes.loginScreen);
            }, color: kLoginButtonColor,),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Hero(
                tag: 'sign up',
                child: Button(text: 'Sign Up',onPressed: (){
                  locator<NavigationService>().navigateTo(Routes.signUpScreen);
                }, color: kSignUpButtonColor,)),
          ),
        ],
      ),
    );
  }
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:royal_chat/app/app_setup.locator.dart';
import 'package:royal_chat/app/app_setup.router.dart';
import 'package:royal_chat/colors.dart';
import 'package:royal_chat/custom_widgets/button.dart';
import 'package:royal_chat/ui/Screens/signlog_screen.dart';
import 'package:stacked_services/stacked_services.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: kBackgroundColor, end: Colors.white)
        .animate(controller!);
    controller!.forward();
    controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Hero(
              tag: 'logo',
              child: Container(
                height: controller!.value * 200,
                child: Image.asset('images/logo.png'),
              ),
            ),
          ),
          AnimatedTextKit(animatedTexts: [
            TypewriterAnimatedText('Royalle',
                speed: Duration(milliseconds: 60),
                textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: kTextColor,
                )
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Button(
              text: 'Get Started',
              onPressed: () {
                locator<NavigationService>().navigateTo(Routes.decisionScreen);
              },
              color: kLoginButtonColor,
            ),
          ),
        ],
      ),
    );
  }
}

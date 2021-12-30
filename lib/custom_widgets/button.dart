import 'package:flutter/material.dart';

import '../colors.dart';
class Button extends StatelessWidget {
  final onPressed;
  final text;
  final color;
  Button({this.onPressed, this.text, this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10.0, right: 10),
      child: MaterialButton(
        textColor: kTextColor,
        minWidth: MediaQuery.of(context).size.width*0.7,
        height: 50,
        onPressed:onPressed,
        splashColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color:  kSignUpButtonColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}
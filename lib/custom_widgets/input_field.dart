import 'package:flutter/material.dart';

import '../colors.dart';
class InputField extends StatelessWidget {
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? hintText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  InputField({this.hintText, this.isPassword = false, this.onChanged, this.keyboardType, this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:25.0),
          child: Text(hintText??"", style: TextStyle(color: Colors.grey, fontSize: 12),),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Padding(
            padding: const EdgeInsets.only( bottom: 8),
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              enableSuggestions: true,
              onChanged: onChanged,
              obscureText: isPassword==true?true:false,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 25),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: kBackgroundColor,
                filled: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

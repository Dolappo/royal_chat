import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:royal_chat/Screens/chat_screen.dart';
import 'package:royal_chat/colors.dart';
import 'package:royal_chat/custom_widgets/button.dart';
import 'package:royal_chat/custom_widgets/input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignUpScreen extends StatefulWidget {
  static const id = 'sign_up_screen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool showModal = false;
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showModal,
        child: SingleChildScrollView(
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
                onChanged: (value){
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
                isPassword: false,
              ),
              InputField(
                onChanged: (value){
                  password = value;
                },
                keyboardType: TextInputType.visiblePassword,
                hintText: 'Password',
                isPassword: true,
              ),
              InputField(
                onChanged: (value){
                  password = value;
                },
                keyboardType: TextInputType.visiblePassword,
                hintText: 'Confirm Password',
                isPassword: true,
              ),
              SizedBox(height: 30,),
              Hero(
                tag: 'sign up',
                child: Button(
                  text: 'Continue',
                  color: kSignUpButtonColor,
                  onPressed: ()async{
                    setState(() {
                      showModal = true;
                    });
                   try {
                     final newUser = await _auth.createUserWithEmailAndPassword(
                         email: email, password: password);
                     if(newUser!=null){
                       Navigator.pushNamed(context, ChatScreen.id);
                     }
                     setState(() {
                       showModal = false;
                     });
                   }
                   catch(e){}
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

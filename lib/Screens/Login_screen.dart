import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:royal_chat/Screens/chat_screen.dart';
import 'package:royal_chat/colors.dart';
import 'package:royal_chat/custom_widgets/button.dart';
import 'package:royal_chat/custom_widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showModal = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
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
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
                isPassword: false,
                onChanged: (value){
                email = value;
              },),
              InputField(
                keyboardType: TextInputType.visiblePassword,
                hintText: 'Password',
                isPassword: true,
                onChanged: (value){
                password = value;
              },),
              SizedBox(
                height: 50,
              ),
              Hero(
                  tag: 'login',
                  child: Button(
                    color: kLoginButtonColor,
                    text: 'Login',
                    onPressed: () async{
                      setState(() {
                        showModal = true;
                      });
                      final user =await _auth.signInWithEmailAndPassword(email: email, password: password);
                      try{
                        if(user!=null) {
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                      setState(() {
                        showModal = false;
                      });
                      }

                        catch(e){
                        print(e);
                        }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}


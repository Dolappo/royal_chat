import 'package:firebase_auth/firebase_auth.dart';
import 'package:royal_chat/app/app_setup.router.dart';
import 'package:royal_chat/core/service/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app_setup.locator.dart';
import '../../core/service/firestore_service.dart';

class SignUpViewModel extends BaseViewModel{
  String? email;
  String? password;
  bool showModal = false;
final _auth = locator<AuthService>();
  final _store = locator<FirestoreService>();
final _nav = locator<NavigationService>();

void onChangedMail (value){
  email = value;
  notifyListeners();
  }

  void onChangedPassword(value){
  password = value;
  notifyListeners();
  }

Future<void> signUp() async{
 User? user = await _auth.registerWithEmail(email!, password!);
 if(user!=null){
   _store.userEmail = user.email;
   _nav.navigateTo(Routes.chatScreen);
 }
}
}
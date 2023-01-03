
import 'package:firebase_auth/firebase_auth.dart';
import 'package:royal_chat/app/app_setup.locator.dart';
import 'package:royal_chat/core/service/local_storage.dart';

class AuthService{
  final FirebaseAuth _fInstance = FirebaseAuth.instance;
  //  User? _user;
  //
  // User get user => _user!;


  Future<User?> registerWithEmail(String email, String password) async{
    var res = await _fInstance.createUserWithEmailAndPassword(email: email, password: password);
    return res.user;
  }

  Future<User?> loginWithEmail(String email, String password) async{
    var user = await _fInstance.signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }

  Future<void> logout() async{
    await _fInstance.signOut();
  }
}
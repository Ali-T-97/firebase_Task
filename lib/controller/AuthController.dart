import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Auth {

  logIn(String email , String password) async{
    var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isLogin', true);
    return result;
  }

  signUp(String email , String password)async{
    var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return result;
  }

  signOut()async{
    await FirebaseAuth.instance.signOut();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('isLogin');
  }
}
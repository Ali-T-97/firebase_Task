import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_task_auth/view/Tasks.dart';
import 'package:firebase_task_auth/view/addTask.dart';
import 'package:firebase_task_auth/view/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/tasksController.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:isLogIn()==true ? Tasks() : LoginPage() ,
    );
  }
   isLogIn () async{
     SharedPreferences.setMockInitialValues({});
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool  login = await sharedPreferences.getBool('isLogin');
    return login;
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'auth/login.dart';
import 'crud/addnotes.dart';
import 'home/homepage.dart';
import 'package:flutter/foundation.dart';
import 'dart:html';

late bool islogin;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyADc3gCBXHzNvYMt0qchb5s0ySx4Uaqs4Q",
    authDomain: "finalproject-492af.firebaseapp.com",
    databaseURL: "https://finalproject-492af-default-rtdb.firebaseio.com",
    projectId: "finalproject-492af",
    storageBucket: "finalproject-492af.appspot.com",
    messagingSenderId: "589301386487",
    appId: "1:589301386487:web:616bc57f675b07ad0e57f2",
  ));

  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: islogin == false ? Login() : HomePage(),
      routes: {
        "login": (context) => Login(),
        "signup": (context) => SignUp(),
        "homepage": (context) => HomePage(),
        "addnotes": (context) => AddNotes(),
      },
    );
  }
}

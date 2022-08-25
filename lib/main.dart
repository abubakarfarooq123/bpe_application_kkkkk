import 'dart:async';
import 'dart:core';
import 'dart:core';

import 'package:bpe_application/demo_pages/demo5.dart';
import 'package:bpe_application/demo_pages/splashscreen.dart';
import 'package:bpe_application/home/home_navbar_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final storage = new FlutterSecureStorage();

  Future<bool> checkLoginStatus() async {
    String? value = await storage.read(key: "uid");
    if(value == null){
      return false;
    }
    return true;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _initialization,
      builder: (context,snapshot){
      // check erros
        if(snapshot.hasError){
          print("Something went wrong");
        }
        // once completed show application
        if(snapshot.connectionState == ConnectionState.done){
          return  MaterialApp(
            title: 'BPE Booking',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "GoogleSans",
              primarySwatch: Colors.blue,
            ),
            home: FutureBuilder(
              future: checkLoginStatus(),
              builder: (
              BuildContext context,
                  AsyncSnapshot<bool>snapshot){
                if(snapshot.data== false){
                  return SplashScreen();
                }
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Container(
                    color: Colors.white,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return homeNavBar();
              },
            ),
          );
        }
        return CircularProgressIndicator();

    },);

  }
}


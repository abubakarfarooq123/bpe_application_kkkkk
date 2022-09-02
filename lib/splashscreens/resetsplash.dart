import 'dart:async';
import 'package:bpe_application/user/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Resetsplash extends StatefulWidget {
  const Resetsplash({Key? key}) : super(key: key);

  @override
  _ResetsplashState createState() => _ResetsplashState();
}

class _ResetsplashState extends State<Resetsplash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitChasingDots(
              color: Colors.black,
              size: 100.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Reseting Password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

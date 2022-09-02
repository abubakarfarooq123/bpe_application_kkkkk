import 'dart:async';
import 'package:bpe_application/home/home_navbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class updatesplash extends StatefulWidget {
  const updatesplash({Key? key}) : super(key: key);

  @override
  _updatesplashState createState() => _updatesplashState();
}

class _updatesplashState extends State<updatesplash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => homeNavBar()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCubeGrid(
              color: Colors.black,
              size: 100.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Updating Profile',
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

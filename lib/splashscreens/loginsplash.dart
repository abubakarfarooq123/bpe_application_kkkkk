import 'dart:async';
import 'package:bpe_application/demo_pages/demo5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginWaiting extends StatefulWidget {
  const LoginWaiting({Key? key}) : super(key: key);

  @override
  _LoginWaitingState createState() => _LoginWaitingState();
}

class _LoginWaitingState extends State<LoginWaiting> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Demo5()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitRipple(
                color: Colors.black,
                size: 100.0,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Logging In',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ],
          )),
    );
  }
}

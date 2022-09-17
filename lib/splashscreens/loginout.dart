import 'dart:async';
import 'package:bpe_application/user/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginOut extends StatefulWidget {
  const LoginOut({Key? key}) : super(key: key);

  @override
  _LoginOutState createState() => _LoginOutState();
}

class _LoginOutState extends State<LoginOut> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    }
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitDoubleBounce(
              color: Colors.black,
              size: 100.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Logging Out',
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

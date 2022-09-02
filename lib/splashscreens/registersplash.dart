import 'dart:async';
import 'package:bpe_application/user/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Rwaiting extends StatefulWidget {
  const Rwaiting({Key? key}) : super(key: key);

  @override
  _RwaitingState createState() => _RwaitingState();
}

class _RwaitingState extends State<Rwaiting> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
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
            SpinKitCircle(
              color: Colors.black,
              size: 100.0,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Registrating ID',
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

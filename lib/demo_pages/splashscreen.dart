import 'dart:async';
import 'demo.dart';
import 'package:bpe_application/demo_pages/demo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation _logoAnimation;
  late AnimationController _logoController;

  @override
  void initState() {
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _logoAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeIn,
    );

    _logoAnimation.addListener(() {
      if (_logoAnimation.status == AnimationStatus.completed) {
        return;
      }
      setState(() {});
    });

    _logoController.forward();
    super.initState();
    startTime();
  }

  Widget _buildLogo() {
    return Center(
      child: SizedBox(
        height: _logoAnimation.value * 700.0,
        width: _logoAnimation.value * 700.0,
        child: Image.asset("assets/images/logo.jpeg"),


      ),
    );
  }

  void navigationPage() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Demo()));
  }

  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, navigationPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildLogo(),
    );
  }
}

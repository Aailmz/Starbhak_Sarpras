import 'package:flutter/material.dart';
import 'dart:async';

import 'package:starbhak_sarpras/terminator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Terminator()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color(0xA2C7A2),
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Image(image: AssetImage('assets/images/SARPRAS_LOGO.png')),
        ),
        ),
      ),
    );
  }
}


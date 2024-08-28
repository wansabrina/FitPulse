import 'package:fitpulse/src/constants/colors.dart';
import 'package:fitpulse/src/features/authentication/first_onboarding.dart';
import 'package:flutter/material.dart';
import 'dart:async'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const FirstOnboarding(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue500, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              'assets/images/Logo.png', 
              width: 350,
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}

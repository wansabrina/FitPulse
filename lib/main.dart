import 'package:fitpulse/src/features/nutritions/nutritions_screen.dart';
import 'package:fitpulse/src/features/splash_screen.dart';
import 'package:fitpulse/src/features/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitpulse/src/features/home_screen.dart';
import 'package:fitpulse/src/features/activities/activities_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/activities': (context) => const ActivitiesScreen(),
        '/meal': (context) => const NutritionsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

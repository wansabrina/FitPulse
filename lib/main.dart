import 'package:fitpulse/src/features/nutritions_screen.dart';
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
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/activities': (context) => const ActivitiesScreen(),
        '/meal': (context) => const NutritionsScreen(),
        '/profile': (context) => const ActivitiesScreen(),
      },
    );
  }
}

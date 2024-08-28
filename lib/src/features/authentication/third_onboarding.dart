import 'package:fitpulse/src/common_widgets/custom_elevated_button.dart';
import 'package:fitpulse/src/common_widgets/custom_outlined_button.dart';
import 'package:fitpulse/src/constants/colors.dart';
import 'package:fitpulse/src/features/authentication/login.dart';
import 'package:fitpulse/src/features/authentication/register.dart';
import 'package:fitpulse/src/features/authentication/widget/authentication_transition.dart';
import 'package:flutter/material.dart';

class ThirdOnboarding extends StatefulWidget {
  const ThirdOnboarding({super.key});

  @override
  _ThirdOnboardingState createState() => _ThirdOnboardingState();
}

class _ThirdOnboardingState extends State<ThirdOnboarding> {
  int currentPage = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 95,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/onboarding3.gif',
              height: MediaQuery.of(context).size.height * 0.53,
              fit: BoxFit.cover,
            ),
          ),
        
          Positioned(
            top: MediaQuery.of(context).size.height * 0.65,
            left: 30,
            right: 24,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personalized Workout',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'tutorials tailored to\nyour fitness goals.',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.68,
            left: 29,
            child: Container(
              height: 8,
              width: 278,
              color: blue500.withOpacity(0.4),
            ),
          ),
        
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Column(
              children: [
                CustomElevatedButton(
                  onPressed: AuthenticationTransition(navigateTo: const RegisterScreen()).build(context),
                  text: "Register",
                  height: 50.0,
                  width: double.infinity,
                ),
                const SizedBox(height: 10),
                CustomOutlinedButton(
                  onPressed: AuthenticationTransition(navigateTo: const LoginScreen()).build(context),
                  text: "Login",
                  height: 50.0,
                  width: double.infinity,
                  iconSize: 24.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

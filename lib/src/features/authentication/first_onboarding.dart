import 'package:fitpulse/src/constants/colors.dart';
import 'package:fitpulse/src/features/authentication/second_onboarding.dart';
import 'package:fitpulse/src/features/authentication/widget/onboarding_buton.dart';
import 'package:flutter/material.dart';

class FirstOnboarding extends StatefulWidget {
  const FirstOnboarding({super.key});

  @override
  _FirstOnboardingState createState() => _FirstOnboardingState();
}

class _FirstOnboardingState extends State<FirstOnboarding> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        
          Positioned(
            top: 115,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/onboarding1.gif',
              height: MediaQuery.of(context).size.height * 0.57,
              fit: BoxFit.cover,
            ),
          ),
        
          Positioned(
            top: MediaQuery.of(context).size.height * 0.71,
            left: 30,
            right: 24,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seamlessly track',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'your daily activity\nand health stats.',
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
            top: MediaQuery.of(context).size.height * 0.738,
            left: 29,
            child: Container(
              height: 8,
              width: 220,
              color: blue500.withOpacity(0.4),
            ),
          ),
        
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                TextButton(
                  onPressed: () {
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Row(
                  children: List.generate(3, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 8,
                      width: currentPage == index ? 16 : 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPage == index
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                    );
                  }),
                ),

                const OnboardingButton(
                  navigateTo: SecondOnboarding(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

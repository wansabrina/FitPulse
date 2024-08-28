import 'package:fitpulse/src/constants/colors.dart';
import 'package:fitpulse/src/features/authentication/third_onboarding.dart';
import 'package:fitpulse/src/features/authentication/widget/onboarding_buton.dart';
import 'package:flutter/material.dart';

class SecondOnboarding extends StatefulWidget {
  const SecondOnboarding({super.key});

  @override
  _SecondOnboardingState createState() => _SecondOnboardingState();
}

class _SecondOnboardingState extends State<SecondOnboarding> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/onboarding2.gif',
              height: MediaQuery.of(context).size.height * 0.57,
              fit: BoxFit.cover,
            ),
          ),
        
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: 30,
            right: 24,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Easily Monitor',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'your daily\nnutritional intake.',
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
            top: MediaQuery.of(context).size.height * 0.13,
            left: 29,
            child: Container(
              height: 8,
              width: 177,
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
                  navigateTo: ThirdOnboarding(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

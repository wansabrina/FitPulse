import 'package:fitpulse/src/common_widgets/custom_elevated_button.dart';
import 'package:fitpulse/src/constants/colors.dart';
import 'package:fitpulse/src/features/authentication/widget/authentication_transition.dart';
import 'package:fitpulse/src/features/home_screen.dart';
import 'package:flutter/material.dart';

class PreferenceScreen extends StatelessWidget {
  const PreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/meditation.gif',
              height: 600,
              fit: BoxFit.contain,
            ),
          ),
        
          Positioned(
            top: 500,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "What’s Your Goal with\nOur App?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
              
                const Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  alignment: WrapAlignment.center,
                  children: [
                    GoalButton(label: 'Lose Weight'),
                    GoalButton(label: 'Stress Relief'),
                    GoalButton(label: 'Build Muscle'),
                    GoalButton(label: 'Increase Flexibility'),
                    GoalButton(label: 'Improve Fitness'),
                  ],
                ),
                const SizedBox(height: 30),
                
                CustomElevatedButton(
                  onPressed: AuthenticationTransition(navigateTo: HomeScreen()).build(context),
                  text: "Save",
                  height: 50.0,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GoalButton extends StatefulWidget {
  final String label;

  const GoalButton({
    super.key,
    required this.label,
  });

  @override
  _GoalButtonState createState() => _GoalButtonState();
}

class _GoalButtonState extends State<GoalButton> {
  bool isSelected = false;

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _toggleSelection,
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? blue500 : Colors.white,
        side: const BorderSide(color: blue500),
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Text(
        widget.label,
        style: TextStyle(
          fontSize: 13,
          color: isSelected ? Colors.white : Colors.blueAccent,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
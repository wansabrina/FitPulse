import 'package:fitpulse/src/common_widgets/custom_elevated_button.dart';
import 'package:fitpulse/src/constants/colors.dart';
import 'package:fitpulse/src/features/activities/custom_exercise_result_screen.dart';
import 'package:fitpulse/src/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class CustomExercise extends StatefulWidget {
  const CustomExercise({super.key});

  @override
  _CustomExerciseState createState() => _CustomExerciseState();
}

class _CustomExerciseState extends State<CustomExercise> {
  Map<String, bool> selectedBodyParts = {
    'waist_part': false,
    'upper_arm': false,
    'arm_part': false,
    'abs_part': false,
    'thigh_part': false,
    'leg_part': false,
  };

  void _toggleBodyPartSelection(String bodyPart) {
    if (selectedBodyParts.containsKey(bodyPart)) {
      setState(() {
        selectedBodyParts[bodyPart] = !(selectedBodyParts[bodyPart] ?? false);
      });
    }
  }

  bool get isAnyBodyPartSelected {
    return selectedBodyParts.values.any((isSelected) => isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue300,
      appBar: const CustomAppBar(
        title: 'Personalized Exercise',
        iconColor: Colors.white,
        textColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Select Body Part",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "We'll find the right exercises for you.",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/body.png',
                    fit: BoxFit.contain,
                  ),
                  _buildBodyPartSelector(
                    top: 280,
                    left: 100,
                    bodyPart: 'waist_part',
                    size: 15,
                  ),
                  _buildBodyPartSelector(
                    top: 145,
                    left: 84,
                    bodyPart: 'upper_arm',
                    size: 15,
                  ),
                  _buildBodyPartSelector(
                    top: 170,
                    right: 68,
                    bodyPart: 'arm_part',
                    size: 15,
                  ),
                  _buildBodyPartSelector(
                    top: 235,
                    left: 148,
                    bodyPart: 'abs_part',
                    size: 15,
                  ),
                  _buildBodyPartSelector(
                    top: 340,
                    right: 108,
                    bodyPart: 'thigh_part',
                    size: 15,
                  ),
                  _buildBodyPartSelector(
                    top: 463,
                    right: 90,
                    bodyPart: 'leg_part',
                    size: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            CustomElevatedButton(
              onPressed: isAnyBodyPartSelected ? _onFindExercise : null,
              text: "Find Exercise",
              height: 50.0,
              width: double.infinity,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyPartSelector({
    required double top,
    double? left,
    double? right,
    required String bodyPart,
    double size = 20,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: GestureDetector(
        onTap: () => _toggleBodyPartSelection(bodyPart),
        child: CircleAvatar(
          radius: size,
          backgroundColor: selectedBodyParts[bodyPart] == true
              ? blue500.withOpacity(0.5)
              : blue500.withOpacity(0.3),
          child: Icon(
            Icons.circle,
            color: selectedBodyParts[bodyPart] == true
                ? blue200
                : blue300.withOpacity(0.4),
            size: size + 10,
          ),
        ),
      ),
    );
  }

  void _onFindExercise() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CustomExerciseResult(),
      ),
    );
  }
}

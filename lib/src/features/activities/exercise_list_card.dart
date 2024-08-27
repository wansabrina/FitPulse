import 'package:flutter/material.dart';
import 'package:fitpulse/src/constants/colors.dart';

class ExerciseList extends StatelessWidget {
  final String exerciseName;
  final String duration;
  final String imagePath;

  const ExerciseList({
    super.key,
    required this.exerciseName,
    required this.duration,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          height: 40,
        ),
        title: Text(exerciseName),
        subtitle: Text(duration, style: TextStyle(color: neutral500)),
        trailing: Container(
          decoration: const BoxDecoration(
            color: neutral200,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
          child: const Icon(
            Icons.play_arrow,
            color: blue500,
            size: 20,
          ),
        ),
      ),
    );
  }
}

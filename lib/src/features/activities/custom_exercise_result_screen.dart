import 'package:fitpulse/src/common_widgets/activities/exercise_card.dart';
import 'package:fitpulse/src/common_widgets/custom_elevated_button.dart';
import 'package:fitpulse/src/common_widgets/section_header.dart';
import 'package:fitpulse/src/common_widgets/custom_appbar.dart';
import 'package:fitpulse/src/features/activities/exercise_detail_screen.dart';
import 'package:flutter/material.dart';

class CustomExerciseResult extends StatefulWidget {
  const CustomExerciseResult({super.key});

  @override
  _CustomExerciseResultState createState() => _CustomExerciseResultState();
}

class _CustomExerciseResultState extends State<CustomExerciseResult> {

  List<Map<String, String>> exercises = [
    {"title": "Flat Stomach Workout", "time": "30 Minutes", "calories": "200 Calories", "image": "assets/images/flatstomach.png"},
    {"title": "Dumbell Workout", "time": "30 Minutes", "calories": "200 Calories", "image": "assets/images/dumbellworkout.png"},
  ];

  void _deleteExercise(int index) {
    setState(() {
      exercises.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: 'Personalized Exercise',
        iconColor: Colors.black,
        textColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              title: "Upper Arm & Stomach Exercise Set",
              isSubtitle: false,
            ),
            const SizedBox(height: 10),

            for (int i = 0; i < exercises.length; i++) ...[
              Row(
                children: [
                  IconButton(
                    onPressed: () => _deleteExercise(i),
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.remove_circle, color: Colors.red),
                  ),

                  Expanded(
                    child: ExerciseCard(
                      title: exercises[i]['title']!,
                      time: exercises[i]['time']!,
                      calories: exercises[i]['calories']!,
                      imageAsset: exercises[i]['image']!,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],

            Align(
              alignment: Alignment.centerRight,
              child: CustomElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomExerciseResult(),
                    ),
                  );
                },
                text: "Add Exercise",
                height: 35.0,
                width: 170,
                icon: Icons.add_outlined,
                iconSize: 22,
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ExerciseDetail(),
              ),
            );
          },
          text: "Start Exercise",
          height: 50.0,
          width: double.infinity,
        ),
      ),
    );
  }
}

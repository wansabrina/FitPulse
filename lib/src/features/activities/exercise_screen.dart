import 'package:fitpulse/src/common_widgets/activities/exercise_card.dart';
import 'package:fitpulse/src/features/activities/custom_exercise_screen.dart';
import 'package:fitpulse/src/common_widgets/filter_button.dart';
import 'package:fitpulse/src/common_widgets/search_bar.dart';
import 'package:fitpulse/src/common_widgets/section_header.dart';
import 'package:fitpulse/src/common_widgets/activities/exercise_category_card.dart';
import 'package:fitpulse/src/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, String>> exercises = [
    {"title": "Flat Stomach Workout", "time": "30 Minutes", "calories": "200 Calories", "image": "assets/images/flatstomach.png"},
    {"title": "Warming Up", "time": "30 Minutes", "calories": "200 Calories", "image": "assets/images/warmingup.png"},
    {"title": "Walking Workout", "time": "30 Minutes", "calories": "200 Calories", "image": "assets/images/wakingworkout.png"},
    {"title": "Lean Arm Workout", "time": "30 Minutes", "calories": "200 Calories", "image": "assets/images/leanarmworkout.png"},
    {"title": "Dumbell Workout", "time": "30 Minutes", "calories": "200 Calories", "image": "assets/images/dumbellworkout.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'Exercise',
        iconColor: Colors.black,
        textColor: Colors.black,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 90.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomSearchBar(controller: _searchController, placeholder: "Search Exercise",),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    flex: 1,
                    child: CustomFilterButton(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const SectionHeader(title: "Categories", isSubtitle: false),
              const SizedBox(height: 10),
              const Row(
                children: [
                  ExerciseCategoryCard(title: "Workout", imagePath: "assets/images/Workouttt.png", navigateTo: CustomExercise()),
                  SizedBox(width: 12),
                  ExerciseCategoryCard(title: "Yoga", imagePath: "assets/images/Yoga.png", navigateTo: CustomExercise()),
                  SizedBox(width: 12),
                  ExerciseCategoryCard(title: "Custom", isCustomButton: true, navigateTo: CustomExercise()),
                ],
              ),
              const SizedBox(height: 20),
              const SectionHeader(title: "Exercise For You", isSubtitle: false),
              const SizedBox(height: 10),
              Column(
                children: exercises.map((exercise) {
                  return Column(
                    children: [
                      ExerciseCard(
                        title: exercise["title"]!,
                        time: exercise["time"]!,
                        calories: exercise["calories"]!,
                        imageAsset: exercise["image"]!,
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }).toList(),
              )
            ],
          )
      ),
    );
  }
}

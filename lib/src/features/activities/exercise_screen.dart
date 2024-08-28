import 'package:fitpulse/src/constants/exercises_data.dart';
import 'package:fitpulse/src/features/activities/activities_screen.dart';
import 'package:fitpulse/src/features/activities/widget/exercise_card.dart';
import 'package:fitpulse/src/features/activities/custom_exercise_screen.dart';
import 'package:fitpulse/src/common_widgets/filter_button.dart';
import 'package:fitpulse/src/common_widgets/search_bar.dart';
import 'package:fitpulse/src/common_widgets/section_header.dart';
import 'package:fitpulse/src/features/activities/widget/exercise_category_card.dart';
import 'package:fitpulse/src/common_widgets/custom_appbar.dart';
import 'package:fitpulse/src/features/activities/exercise_detail_screen.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: 'Exercise',
        iconColor: Colors.black,
        textColor: Colors.black,
        navigateToScreen: ActivitiesScreen(),
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
                    child: CustomSearchBar(
                      controller: _searchController,
                      placeholder: "Search Exercise",
                    ),
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
                  ExerciseCategoryCard(
                      title: "Workout",
                      imagePath: "assets/images/Workouttt.png",
                      navigateTo: CustomExercise()),
                  SizedBox(width: 12),
                  ExerciseCategoryCard(
                      title: "Yoga",
                      imagePath: "assets/images/Yoga.png",
                      navigateTo: CustomExercise()),
                  SizedBox(width: 12),
                  ExerciseCategoryCard(
                      title: "Custom",
                      isCustomButton: true,
                      navigateTo: CustomExercise()),
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
                        screen: const ExerciseDetail(),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }).toList(),
              )
            ],
          )),
    );
  }
}

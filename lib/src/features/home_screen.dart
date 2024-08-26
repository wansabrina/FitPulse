import 'package:fitpulse/src/common_widgets/activities/activity_card.dart';
import 'package:fitpulse/src/common_widgets/bottom_bar.dart';
import 'package:fitpulse/src/common_widgets/activities/exercise_card.dart';
import 'package:fitpulse/src/common_widgets/section_header.dart';
import 'package:fitpulse/src/constants/colors.dart';
import 'package:fitpulse/src/features/activities/activities_screen.dart';
import 'package:fitpulse/src/features/activities/steps_detail_screen.dart';
import 'package:fitpulse/src/features/activities/exercise_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  List<Map<String, String>> exercises = [
    {"title": "Flat Stomach Workout", "time": "30 Minutes", "calories": "200 Calories", "image": "assets/images/flatstomach.png"},
    {"title": "Warming Up", "time": "30 Minutes", "calories": "200 Calories", "image": "assets/images/warmingup.png"},
    {"title": "Walking Workout", "time": "30 Minutes", "calories": "200 Calories", "image": "assets/images/wakingworkout.png"},
    {"title": "Lean Arm Workout", "time": "30 Minutes", "calories": "200 Calories", "image": "assets/images/leanarmworkout.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top:30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome 👋",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: neutral400),
                    ),
                    Text(
                      "Kendall Roy",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: neutral200,
                      radius: 25,
                      child: Icon(
                        Icons.search,
                        size: 28,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: neutral200,
                          radius: 25,
                          child: Icon(
                            Icons.notifications,
                            size: 28,
                            color: Colors.black,
                          ),
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: CircleAvatar(
                            radius: 5.5,
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

          
            Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                'assets/images/challengebanner.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

          
            const SectionHeader(
              title: "Today Activities",
              isSubtitle: true,
              navigateTo: ActivitiesScreen(),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActivityCard(
                  icon: Icons.directions_walk,
                  label: "Steps",
                  value: "700 Steps",
                  navigateTo: StepsDetailScreen(),
                ),
                SizedBox(width: 10),
                ActivityCard(
                  icon: Icons.nights_stay,
                  label: "Sleep",
                  value: "8 Hours",
                  navigateTo: StepsDetailScreen(),
                ),
              ],
            ),
            const SizedBox(height: 20),

          
            const SectionHeader(title: "Today Nutrition", isSubtitle: false),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0, 0),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Plan a balanced meal now!",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "295.2 / 1000 kcal",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 0.295,
                    color: Colors.blueAccent,
                    backgroundColor: Colors.grey[300],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const SectionHeader(title: "Exercise For You", isSubtitle: true, navigateTo: ExerciseScreen(),),
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
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0)
    );
  }
}

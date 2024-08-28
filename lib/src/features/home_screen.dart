import 'package:fitpulse/src/features/activities/widget/activity_card.dart';
import 'package:fitpulse/src/common_widgets/bottom_bar.dart';
import 'package:fitpulse/src/features/activities/widget/exercise_card.dart';
import 'package:fitpulse/src/common_widgets/section_header.dart';
import 'package:fitpulse/src/constants/colors.dart';
import 'package:fitpulse/src/features/activities/activities_screen.dart';
import 'package:fitpulse/src/features/activities/exercise_detail_screen.dart';
import 'package:fitpulse/src/features/activities/steps_detail_screen.dart';
import 'package:fitpulse/src/features/activities/exercise_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Map<String, String>> exercises = [
    {
      "title": "Flat Stomach Workout",
      "time": "30 Minutes",
      "calories": "200 Calories",
      "image": "assets/images/flatstomach.png"
    },
    {
      "title": "Warming Up",
      "time": "30 Minutes",
      "calories": "200 Calories",
      "image": "assets/images/warmingup.png"
    },
    {
      "title": "Walking Workout",
      "time": "30 Minutes",
      "calories": "200 Calories",
      "image": "assets/images/wakingworkout.png"
    },
    {
      "title": "Lean Arm Workout",
      "time": "30 Minutes",
      "calories": "200 Calories",
      "image": "assets/images/leanarmworkout.png"
    },
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
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 23,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome 👋",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: neutral400),
                      ),
                      Text(
                        "Kendall Roy",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: neutral200,
                        radius: 23,
                        child: Icon(
                          Icons.search_rounded,
                          size: 26,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 10),
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: neutral200,
                            radius: 23,
                            child: Icon(
                              Icons.notifications_none_rounded,
                              size: 26,
                              color: Colors.black,
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: CircleAvatar(
                              radius: 5,
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
              const SizedBox(height: 14),
              const SectionHeader(
                title: "Today Activities",
                isSubtitle: true,
                navigateTo: ActivitiesScreen(),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  ActivityCard(
                    icon: Icons.directions_walk,
                    label: "Steps",
                    value: "700",
                    unit: "Steps",
                    chartType: "bar",
                    navigateTo: StepsDetailScreen(),
                  ),
                  SizedBox(width: 13),
                  ActivityCard(
                    icon: Icons.nights_stay,
                    label: "Sleep",
                    value: "8",
                    unit: "Hours",
                    chartType: "line",
                    navigateTo: StepsDetailScreen(),
                  ),
                ],
              ),
              const SizedBox(height: 14),
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
                    const Row(
                      children: [
                        Icon(Icons.fastfood_outlined, color: blue500, size: 18),
                        SizedBox(width: 7),
                        Text(
                          'Plan a balanced meal now!',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 26,
                          color: blue500,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: '295.2',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: black,
                                    fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: '/1000 kkal',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: neutral600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: 0.4,
                        backgroundColor: Colors.grey[200],
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(blue500),
                        minHeight: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              const SectionHeader(
                title: "Exercise For You",
                isSubtitle: true,
                navigateTo: ExerciseScreen(),
              ),
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
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0));
  }
}

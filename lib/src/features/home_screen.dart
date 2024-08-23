import 'package:fitpulse/src/common_widgets/activity_card.dart';
import 'package:fitpulse/src/common_widgets/bottom_bar.dart';
import 'package:fitpulse/src/common_widgets/exercise_card.dart';
import 'package:fitpulse/src/common_widgets/section_header.dart';
import 'package:fitpulse/src/constants/colors.dart';
import 'package:fitpulse/src/features/activities/activities_screen.dart';
import 'package:fitpulse/src/features/activities/steps_detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                      radius: 25, // Adjust the radius if needed
                      child: Icon(
                        Icons.search,
                        size: 28,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10), // Add spacing between the icons
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
                          top: 4, // Adjust the position of the dot
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

            // Banner Card
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

            // Today Activities
            SectionHeader(
              title: "Today Activities",
              isSubtitle: true,
              onSeeAllPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ActivitiesScreen()));
              },
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

            // Today Nutrition
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
                    offset: const Offset(0, 0), // Offset X dan Y
                    blurRadius: 2, // Blur radius
                    spreadRadius: 0, // Spread radius
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

            // Exercise For You
            const SectionHeader(title: "Exercise For You"),
            const SizedBox(height: 10),
            const ExerciseCard(
              title: "Flat Stomach Workout",
              time: "30 Minutes",
              calories: "200 Calories",
              imageAsset: "assets/images/flatstomach.png",
            ),
            const SizedBox(height: 10),
            const ExerciseCard(
              title: "Warming Up",
              time: "30 Minutes",
              calories: "200 Calories",
              imageAsset: "assets/images/warmingup.png",
            ),
            const SizedBox(height: 10),
            const ExerciseCard(
              title: "Walking Workout",
              time: "30 Minutes",
              calories: "200 Calories",
              imageAsset: "assets/images/wakingworkout.png",
            ),
            const SizedBox(height: 10),
            const ExerciseCard(
              title: "Lean Arm Workout",
              time: "30 Minutes",
              calories: "200 Calories",
              imageAsset: "assets/images/leanarmworkout.png",
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0)
    );
  }
}

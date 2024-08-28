import 'package:fitpulse/src/features/activities/widget/activity_card.dart';
import 'package:fitpulse/src/features/activities/widget/exercise_card.dart';
import 'package:fitpulse/src/features/activities/widget/exercise_summary_card.dart';
import 'package:fitpulse/src/common_widgets/section_header.dart';
import 'package:fitpulse/src/features/activities/exercise_detail_screen.dart';
import 'package:fitpulse/src/features/activities/exercise_screen.dart';
import 'package:fitpulse/src/features/activities/steps_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitpulse/src/common_widgets/bottom_bar.dart';
import 'package:fitpulse/src/common_widgets/calendar_component.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  int selectedDay = DateTime.now().day;

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
          children: [
            const Text(
              'Today Activities',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CalendarComponent(
              selectedDay: selectedDay,
              onDaySelected: (day) {
                setState(() {
                  selectedDay = day;
                });
              },
            ),
            const SizedBox(height: 16),
            const ExerciseSummaryCard(),
            const SizedBox(height: 16),
            const SectionHeader(
                title: "Continue Progress",
                isSubtitle: true,
                navigateTo: ExerciseScreen()),
            const SizedBox(height: 10),
            const ExerciseCard(
              title: "Flat Stomach Workout",
              time: "30 Minutes",
              calories: "200 Calories",
              imageAsset: "assets/images/flatstomach.png",
              screen: ExerciseDetail(),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActivityCard(
                  icon: Icons.directions_walk,
                  label: "Steps",
                  value: "700",
                  unit: "Steps",
                  chartType: "bar",
                  navigateTo: StepsDetailScreen(),
                ),
                SizedBox(width: 10),
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
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActivityCard(
                  icon: Icons.local_fire_department,
                  label: "Calories",
                  value: "15",
                  unit: "kkal",
                  chartType: "bar",
                  navigateTo: StepsDetailScreen(),
                ),
                SizedBox(width: 10),
                ActivityCard(
                  icon: Icons.monitor_heart_outlined,
                  label: "Heart",
                  value: "95",
                  unit: "bpm",
                  chartType: "line",
                  navigateTo: StepsDetailScreen(),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}

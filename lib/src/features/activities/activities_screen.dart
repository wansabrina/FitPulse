import 'package:fitpulse/src/common_widgets/activity_card.dart';
import 'package:fitpulse/src/common_widgets/exercise_card.dart';
import 'package:fitpulse/src/common_widgets/section_header.dart';
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
        automaticallyImplyLeading: false, // This removes the back button
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        child: Column(
          children: [
            const Text(
              'Today Activities',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
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

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's Exercise Summary",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.timer, color: Colors.blue),
                      SizedBox(width: 8),
                      Text('2 Hours'),
                      Spacer(),
                      Icon(Icons.local_fire_department, color: Colors.blue),
                      SizedBox(width: 8),
                      Text('800 Kcal'),
                    ],
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 100,
                    child: Placeholder(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SectionHeader(
              title: "Continue Progress",
              isSubtitle: true,
            ),
            const SizedBox(height: 10),
            const ExerciseCard(
              title: "Flat Stomach Workout",
              time: "30 Minutes",
              calories: "200 Calories",
              imageAsset: "assets/images/flatstomach.png",
            ),
            const SizedBox(height: 16),
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
                  navigateTo: StepsDetailScreen(), // Replace with the actual SleepDetailScreen
                ),
              ],
            ),
            const SizedBox(height: 16),
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
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}

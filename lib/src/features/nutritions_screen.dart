import 'package:fitpulse/src/common_widgets/activities/activities_info_card.dart';
import 'package:fitpulse/src/common_widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:fitpulse/src/common_widgets/bottom_bar.dart';
import 'package:fitpulse/src/common_widgets/calendar_component.dart';

class NutritionsScreen extends StatefulWidget {
  const NutritionsScreen({super.key});

  @override
  _NutritionsScreenState createState() => _NutritionsScreenState();
}

class _NutritionsScreenState extends State<NutritionsScreen> {
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
              'Today Nutritions',
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
            const SectionHeader(title: "Your Meal Plan", isSubtitle: false),
            const SizedBox(height: 10),
            const ActivitiesInfoCard(
              title: 'Breakfast',
              number: 295.2,
              unit: "kkal",
              icon: Icons.wb_sunny_outlined,
            ),
            const SizedBox(height: 10),
            const ActivitiesInfoCard(
              title: 'Breakfast',
              number: 295.2,
              unit: "kkal",
              icon: Icons.wb_sunny_outlined,
            ),
            const SizedBox(height: 10),
            const ActivitiesInfoCard(
              title: 'Breakfast',
              number: 295.2,
              unit: "kkal",
              icon: Icons.wb_sunny_outlined,
            ),
            const SizedBox(height: 10),
            const ActivitiesInfoCard(
              title: 'Breakfast',
              number: 295.2,
              unit: "kkal",
              icon: Icons.wb_sunny_outlined,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 2),
    );
  }
}

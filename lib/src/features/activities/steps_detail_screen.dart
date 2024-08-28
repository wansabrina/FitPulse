import 'package:fitpulse/src/features/activities/widget/activities_info_card.dart';
import 'package:fitpulse/src/features/activities/widget/calories_burn_card.dart';
import 'package:fitpulse/src/common_widgets/section_header.dart';
import 'package:fitpulse/src/common_widgets/custom_appbar.dart';
import 'package:fitpulse/src/features/activities/widget/steps_chart.dart';
import 'package:flutter/material.dart';
import 'package:fitpulse/src/common_widgets/bottom_bar.dart';
import 'package:fitpulse/src/common_widgets/custom_tabs.dart';

class StepsDetailScreen extends StatefulWidget {
  const StepsDetailScreen({super.key});

  @override
  _StepsDetailScreenState createState() => _StepsDetailScreenState();
}

class _StepsDetailScreenState extends State<StepsDetailScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Daily Steps',
        iconColor: Colors.black,
        textColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            CustomTabs(
              initialValue: selectedTab,
              containerHeight: 35.0,
              labels: const {
                0: 'Day',
                1: 'Weeks',
                2: 'Month',
              },
              onValueChanged: (int index) {
                setState(() {
                  selectedTab = index;
                });
              },
            ),
            const SizedBox(height: 20),
            if (selectedTab == 0) _buildDayTab(),
            if (selectedTab == 1) _buildWeeksTab(),
            if (selectedTab == 2) _buildMonthTab(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
    );
  }

  Widget _buildDayTab() {
    return Column(
      children: [
        const StepsTotal(
          chartType: ChartType.day,
          totalSteps: 700,
          stepsData: [0, 400, 100, 100, 150, 50, 50],
        ),
        const SizedBox(height: 16),
        const CaloriesBurnedCard(),
        const SizedBox(height: 16),
        const SectionHeader(title: "Other Activities"),
        const SizedBox(height: 10),
        _buildOtherActivities(),
      ],
    );
  }

  Widget _buildWeeksTab() {
    return Column(
      children: [
        const StepsTotal(
          chartType: ChartType.week,
          totalSteps: 10000,
          stepsData: [2000, 4000, 1800, 4500, 3000, 2500, 1000],
        ),
        const SizedBox(height: 16),
        const CaloriesBurnedCard(),
        const SizedBox(height: 16),
        const SectionHeader(title: "Other Activities"),
        const SizedBox(height: 10),
        _buildOtherActivities(),
      ],
    );
  }

  Widget _buildMonthTab() {
    return Column(
      children: [
        const StepsTotal(
          chartType: ChartType.month,
          totalSteps: 30000,
          stepsData: [3900, 5000, 2000, 5500, 4000, 6000, 3000, 6200],
        ),
        const SizedBox(height: 16),
        const CaloriesBurnedCard(),
        const SizedBox(height: 16),
        const SectionHeader(title: "Other Activities"),
        const SizedBox(height: 10),
        _buildOtherActivities(),
      ],
    );
  }

  Widget _buildOtherActivities() {
    return const Column(
      children: [
        ActivitiesInfoCard(
          title: 'Sleep',
          number: 8,
          unit: "Hours",
          icon: Icons.nights_stay,
        ),
        SizedBox(height: 10),
        ActivitiesInfoCard(
          title: 'Heart',
          number: 150,
          unit: "kkal",
          icon: Icons.local_fire_department,
        ),
        SizedBox(height: 10),
        ActivitiesInfoCard(
          title: 'Heart',
          number: 95,
          unit: "bpm",
          icon: Icons.monitor_heart_outlined,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

import 'package:fitpulse/src/common_widgets/activities_info_card.dart';
import 'package:fitpulse/src/common_widgets/section_header.dart';
import 'package:fitpulse/src/features/activities/activities_screen.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ActivitiesScreen()),
            );
          },
        ),
        title: const Text(
          'Daily Steps',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0),
        child: Column(
          children: [
            CustomTabs(
              initialValue: selectedTab,
              containerHeight: 35.0,
              labels: {
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
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 1),
    );
  }

  Widget _buildDayTab() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                '10.000 Steps',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 200, // Placeholder height for the graph
                color: Colors.grey[300], // Placeholder for the graph area
                // Add your graph widget here in the future
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'For 10.000 Steps, you burn:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                '1500 Kcal',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const SectionHeader(title: "Other Activities"),
        const SizedBox(height: 10),
        const ActivitiesInfoCard(
          title: 'Sleep',
          number: 8,
          unit: "Hours",
          icon: Icons.wb_sunny_outlined,
        ),
        const SizedBox(height: 10),
        const ActivitiesInfoCard(
          title: 'Sleep',
          number: 8,
          unit: "Hours",
          icon: Icons.wb_sunny_outlined,
        ),
        const SizedBox(height: 10),
        const ActivitiesInfoCard(
          title: 'Sleep',
          number: 8,
          unit: "Hours",
          icon: Icons.wb_sunny_outlined,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildWeeksTab() {
    return Column(
      children: const [
        Text('Weekly Steps View', style: TextStyle(fontSize: 24)),
        SizedBox(height: 20),
        // Add your graph or steps details here
      ],
    );
  }

  Widget _buildMonthTab() {
    return Column(
      children: const [
        Text('Monthly Steps View', style: TextStyle(fontSize: 24)),
        SizedBox(height: 20),
        // Add your graph or steps details here
      ],
    );
  }
}

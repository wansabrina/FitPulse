import 'package:fitpulse/src/features/activities/widget/activities_info_card.dart';
import 'package:fitpulse/src/features/nutritions/widget/nutrition_summary_card.dart';
import 'package:fitpulse/src/common_widgets/section_header.dart';
import 'package:fitpulse/src/features/nutritions/search_meal_screen.dart';
import 'package:fitpulse/src/features/nutritions/meal_screen.dart';
import 'package:fitpulse/src/common_widgets/bottom_bar.dart';
import 'package:fitpulse/src/common_widgets/calendar_component.dart';
import 'package:flutter/material.dart';
import 'package:fitpulse/src/constants/meals_data.dart';

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
            const NutritionSummary(),
            const SizedBox(height: 16),
            const SectionHeader(title: "Your Meal Plan", isSubtitle: false),
            const SizedBox(height: 10),
            Column(
              children: mealPlan.map((meal) {
                bool mealAdded = meal['number'] != null && meal['number'] > 0.0;

                return Column(
                  children: [
                    ActivitiesInfoCard(
                      title: meal['title'],
                      number: mealAdded ? meal['number'] : null,
                      unit: meal['unit'],
                      icon: meal['icon'],
                      subtitle: mealAdded ? null : "Not planned yet, add meal.",
                      onTap: () {
                        if (meal['title'] == 'Breakfast' && mealAdded) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MealPlanDetail(
                                mealData: meals.firstWhere(
                                        (meal) => meal['name'] == 'Bubur Ayam'),
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SearchMeal(mealTime: meal['title']),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 2),
    );
  }
}

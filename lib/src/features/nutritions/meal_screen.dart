import 'package:fitpulse/src/common_widgets/custom_appbar.dart';
import 'package:fitpulse/src/features/nutritions/widget/nutrition_breakdown.dart';
import 'package:fitpulse/src/constants/colors.dart';
import 'package:fitpulse/src/features/nutritions/nutritions_screen.dart';
import 'package:flutter/material.dart';

class MealPlanDetail extends StatefulWidget {
  final Map<String, dynamic> mealData;

  const MealPlanDetail({super.key, required this.mealData});

  @override
  _MealPlanDetailState createState() => _MealPlanDetailState();
}

class _MealPlanDetailState extends State<MealPlanDetail> {
  bool isExpanded = false;

  double collapsedHeight = 450;
  double expandedHeight = 650;

  void _toggleExpandCollapse() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mealData = widget.mealData;
    final List<Map<String, dynamic>> mealItems = mealData['composition'];

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: '',
        iconColor: Colors.black,
        textColor: Colors.black,
        navigateToScreen: NutritionsScreen(),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              mealData['image'],
              fit: BoxFit.cover,
              height: 500,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: isExpanded
                ? MediaQuery.of(context).size.height - expandedHeight
                : MediaQuery.of(context).size.height - collapsedHeight,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: _toggleExpandCollapse,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                height: isExpanded ? expandedHeight : collapsedHeight,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 100,
                        height: 5.5,
                        decoration: BoxDecoration(
                          color: blue500,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(
                          Icons.flash_on,
                          color: Colors.blue[500],
                        ),
                        const SizedBox(width: 5),
                        Text(
                          mealData['calories'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const NutritionBreakdown(),
                    const SizedBox(height: 15),
                    const Text(
                      "Meal Name",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      mealData['name'],
                      style: const TextStyle(
                        color: neutral400,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Meal Composition',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: mealItems.map((item) {
                            return Column(
                              children: [
                                ListTile(
                                  leading: Image.asset(
                                    item['imagePath'],
                                    width: 50,
                                    height: 40,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  title: Text(item['name']),
                                  subtitle: Text(
                                    '${item['amount']} • ${item['calories']}',
                                    style: const TextStyle(
                                      color: neutral400,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

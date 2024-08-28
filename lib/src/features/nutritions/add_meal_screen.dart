import 'package:fitpulse/src/common_widgets/custom_appbar.dart';
import 'package:fitpulse/src/common_widgets/custom_elevated_button.dart';
import 'package:fitpulse/src/features/nutritions/widget/amount_dropdown.dart';
import 'package:fitpulse/src/constants/meals_data.dart';
import 'package:fitpulse/src/features/nutritions/meal_screen.dart';
import 'package:flutter/material.dart';

class AddMeal extends StatefulWidget {
  final String mealName;
  final List<Map<String, String>> composition;

  const AddMeal({
    super.key,
    required this.mealName,
    required this.composition,
  });

  @override
  _AddMealState createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  final List<String> units = ["gr", "pc", "mg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add Meal',
        iconColor: Colors.black,
        textColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Meal Name",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.mealName,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Meal Composition',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.composition.length,
              itemBuilder: (context, index) {
                final item = widget.composition[index];
                String amount =
                    item['amount']!.replaceAll(RegExp(r'[^0-9]'), '');
                String unit = "gr";

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const IconButton(
                            onPressed: null,
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.remove_circle, color: Colors.red),
                          ),
                          Image.asset(
                            item['imagePath']!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.fitWidth,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                item['calories']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AmountTextField(
                            initialValue: amount,
                            onChanged: (newValue) {
                              setState(() {
                                item['amount'] = newValue;
                              });
                            },
                          ),
                          const SizedBox(width: 10),
                          UnitDropdown(
                            value: unit,
                            units: units,
                            onChanged: (newValue) {
                              setState(() {
                                unit = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CustomElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MealPlanDetail(
                        mealData: meals.firstWhere(
                            (meal) => meal['name'] == widget.mealName),
                      ),
                    ),
                  );
                },
                text: "Add Composition",
                height: 35.0,
                width: 215,
                icon: Icons.add_outlined,
                iconSize: 22,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MealPlanDetail(
                  mealData: meals
                      .firstWhere((meal) => meal['name'] == widget.mealName),
                ),
              ),
            );
          },
          text: "Add Meal",
          height: 50.0,
          width: double.infinity,
        ),
      ),
    );
  }
}

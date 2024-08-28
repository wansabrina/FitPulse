import 'package:fitpulse/src/constants/meals_data.dart';
import 'package:fitpulse/src/features/nutritions/add_meal_screen.dart';
import 'package:fitpulse/src/features/nutritions/widget/meal_card.dart';
import 'package:fitpulse/src/common_widgets/filter_button.dart';
import 'package:fitpulse/src/common_widgets/search_bar.dart';
import 'package:fitpulse/src/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class SearchMeal extends StatefulWidget {
  final String mealTime;

  const SearchMeal({super.key, required this.mealTime});

  @override
  _SearchMealState createState() => _SearchMealState();
}

class _SearchMealState extends State<SearchMeal> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'Add ${widget.mealTime}',
        iconColor: Colors.black,
        textColor: Colors.black,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 90.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomSearchBar(
                      controller: _searchController,
                      placeholder: "Search Meal",
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    flex: 1,
                    child: CustomFilterButton(),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Column(
                children: meals.map((meal) {
                  return Column(
                    children: [
                      MealCard(
                        name: meal["name"]!,
                        serving: meal["serving"]!,
                        calories: meal["calories"]!,
                        imageAsset: meal["image"]!,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddMeal(
                                composition: meal["composition"]!,
                                mealName: meal["name"],
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }).toList(),
              )
            ],
          )),
    );
  }
}

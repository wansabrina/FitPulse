import 'package:fitpulse/src/common_widgets/custom_appbar.dart';
import 'package:fitpulse/src/constants/colors.dart';
import 'package:flutter/material.dart';

class MealPlanDetail extends StatefulWidget {
  const MealPlanDetail({super.key});

  @override
  _MealPlanDetailState createState() => _MealPlanDetailState();
}

class _MealPlanDetailState extends State<MealPlanDetail> {
  bool isExpanded = false;

  double collapsedHeight = 450;
  double expandedHeight = 650;

  final List<Map<String, dynamic>> mealItems = [
    {
      'image': 'assets/images/porridge.png',
      'name': 'Rice Porridge',
      'details': '200g',
      'calories': '150 kcal',
    },
    {
      'image': 'assets/images/egg.png',
      'name': 'Boiled Egg',
      'details': '1 pcs',
      'calories': '70 kcal',
    },
    {
      'image': 'assets/images/chicken.png',
      'name': 'Shredded Chicken',
      'details': '50g',
      'calories': '60 kcal',
    },
    {
      'image': 'assets/images/shallots.png',
      'name': 'Fried Shallots',
      'details': '10g',
      'calories': '20 kcal',
    },
    {
      'image': 'assets/images/scallions.png',
      'name': 'Scallions',
      'details': '5g',
      'calories': '1 kcal',
    },
    {
      'image': 'assets/images/soy.png',
      'name': 'Soy Sauce',
      'details': '5ml',
      'calories': '4 kcal',
    },
  ];

  void _toggleExpandCollapse() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: '',
        iconColor: Colors.white,
        textColor: Colors.white,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/buburayam.png',
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                    // Meal details
                    Row(
                      children: [
                        Icon(
                          Icons.flash_on,
                          color: Colors.blue[500],
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          '295.2 kcal',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Carbohydrate: 11.83g'),
                        Text('Fat: 0.35g'),
                        Text('Protein: 0.35g'),
                        Text('Fibre: 1.97g'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Breakfast',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Bubur Tidak Diaduk',
                      style: TextStyle(
                        color: neutral400,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Meal Composition',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: mealItems.map((item) {
                            return Column(
                              children: [
                                ListTile(
                                  leading: Image.asset(
                                    item['image'],
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  title: Text(item['name']),
                                  subtitle: Text(
                                    '${item['details']} • ${item['calories']}',
                                    style: const TextStyle(
                                      color: neutral400,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
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

import 'package:fitpulse/src/common_widgets/custom_appbar.dart';
import 'package:fitpulse/src/common_widgets/custom_elevated_button.dart';
import 'package:fitpulse/src/constants/colors.dart';
import 'package:fitpulse/src/features/activities/widget/exercise_list_card.dart';
import 'package:fitpulse/src/features/activities/exercise_started_screen.dart';
import 'package:flutter/material.dart';

class ExerciseDetail extends StatefulWidget {
  const ExerciseDetail({super.key});

  @override
  _ExerciseDetailState createState() => _ExerciseDetailState();
}

class _ExerciseDetailState extends State<ExerciseDetail> {
  bool isExpanded = false;

  double collapsedHeight = 550;
  double expandedHeight = 800;

  void _toggleExpandCollapse() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Personalized Exercise',
        iconColor: Colors.black,
        textColor: Colors.black,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/flatstomach.png',
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
          Positioned(
            top: 100,
            child: IconButton(
              icon: const Icon(
                Icons.play_circle_fill,
                size: 70,
                color: Colors.white,
              ),
              onPressed: () {},
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
                    const Row(
                      children: [
                        Icon(Icons.access_time_filled, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          '30 minutes',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Flat Stomach Workout',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Warm up properly before exercising to prevent injury and make your workouts more effective.',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Exercises',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 7),
                    Expanded(
                      child: ListView(
                        children: [
                          for (var i = 0; i < 9; i++)
                            ExerciseList(
                              exerciseName: 'Exercise ${i + 1}',
                              duration: '0${i + 2}:30 Minutes',
                              imagePath: 'assets/images/flatstomach.png',
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        child: CustomElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ExerciseStarted(),
              ),
            );
          },
          text: "Start Exercise",
          height: 50.0,
          width: double.infinity,
        ),
      ),
    );
  }
}

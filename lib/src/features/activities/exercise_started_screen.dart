import 'package:fitpulse/src/constants/colors.dart';
import 'package:fitpulse/src/features/activities/exercise_list_card.dart';
import 'package:flutter/material.dart';

class ExerciseStarted extends StatefulWidget {
  const ExerciseStarted({super.key});

  @override
  _ExerciseStartedState createState() => _ExerciseStartedState();
}

class _ExerciseStartedState extends State<ExerciseStarted> {
  int currentExerciseIndex = 0;

  final List<Map<String, String>> exercises = [
    {'title': 'Exercise 1', 'time': '02.30 Minutes'},
    {'title': 'Exercise 2', 'time': '02.00 Minutes'},
    {'title': 'Exercise 3', 'time': '03.20 Minutes'},
    {'title': 'Exercise 4', 'time': '05.30 Minutes'},
    {'title': 'Exercise 5', 'time': '05.30 Minutes'},
  ];

  final String imagePath = 'assets/images/flatstomach.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Exercises',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Exercise',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Knee Stretch',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${currentExerciseIndex + 1}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const TextSpan(
                        text: '/8',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 500,
                  height: 300,
                  decoration: BoxDecoration(
                    color: neutral100,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: neutral300,
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              
                Positioned(
                  bottom: 1.1,
                  child: Container(
                    width: 365,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey[300],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const LinearProgressIndicator(
                        value: 0.3,
                        backgroundColor: Colors.transparent,
                        color: Colors.blue,
                        minHeight: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [
                  for (var i = 0; i < 8; i++)
                    ExerciseList(
                      exerciseName: 'Exercise ${i + 1}',
                      duration: '0${i + 2}:30 Minutes',
                      imagePath: 'assets/images/flatstomach.png',
                    ),
                ],
              ),
            ),
          ],
        ),
      ),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 10.0, left: 100.0, right: 100.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                
                },
                backgroundColor: Colors.blue[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(Icons.fast_rewind, size: 30, color: Colors.white),
              ),
              FloatingActionButton(
                onPressed: () {
                
                },
                backgroundColor: Colors.blue[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(Icons.pause, size: 30, color: Colors.white),
              ),
              FloatingActionButton(
                onPressed: () {
                
                },
                backgroundColor: Colors.blue[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(Icons.fast_forward, size: 30, color: Colors.white),
              ),
            ],
          ),
        ),
    );
  }
}

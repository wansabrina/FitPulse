import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final String title;
  final String time;
  final String calories;
  final String imageAsset;

  const ExerciseCard({
    Key? key,
    required this.title,
    required this.time,
    required this.calories,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            imageAsset,
            height: 50,
            width: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.access_time, size: 16, color: Colors.blue),
                          const SizedBox(width: 4),
                          Text(
                            time,
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          const Icon(Icons.local_fire_department, size: 16, color: Colors.red),
                          const SizedBox(width: 4),
                          Text(
                            calories,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

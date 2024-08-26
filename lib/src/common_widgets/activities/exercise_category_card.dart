import 'package:flutter/material.dart';

class ExerciseCategoryCard extends StatelessWidget {
  final String title;
  final String? imagePath;
  final Widget navigateTo;
  final bool isCustomButton;

  const ExerciseCategoryCard({
    super.key,
    required this.title,
    required this.navigateTo,
    this.imagePath,
    this.isCustomButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigateTo),
        );
      },
      child: Container(
        width: 114,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F3FA),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            if (isCustomButton)
              Container(
                height: 120,
                width: 60,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 36,
                ),
              )
            else
              Image.asset(
                imagePath!,
                height: 120,
              ),
          ],
        ),
      ),
    );
  }
}

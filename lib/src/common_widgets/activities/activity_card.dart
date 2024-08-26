import 'package:fitpulse/src/constants/colors.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Widget navigateTo;

  const ActivityCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.navigateTo,
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
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width * 0.435,
        decoration: BoxDecoration(
          color: neutral100,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28, color: Colors.blueAccent),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

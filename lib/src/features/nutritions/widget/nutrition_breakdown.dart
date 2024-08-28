import 'package:fitpulse/src/constants/colors.dart';
import 'package:flutter/material.dart';

class NutritionBreakdown extends StatelessWidget {
  const NutritionBreakdown({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _NutritionIndicator(
              color: Colors.yellow,
              value: '11.83g',
              label: 'Carbohydrate',
            ),
            SizedBox(height: 10),
            _NutritionIndicator(
              color: Colors.grey,
              value: '0.35g',
              label: 'Protein',
            ),
          ],
        ),
        SizedBox(width: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _NutritionIndicator(
              color: Colors.orange,
              value: '0.35g',
              label: 'Fat',
            ),
            SizedBox(height: 10),
            _NutritionIndicator(
              color: Colors.red,
              value: '1.97g',
              label: 'Fibre',
            ),
          ],
        ),
      ],
    );
  }
}

class _NutritionIndicator extends StatelessWidget {
  final Color color;
  final String value;
  final String label;

  const _NutritionIndicator({
    required this.color,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(color),
                backgroundColor: Colors.grey[200],
                value: 0.8, 
              ),
            ),
          ],
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: neutral500,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

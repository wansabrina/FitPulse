import 'package:fitpulse/src/constants/colors.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool isSubtitle;
  final VoidCallback? onSeeAllPressed;

  const SectionHeader({
    super.key,
    required this.title,
    this.isSubtitle = true,
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            if (isSubtitle && onSeeAllPressed != null)
              GestureDetector(
                onTap: onSeeAllPressed,
                child: Row(
                  children: [
                    const Text(
                      "See all",
                      style: TextStyle(fontSize: 14, color: neutral400, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 2),
                    const Icon(
                      Icons.chevron_right_rounded,
                      size: 23,
                      color: neutral400,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}

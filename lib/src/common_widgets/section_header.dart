import 'package:fitpulse/src/constants/colors.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool isSubtitle;
  final Widget? navigateTo;

  const SectionHeader({
    super.key,
    required this.title,
    this.isSubtitle = true,
    this.navigateTo,
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
            if (isSubtitle && navigateTo != null)
              GestureDetector(
                onTap: () {
                  if (navigateTo != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => navigateTo!),
                    );
                  }
                },
                child: const Row(
                  children: [
                    Text(
                      "See all",
                      style: TextStyle(fontSize: 14, color: neutral400, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 2),
                    Icon(
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

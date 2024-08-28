import 'package:fitpulse/src/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double height;
  final double width;
  final IconData? icon;
  final double iconSize;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.height = 50.0,
    this.width = double.infinity,
    this.icon,
    this.iconSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null;

    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width, height),
          backgroundColor: isEnabled ? blue500 : neutral400,
          foregroundColor: isEnabled ? Colors.white : neutral200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: iconSize,
                color: Colors.white,
              ),
            if (icon != null) const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

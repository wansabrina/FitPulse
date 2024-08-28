import 'package:fitpulse/src/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed; // Masih menggunakan VoidCallback
  final String text;
  final double height;
  final double width;
  final IconData? icon;
  final double iconSize;

  const CustomOutlinedButton({
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
      child: OutlinedButton(
        onPressed: isEnabled ? () => onPressed!() : null,
        style: OutlinedButton.styleFrom(
          minimumSize: Size(width, height),
          side: BorderSide(color: isEnabled ? blue500 : neutral400, width: 1.5),
          foregroundColor: isEnabled ? blue500 : neutral400,
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
                color: isEnabled ? blue500 : neutral400,
              ),
            if (icon != null) const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: isEnabled ? blue500 : neutral400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

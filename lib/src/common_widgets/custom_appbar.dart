import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color iconColor;
  final Color textColor;
  final Widget? navigateToScreen;

  const CustomAppBar({
    super.key,
    required this.title,
    this.iconColor = Colors.black,
    this.textColor = Colors.black,
    this.navigateToScreen,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: iconColor),
        onPressed: () {
          if (navigateToScreen != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => navigateToScreen!),
            );
          } else {
            Navigator.pop(context);
          }
        },
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

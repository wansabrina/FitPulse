import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final String name;
  final String serving;
  final String calories;
  final String imageAsset;
  final VoidCallback? onTap;

  const MealCard({
    super.key,
    required this.name,
    required this.serving,
    required this.calories,
    required this.imageAsset,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
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
          children: [
            ListTile(
              leading: Image.asset(
                imageAsset,
                width: 50,
                height: 50,
                fit: BoxFit.fill,
              ),
              title: Text(name),
              subtitle: Text(
                '$serving • $calories',
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

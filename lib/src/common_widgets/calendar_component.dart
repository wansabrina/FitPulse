import 'package:fitpulse/src/constants/colors.dart';
import 'package:flutter/material.dart';

class CalendarComponent extends StatelessWidget {
  final int selectedDay;
  final Function(int) onDaySelected;

  const CalendarComponent({super.key, required this.selectedDay, required this.onDaySelected});

  @override
  Widget build(BuildContext context) {
    final days = ['Fri', 'Sat', 'Sun', 'Mon', 'Tue'];
    final dates = [26, 27, 28, 29, 30];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(days.length, (index) {
        final isSelected = selectedDay == dates[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.3),
          child: GestureDetector(
            onTap: () {
              onDaySelected(dates[index]);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 21),
              decoration: BoxDecoration(
                color: isSelected ? blue500 : neutral100,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    offset: const Offset(0, 0),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                ], // Rounded corners
              ),
              child: Column(
                children: [
                  Text(
                    days[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : neutral500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dates[index].toString(),
                    style: TextStyle(
                      color: isSelected ? Colors.white : black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

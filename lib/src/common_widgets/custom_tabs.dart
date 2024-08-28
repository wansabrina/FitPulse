import 'package:fitpulse/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

class CustomTabs extends StatelessWidget {
  final int initialValue;
  final Map<int, String> labels;
  final ValueChanged<int> onValueChanged;
  final EdgeInsets? innerPadding;
  final BoxDecoration? decoration;
  final BoxDecoration? thumbDecoration;
  final double containerHeight;
  final Curve curve;

  const CustomTabs({
    super.key,
    this.initialValue = 2,
    required this.labels,
    required this.onValueChanged,
    this.innerPadding = const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
    this.decoration,
    this.thumbDecoration,
    required this.containerHeight,
    this.curve = Curves.easeInToLinear,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tabsWidth = screenWidth * 0.85 / labels.length;

    Map<int, Widget> styledChildren = labels.map((index, label) {
      return MapEntry(
        index,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            label,
            style: TextStyle(
              color: index == initialValue ? Colors.white : Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 15.0,
            ),
          ),
        ),
      );
    });

    return SizedBox(
      height: containerHeight,
      child: CustomSlidingSegmentedControl<int>(
        fixedWidth: tabsWidth,
        initialValue: initialValue,
        children: styledChildren,
        innerPadding: innerPadding ?? const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
        decoration: decoration ?? BoxDecoration(
          color: neutral300.withOpacity(0.65),
          borderRadius: BorderRadius.circular(6),
        ),
        thumbDecoration: thumbDecoration ?? BoxDecoration(
          color: blue500,
          borderRadius: BorderRadius.circular(6),
        ),
        curve: curve,
        onValueChanged: onValueChanged,
      ),
    );
  }
}

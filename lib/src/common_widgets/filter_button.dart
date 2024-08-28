import 'package:flutter/material.dart';

class CustomFilterButton extends StatelessWidget {

  const CustomFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),

      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: const Icon(Icons.filter_list, color: Colors.black54),
      ),
    );
  }
}

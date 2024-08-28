import 'package:flutter/material.dart';

class AmountTextField extends StatelessWidget {
  final String initialValue;
  final Function(String) onChanged;

  const AmountTextField({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 70,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 14),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(bottom: 12),
        ),
        textAlign: TextAlign.center,
        onChanged: onChanged,
      ),
    );
  }
}

class UnitDropdown extends StatelessWidget {
  final String value;
  final List<String> units;
  final Function(String?) onChanged;

  const UnitDropdown({
    Key? key,
    required this.value,
    required this.units,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: DropdownButton<String>(
        value: value,
        underline: const SizedBox(),
        items: units.map((String unit) {
          return DropdownMenuItem<String>(
            value: unit,
            child: Text(unit, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

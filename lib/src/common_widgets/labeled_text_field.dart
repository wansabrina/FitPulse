import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextFieldWithLabel extends StatefulWidget {
  final String label;
  final String initialValue;
  final bool isPassword;
  final bool isDateField;

  const CustomTextFieldWithLabel({
    super.key,
    required this.label,
    required this.initialValue,
    this.isPassword = false,
    this.isDateField = false,
  });

  @override
  _CustomTextFieldWithLabelState createState() => _CustomTextFieldWithLabelState();
}

class _CustomTextFieldWithLabelState extends State<CustomTextFieldWithLabel> {
  final TextEditingController _controller = TextEditingController();
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialValue;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _controller.text = DateFormat('dd-MM-yyyy').format(selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            controller: _controller,
            obscureText: widget.isPassword,
            readOnly: widget.isDateField,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: widget.isDateField
                  ? IconButton(
                icon: const Icon(Icons.calendar_today_outlined, color: Colors.grey),
                onPressed: () {
                  _selectDate(context);
                },
              )
                  : null,
            ),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            onTap: widget.isDateField ? () => _selectDate(context) : null,
          ),
        ),
      ],
    );
  }
}

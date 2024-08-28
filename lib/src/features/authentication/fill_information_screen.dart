import 'package:fitpulse/src/common_widgets/custom_elevated_button.dart';
import 'package:fitpulse/src/common_widgets/labeled_text_field.dart';
import 'package:fitpulse/src/constants/colors.dart';
import 'package:fitpulse/src/features/authentication/preference_screen.dart';
import 'package:fitpulse/src/features/authentication/widget/authentication_transition.dart';
import 'package:flutter/material.dart';

class FillInformationScreen extends StatefulWidget {
  const FillInformationScreen({super.key});

  @override
  _FillInformationScreenState createState() => _FillInformationScreenState();
}

class _FillInformationScreenState extends State<FillInformationScreen> {
  DateTime? selectedDate;
  String selectedGender = '';
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 140),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Complete Your Profile',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              'Fill in your details so we can tailor the perfect fitness plan for you.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: neutral600,
              ),
            ),
            const SizedBox(height: 20),
            
            const CustomTextFieldWithLabel(label: "Age", initialValue: "40"),
            const SizedBox(height: 10),
            
            const CustomTextFieldWithLabel(label: "Weight", initialValue: "75 Kg"),
            const SizedBox(height: 10),

            const Text(
              'Gender',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildGenderButton('Male'),
                _buildGenderButton('Female'),
                _buildGenderButton('Non-binary'),
              ],
            ),
            const SizedBox(height: 10),
            
            const CustomTextFieldWithLabel(label: "Height", initialValue: "180 cm"),
            const SizedBox(height: 40),

            CustomElevatedButton(
              onPressed: AuthenticationTransition(navigateTo: const PreferenceScreen()).build(context),
              text: "Save",
              height: 50.0,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderButton(String gender) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        height: 40,
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: selectedGender == gender ? blue500 : Colors.transparent,
          border: Border.all(
            color: selectedGender == gender ? blue500 : blue500,
          ),
        ),
        child: Center(
          child: Text(
            gender,
            style: TextStyle(
              color: selectedGender == gender ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 13
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:fitpulse/src/common_widgets/custom_elevated_button.dart';
import 'package:fitpulse/src/common_widgets/labeled_text_field.dart';
import 'package:fitpulse/src/features/authentication/fill_information_screen.dart';
import 'package:fitpulse/src/features/authentication/login.dart';
import 'package:fitpulse/src/features/authentication/widget/authentication_transition.dart';
import 'package:flutter/material.dart';
import 'package:fitpulse/src/constants/colors.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 170),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/bluelogo.png', 
                height: 45,
              ),
            ),
            const SizedBox(height: 20),

            const CustomTextFieldWithLabel(
              label: 'Username',
              initialValue: 'Kendall Roy',
            ),
            const SizedBox(height: 10),

            const CustomTextFieldWithLabel(
              label: 'Email',
              initialValue: 'kendallroy@gmail.com',
            ),
            const SizedBox(height: 10),

            const CustomTextFieldWithLabel(
              label: 'Kata Sandi',
              initialValue: '************',
              isPassword: true,
            ),
            const SizedBox(height: 30),

            CustomElevatedButton(
              onPressed: AuthenticationTransition(navigateTo: const FillInformationScreen()).build(context),
              text: "Register",
                height: 50.0,
                width: double.infinity,
              ),
            const SizedBox(height: 10),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? ", style: TextStyle(color: neutral600)),
                  GestureDetector(
                    onTap: AuthenticationTransition(navigateTo: const LoginScreen()).build(context),
                    child: const Text(
                      "Log in.",
                      style: TextStyle(
                        color: blue500,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

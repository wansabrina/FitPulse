import 'package:fitpulse/src/common_widgets/custom_elevated_button.dart';
import 'package:fitpulse/src/common_widgets/labeled_text_field.dart';
import 'package:fitpulse/src/features/authentication/register.dart';
import 'package:fitpulse/src/features/authentication/widget/authentication_transition.dart';
import 'package:fitpulse/src/features/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitpulse/src/constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 175),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
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
              label: 'Kata Sandi',
              initialValue: '************',
              isPassword: true,
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 20.0, 
                      width: 20.0,  
                      child: Checkbox(
                        value: _rememberMe,
                        activeColor: blue500,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, 
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8), 
                    const Text(
                      'Remember me',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: blue500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            CustomElevatedButton(
              onPressed: AuthenticationTransition(navigateTo: HomeScreen()).build(context),
              text: "Login",
              height: 50.0,
              width: double.infinity,
            ),
            const SizedBox(height: 10),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: neutral600),
                  ),
                  GestureDetector(
                    onTap: AuthenticationTransition(navigateTo: const RegisterScreen()).build(context),
                    child: const Text(
                      "Register.",
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

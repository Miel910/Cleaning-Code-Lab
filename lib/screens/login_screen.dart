import 'package:app_api/extensions/navigators.dart';
import 'package:app_api/screens/signup_screen.dart';
import 'package:app_api/utils/app_styles.dart';
import 'package:flutter/material.dart';
import '../components/buttons/login_button.dart';
import '../components/my_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login Page", style: TextStyle(fontSize: 40)),
            const SizedBox(height: 25),
            MyTextField(
              label: "Email",
              controller: emailController,
            ),
            MyTextField(
              label: "Password",
              isPassword: true,
              controller: passwordController,
            ),
            const SizedBox(height: 10),
            LoginButton(
              emailController: emailController,
              passwordController: passwordController,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.push(
                      screen: const SignUpScreen(),
                    );
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Styles.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:app_api/extensions/navigators.dart';
import 'package:flutter/material.dart';
import '../components/buttons/button.dart';
import '../components/my_text_field.dart';
import '../utils/app_styles.dart';
import 'Login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Sign Up Page", style: TextStyle(fontSize: 40)),
              const SizedBox(height: 25),
              MyTextField(
                label: "Username",
                controller: usernameController,
              ),
              MyTextField(
                label: "Name",
                controller: nameController,
              ),
              MyTextField(
                label: "Email",
                controller: emailController,
              ),
              MyTextField(
                label: "Password",
                isPassword: true,
                onChanged: (pass) {
                  password = pass;
                },
              ),
              const SizedBox(height: 10),
              Button(
                username: username,
                nameController: nameController,
                emailController: emailController,
                password: password,
                pushedScreen: LoginScreen(),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Have an account? ",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.push(screen: LoginScreen());
                    },
                    child: Text(
                      "Login",
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
      ),
    );
  }
}

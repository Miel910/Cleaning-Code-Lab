import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/home_screen.dart';
import '../../services/api/Auth/login.dart';
import '../../utils/app_layout.dart';
import '../../utils/app_styles.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: AppLayout.getSize(context).width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Styles.primaryColor,
          ),
        ),
        onPressed: () async {
          final Map body = {
            "email": emailController.text,
            "password": passwordController.text,
          };
          final response = await login(body: body);

          if (response.statusCode == 200) {
            final box = GetStorage();
            box.write("token", json.decode(response.body)["data"]["token"]);

            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Incorrect email or password"),
              ),
            );
          }
        },
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

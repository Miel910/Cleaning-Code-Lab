import 'package:app_api/extensions/navigators.dart';
import 'package:flutter/material.dart';

import '../../services/api/Auth/create_account.dart';
import '../../utils/app_layout.dart';
import '../../utils/app_styles.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.username,
    required this.nameController,
    required this.emailController,
    required this.password,
    required this.pushedScreen,
  });

  final String username;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final String password;
  final Widget pushedScreen;

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
            "password": password,
            "username": username,
            "name": nameController.text
          };
          final response = await createAccount(body: body);
          print(response.body);
          if (response.statusCode == 200) {
            context.pushAndRemoveUntil(screen: pushedScreen);
          }
        },
        child: const Text(
          'Register',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

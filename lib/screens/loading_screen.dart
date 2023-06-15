import 'package:app_api/screens/home_screen.dart';
import 'package:app_api/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return box.hasData("token") ? const HomeScreen() : LoginScreen();
  }
}

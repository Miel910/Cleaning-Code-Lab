import 'package:app_api/extensions/navigators.dart';
import 'package:app_api/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key, required this.order});

  final Map order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        leading: IconButton(
          onPressed: () {
            context.push(screen: const HomeScreen());
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              Text(
                order["id"].toString(),
              ),
              const SizedBox(height: 15),
              Text(
                order["title"],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                order["create_at"],
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 15),
              Text(
                order["content"],
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

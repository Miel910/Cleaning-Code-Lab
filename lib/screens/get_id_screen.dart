import 'dart:convert';

import 'package:app_api/extensions/navigators.dart';
import 'package:app_api/screens/home_screen.dart';
import 'package:app_api/services/api/User/get_order_by_id.dart';
import 'package:flutter/material.dart';

import '../components/my_text_field.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class GetScreenID extends StatefulWidget {
  const GetScreenID({super.key});

  @override
  State<GetScreenID> createState() => _GetScreenIDState();
}

class _GetScreenIDState extends State<GetScreenID> {
  Map order = {};
  final TextEditingController idController = TextEditingController();
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
        child: Column(
          children: [
            const Text("Search for order", style: TextStyle(fontSize: 30)),
            const SizedBox(height: 16),
            MyTextField(
              controller: idController,
              label: "ID",
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                height: 60,
                width: AppLayout.getSize(context).width,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Styles.primaryColor,
                      ),
                    ),
                    onPressed: () async {
                      try {
                        order = json.decode(
                            (await getByID(id: idController.text)).body);
                        // print(order);
                        if ((order["data"] as List).isEmpty) {
                          order = {};
                        } else {
                          order = order["data"][0];
                        }

                        setState(() {});
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Plase enter a correct number"),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Search",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ),
            const SizedBox(height: 25),
            Visibility(
              visible: order.isNotEmpty,
              child: Column(
                children: [
                  Text(order["id"].toString()),
                  const SizedBox(height: 15),
                  Text(
                    order["title"].toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    order["create_at"].toString(),
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    order["content"].toString(),
                    style: const TextStyle(
                      fontSize: 20,
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

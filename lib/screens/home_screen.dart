import 'dart:convert';
import 'package:app_api/extensions/navigators.dart';
import 'package:app_api/utils/app_styles.dart';
import 'package:flutter/material.dart';
import '../components/my_text_field.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_api/services/api/User/create_order.dart';
import 'package:app_api/services/api/User/get_orders.dart';
import '../components/order_card.dart';
import '../utils/app_layout.dart';
import 'get_id_screen.dart';
import 'login_screen.dart';
import 'order_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  List listOrders = [];
  @override
  void initState() {
    super.initState();
    _test();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        leading: IconButton(
          onPressed: () {
            context.pushAndRemove(screen: LoginScreen());
          },
          icon: const Icon(Icons.logout),
        ),
        actions: [
          IconButton(
              onPressed: () {
                context.pushAndRemove(screen: const GetScreenID());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: ListView(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Your orders",
                style: TextStyle(fontSize: 36),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              MyTextField(
                label: "Title",
                controller: titleController,
              ),
              MyTextField(
                minLines: 3,
                maxLines: 10,
                label: "content",
                controller: contentController,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                width: AppLayout.getSize(context).width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Styles.primaryColor,
                    ),
                  ),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      barrierColor: const Color.fromARGB(154, 0, 0, 0),
                      builder: (context) => Center(
                        child: CircularProgressIndicator(
                          color: Styles.primaryColor,
                        ),
                      ),
                    );
                    final result = await createOrder(
                      context: context,
                      body: {
                        "title": titleController.text,
                        "content": contentController.text
                      },
                    );

                    print(result.statusCode);
                    _test();
                  },
                  child: const Text(
                    "Send and Show Orders",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // display orders

              listOrders.isEmpty
                  ? LinearProgressIndicator(
                      color: Styles.primaryColor,
                      backgroundColor: const Color.fromARGB(255, 219, 196, 255),
                    )
                  : Column(
                      children: listOrders.reversed
                          .map((item) => InkWell(
                                onTap: () {
                                  context.push(
                                      screen: OrderScreen(order: item));
                                },
                                child: CardOrders(order: item),
                              ))
                          .toList(),
                    )
            ],
          ),
        ),
      ),
    );
  }

  _test() async {
    if ((await getOrders()).statusCode == 200) {
      listOrders = json.decode((await getOrders()).body)["data"];
      print(listOrders);
      setState(() {});
    } else {
      final box = GetStorage();
      box.remove("token");
      context.pushAndRemove(screen: LoginScreen());
    }
  }
}

loadingPage({required BuildContext context}) {
  return showDialog(
      context: context,
      barrierColor: Colors.white,
      builder: (context) => const Center(child: CircularProgressIndicator()));
}

getData({required String keyUser}) {
  final box = GetStorage();
  if (box.hasData(keyUser)) {
    return box.read(keyUser);
  } else {
    return null;
  }
}

getDataWithLoading({required BuildContext context, required String keyUser}) {
  loadingPage(context: context);
  final data = getData(keyUser: keyUser);

  if (data != null) {
    Navigator.of(context).pop();
  }
}

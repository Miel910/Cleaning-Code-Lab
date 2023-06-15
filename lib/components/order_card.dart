import 'package:flutter/material.dart';

class CardOrders extends StatelessWidget {
  const CardOrders({super.key, required this.order});
  final Map order;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          order["title"],
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        // subtitle: Text(
        //   order["content"],
        //   style: const TextStyle(
        //       // fontWeight: FontWeight.w100,
        //       ),
        // ),
        trailing: Text(
          order["create_at"],
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

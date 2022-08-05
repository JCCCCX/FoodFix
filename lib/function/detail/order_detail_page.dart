import 'package:flutter/material.dart';
import 'package:foodfix/function/global.dart';
import 'package:foodfix/function/main/order/making_order_finish_page.dart';
import 'package:foodfix/function/main/order/making_order_page.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0XFFF1F3F4),
        padding: const EdgeInsets.only(left: 22, right: 22, top: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Basic Info", style: h1),
            const SizedBox(height: 12),
            Card(
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: const [
                    FinishKeyAndValue(
                      keyDesc: "Order No",
                      valueDesc: "202208082022",
                      height: 1.3,
                    ),
                    FinishKeyAndValue(
                      keyDesc: "Order Time",
                      valueDesc: "2022-07-26 23:00",
                      height: 1.3,
                    ),
                    FinishKeyAndValue(
                      keyDesc: "Finish Time",
                      valueDesc: "2022-07-26 23:00",
                      height: 1.3,
                    ),
                    FinishKeyAndValue(
                      keyDesc: "Student Name",
                      valueDesc: "Alex",
                      height: 1.3,
                    ),
                    FinishKeyAndValue(
                      keyDesc: "Order Status",
                      valueDesc: "finish",
                      height: 1.4,
                      isCheck: true,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 22),
            const Text("Food Info", style: h1),
            const SizedBox(height: 12),
            Card(
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    MakingKeyAndValue(keyDesc: "sauce", valueDesc: "BBQ"),
                    MakingKeyAndValue(
                      keyDesc: "Meat",
                      valueDesc: "hame \nturkey \npickle",
                      height: 1.5,
                    ),
                    MakingKeyAndValue(
                      keyDesc: "vegetable",
                      valueDesc:
                          "onion \nlettunce\npickle\nturkey\hame\npickle",
                      height: 1.5,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Order Detail"),
      ),
    );
  }
}

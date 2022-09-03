import 'package:flutter/material.dart';
import 'package:foodfix/function/global.dart';
import 'package:foodfix/widget/key_and_value_widget.dart';

/// 第一个页面
class StudentChefMainPage extends StatelessWidget {
  const StudentChefMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CHEF-MAIN"),
        automaticallyImplyLeading: false,
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: MediaQuery.of(context).size.height * 0.085),
            Text("Today's Menu:", style: Theme.of(context).textTheme.headline6),
            const Padding(padding: EdgeInsets.only(bottom: 30)),
            const KeyAndValueWidget(keyDesc: "Morning", value: "xxxxx"),
            const KeyAndValueWidget(keyDesc: "Lunch", value: "Roast beef"),
            const KeyAndValueWidget(keyDesc: "Dinner", value: "Chinese noodle"),
            const SizedBox(height: 20),
            const Divider(height: 2),
            const Padding(padding: EdgeInsets.only(bottom: 30)),
            Row(
              children: [
                Text("Sandwich Orders:",
                    style: Theme.of(context).textTheme.headline6),
                // Text(
                //   " No order",
                //   style: TextStyle(
                //       color: Theme.of(context).primaryColor, fontSize: 22),
                // ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Text("Order No: ", style: Theme.of(context).textTheme.headline6),
                Text(
                  "2022062900001",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 22),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Text("Sandwich Order Status: ", style: Theme.of(context).textTheme.headline6),
                Text(
                  "Finished",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 22),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
          ],
        ),
      ),
    );
  }
}

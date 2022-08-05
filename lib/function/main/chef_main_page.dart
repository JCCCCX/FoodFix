import 'package:flutter/material.dart';
import 'package:foodfix/function/global.dart';
import 'package:foodfix/widget/key_and_value_widget.dart';

/// 第一个页面
class ChefMainPage extends StatelessWidget {
  const ChefMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CHEF"),
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
            const KeyAndValueWidget(keyDesc: "Lunch", value: "xxxxx"),
            const KeyAndValueWidget(keyDesc: "Dinner", value: "xxxxx"),
            const SizedBox(height: 20),
            const Divider(height: 2),
            const Padding(padding: EdgeInsets.only(bottom: 30)),
            Text("Sandwich Orders:",
                style: Theme.of(context).textTheme.headline6),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            Center(
              child: Text(
                "162",
                style: h1.copyWith(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

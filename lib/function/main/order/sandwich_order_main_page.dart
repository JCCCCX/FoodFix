import 'package:flutter/material.dart';
import 'package:foodfix/function/main/order/making_order_finish_page.dart';
import 'package:foodfix/function/main/order/making_order_page.dart';

class SandwichOrderMainPage extends StatefulWidget {
  const SandwichOrderMainPage({Key? key}) : super(key: key);

  @override
  State<SandwichOrderMainPage> createState() => _SandwichOrderMainPageState();
}

class _SandwichOrderMainPageState extends State<SandwichOrderMainPage> {
  List tabs = ['Making', 'Finished'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sandwich Orders'),
          automaticallyImplyLeading: false,
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                tabs: tabs.map((e) => Tab(text: e)).toList(),
                indicatorColor: Colors.white,
                labelStyle: const TextStyle(fontSize: 16.0),
                isScrollable: true,
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            MakingOrderPage(),
            MakingOrderFinishPage(),
          ],
        ),
      ),
    );
  }
}

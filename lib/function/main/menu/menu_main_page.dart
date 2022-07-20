import 'package:flutter/material.dart';
import 'package:foodfix/function/main/menu/menu_publish_main_page.dart';
import 'package:foodfix/function/main/menu/menu_sand_main_page.dart';
import 'package:foodfix/function/main/order/making_order_finish_page.dart';
import 'package:foodfix/function/main/order/making_order_page.dart';

class MenuMainPage extends StatefulWidget {
  const MenuMainPage({Key? key}) : super(key: key);

  @override
  State<MenuMainPage> createState() => _MenuMainPageState();
}

class _MenuMainPageState extends State<MenuMainPage> {
  List tabs = ['Menu', 'Sand-lng'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Publish Menu'),
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
            MenuPublishMainPage(),
            MenuSandMainPage(),
          ],
        ),
      ),
    );
  }
}

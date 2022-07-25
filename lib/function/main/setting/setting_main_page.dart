import 'package:flutter/material.dart';
import 'package:foodfix/function/main/menu/menu_publish_main_page.dart';
import 'package:foodfix/function/main/menu/menu_sand_main_page.dart';
import 'package:foodfix/function/main/order/making_order_finish_page.dart';
import 'package:foodfix/function/main/order/making_order_page.dart';
import 'package:foodfix/function/main/setting/setting_order_page.dart';
import 'package:foodfix/function/main/setting/setting_sand_page.dart';
import 'package:foodfix/function/main/setting/setting_statistics_page.dart';

class SettingMainPage extends StatefulWidget {
  const SettingMainPage({Key? key}) : super(key: key);

  @override
  State<SettingMainPage> createState() => _SettingMainPageState();
}

class _SettingMainPageState extends State<SettingMainPage> {
  List tabs = ['Statistics', 'Order History','Sand-lng'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order History'),
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
            SettingStatisticsPage(),
            SettingOrderPage(),
            SettingSandPage(),
          ],
        ),
      ),
    );
  }
}

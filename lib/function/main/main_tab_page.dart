import 'package:flutter/material.dart';
import 'package:foodfix/chef/sandwich_order_list.dart';
import 'package:foodfix/function/global.dart';
import 'package:foodfix/function/main/menu/menu_main_page.dart';
import 'package:foodfix/function/main/order/sandwich_order_main_page.dart';
import 'package:foodfix/function/main/setting/setting_main_page.dart';
import 'package:foodfix/student/student_main.dart';

import '../../chef/sandwich_order_list_button.dart';
import 'chef_main_page.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({Key? key}) : super(key: key);

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: const [
          ChefMainPage(),
          SandwichOrderMainPage(),
          MenuMainPage(),
          SettingMainPage(),
          // SandwichOrderListPage(),
          // StudentMainPage(),
        ],
        index: currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: currentIndex,
        unselectedItemColor: Colors.black87,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.event_available), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ],
      ),
    );
  }
}

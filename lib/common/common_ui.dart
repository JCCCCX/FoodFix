import 'package:flutter/material.dart';

import 'package:foodfix/chef/sandwich_order_list.dart';

class CommonUIPart {
  static void _gotoChefHome(BuildContext context) {}

  static void _gotoSandwichOrderList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return const SandwichOrderListPage();
      }),
    );
  }

  static void _gotoSandwichSetting(BuildContext context) {}

  static Widget appNavigationBar(BuildContext context) {
    Widget bottomBar = BottomAppBar(
      color: const Color.fromARGB(255, 243, 242, 242),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.public),
            onPressed: () {
              _gotoChefHome(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _gotoSandwichOrderList(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              _gotoSandwichSetting(context);
            },
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );

    return bottomBar;
  }
}

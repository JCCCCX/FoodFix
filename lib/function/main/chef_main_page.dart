import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foodfix/entity/menu.dart';
import 'package:foodfix/function/global.dart';
import 'package:foodfix/util/date_util.dart';
import 'package:foodfix/util/log_util.dart';
import 'package:foodfix/util/server_agent.dart';
import 'package:foodfix/widget/key_and_value_widget.dart';

/// 第一个页面
class ChefMainPage extends StatefulWidget {
  const ChefMainPage({Key? key}) : super(key: key);
  @override
  _ChefMainPageState createState() => _ChefMainPageState();
}

class _ChefMainPageState extends State<ChefMainPage> {
  late Menu menu;

  Widget _buildMenu() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: MediaQuery.of(context).size.height * 0.085),
          Text("Today's Menu:", style: Theme.of(context).textTheme.headline6),
          const Padding(padding: EdgeInsets.only(bottom: 30)),
          KeyAndValueWidget(keyDesc: "Breakfast", value: menu.breakfast!),
          KeyAndValueWidget(keyDesc: "Lunch", value: menu.lunch!),
          KeyAndValueWidget(keyDesc: "Dinner", value: menu.dinner!),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget refreshWidget =
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Center(child: Text("Server error ...")),
      TextButton(
          child: const Center(child: Text('Click to retry')),
          onPressed: () {
            setState(() {});
          })
    ]);

    Widget todayMenuWidget = FutureBuilder<bool>(
      future: loadData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // request finished
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            // error
            return refreshWidget;
          } else {
            // success
            return _buildMenu();
          }
        } else {
          // loading
          return const Center(child: CircularProgressIndicator());
        }
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("CHEF"),
          automaticallyImplyLeading: false,
          centerTitle: false,
        ),
        body: todayMenuWidget);
  }

  Future<bool> loadData() async {
    String today = currentDateYmd();
    // String today = '2022-08-10';
    menu = await ServerAgent.getMenu(today);

    return true;
  }

  Future<bool> loadTodayMenu() async {
    // String today = currentDateYmd();
    String today = '2022-08-10';
    String webServerMenuToday = '${ServerAgent.webServerMenu}/$today';

    logD('--------curl: $webServerMenuToday');
    var response = await Dio().get(webServerMenuToday);
    logD('--------response: $response');
    if (response.statusCode == 200) {
      var responseData = response.data;
      String breakfast = responseData['breakfast'];
      String lunch = responseData['lunch'];
      String dinner = responseData['dinner'];
      menu =
          Menu(breakfast: breakfast, lunch: lunch, dinner: dinner, date: today);
      return true;
    } else {
      logE('xxx response error: $response');
      return false;
    }
  }
}

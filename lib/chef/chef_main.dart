import 'package:flutter/material.dart';
import 'package:foodfix/common/common_ui.dart';

class ChefMainPage extends StatefulWidget {
  const ChefMainPage({Key? key}) : super(key: key);

  @override
  State<ChefMainPage> createState() => _ChefMainPageState();
}

class _ChefMainPageState extends State<ChefMainPage> {
  Widget buildTodayMenuItem(String title, String value) {
    var todayMenuStyle = Theme.of(context).textTheme.bodyLarge;
    double todayMenuItemTitleWidth = 150;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
            width: todayMenuItemTitleWidth,
            child: Text(
              title,
              style: todayMenuStyle,
            )),
        SizedBox(
            width: 30,
            child: Text(
              ':',
              style: todayMenuStyle,
            )),
        Expanded(
            child: Text(
          value,
          style: todayMenuStyle,
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget = Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Today's Menu:",
              style: Theme.of(context).textTheme.headline6,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0),
            ),
            buildTodayMenuItem('Morning', 'xxxxx'),
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0),
            ),
            buildTodayMenuItem('Lunch', 'Roast beef'),
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0),
            ),
            buildTodayMenuItem('Morning', 'Chinese noodle'),
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0),
            ),
            const Divider(height: 2.0),
            const Padding(
              padding: EdgeInsets.only(bottom: 12.0),
            ),
            buildTodayMenuItem('Sandwich Orders', '138'),
          ],
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Chef Main'),
        ),
        body: bodyWidget,
        bottomNavigationBar: CommonUIPart.appNavigationBar(context));
  }
}

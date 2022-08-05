import 'package:flutter/material.dart';

///
///
///
///
class KeyAndValueWidget extends StatelessWidget {

  final String keyDesc;
  final String value;

  const KeyAndValueWidget(
      {Key? key, required this.keyDesc, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var todayMenuStyle = Theme
        .of(context)
        .textTheme
        .bodyLarge;
    double todayMenuItemTitleWidth = 150;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: todayMenuItemTitleWidth,
              child: Text(keyDesc, style: todayMenuStyle),
            ),
            SizedBox(width: 30, child: Text(':', style: todayMenuStyle)),
            Expanded(child: Text(value, style: todayMenuStyle)),
          ],
        ),
        const Padding(padding: EdgeInsets.only(bottom: 12.0))
      ],
    );
  }
}

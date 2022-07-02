import 'package:flutter/material.dart';

class StudentMainPage extends StatefulWidget {
  const StudentMainPage({Key? key}) : super(key: key);

  @override
  State<StudentMainPage> createState() => _StudentMainPageState();
}

class _StudentMainPageState extends State<StudentMainPage> {
  Widget buildButton(String name) {
    return TextButton(onPressed: () {}, child: Text(name));
  }

  Widget buildRow(String title, List<String> options) {
    Widget titleWidget = Text(title);
    // Widget optionWidget = TextButton(onPressed: (){}, child: Text('Test'));
    List<Row> optionColumns = <Row>[];
    int rNum = options.length ~/ 2;
    int elementsInLastRow = options.length % 2;
    if (elementsInLastRow != 0) {
      rNum++;
    }
    for (int i = 0; i < options.length; i += 2) {
      Row r =
          Row(children: [buildButton(options[i]), buildButton(options[i + 1])]);
      optionColumns.add(r);
    }
    Widget optionColumnWidget = Column(
      children: [
        titleWidget,
        Column(
          children: optionColumns,
        )
      ],
    );
    return optionColumnWidget;
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget = buildRow('Bread', ['Grain Wheat', 'Italian']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandwich Order'),
      ),
      body: bodyWidget,
    );
  }
}

import 'package:flutter/material.dart';

class StudentMainPage extends StatefulWidget {
  const StudentMainPage({Key? key}) : super(key: key);

  @override
  State<StudentMainPage> createState() => _StudentMainPageState();
}

class _StudentMainPageState extends State<StudentMainPage> {
  Widget buildButton(String name) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(name),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey[400]),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        overlayColor: MaterialStateProperty.all(Colors.deepOrange[400]),
        elevation: MaterialStateProperty.all(5),
        fixedSize: MaterialStateProperty.all(const Size(160, 40)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
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
      if (options.length - i > 1) {
        Row r = Row(
          children: [buildButton(options[i]), buildButton(options[i + 1])],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        );
        optionColumns.add(r);
      } else {
        Row r = Row(
          children: [buildButton(options[i])],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        );

        optionColumns.add(r);
      }
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
    Widget bodyWidget = Column(children: [
      buildRow('Bread', ['Grain Wheat', 'Italian', 'White']),
      buildRow('Meat', ['Ham', 'Turkey', 'Pepperoni', "Chicken"])
    ]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandwich Order'),
      ),
      body: bodyWidget,
    );
  }
}

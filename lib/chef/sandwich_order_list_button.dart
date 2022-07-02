import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodfix/entity/sandwich_order.dart';
import 'package:foodfix/util/log_util.dart';
import 'package:foodfix/util/server_agent.dart';

class SandwichOrderStatusPage extends StatefulWidget {
  const SandwichOrderStatusPage({Key? key, required this.orderStatus})
      : super(key: key);
  final String? orderStatus;

  @override
  _SandwichOrderStatusPageState createState() =>
      _SandwichOrderStatusPageState();
}

class _SandwichOrderStatusPageState extends State<SandwichOrderStatusPage> {
  late List<SandwichOrder> _orderList;

  @override
  void initState() {
    super.initState();
  }

  void _finishOrder(int orderId) {
    ServerAgent.finishOrder(null);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget refreshWidget =
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Center(child: Text("Server is lost ...")),
      TextButton(
          child: const Center(child: Text('Click to retry')),
          onPressed: () {
            setState(() {});
          })
    ]);

    Widget orderListWidget = FutureBuilder<bool>(
      future: loadOrderList(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return refreshWidget;
          } else {
            return _buildOrderList();
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
    return Scaffold(
      body: orderListWidget,
    );
  }

  Future<bool> loadOrderList() async {
    var postData = {
      "action_type": "get_sandwich_order_list",
      "status": widget.orderStatus,
    };

    _orderList = await (ServerAgent.getSandwichOrdersToDo(postData));
    logD('--- orders fetched from database: ${_orderList.length}');
    return true;
  }

  Widget _buildOrderList() {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, int index) {
          return _buildOrderWithButton(_orderList[index]);
        },
        itemCount: _orderList.length,
        dragStartBehavior: DragStartBehavior.down,
      ),
    );
  }

  Widget _buildOrderWithButton(SandwichOrder order) {
    ButtonStyle buttonStyle = ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size.fromWidth(110)),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(Colors.red));

    List<String> ingredients = <String>[];
    if (order.breadName != null) {
      ingredients.add(order.breadName!);
    }
    if (order.meatName != null) {
      ingredients.add(order.meatName!);
    }
    if (order.sauceName != null) {
      ingredients.add(order.sauceName!);
    }
    if (order.vegetableNames != null) {
      order.vegetableNames!.forEach((element) {
        ingredients.add(element);
      });
    }
    if (order.cheeseName != null) {
      ingredients.add(order.cheeseName!);
    }
    List<Row> orderIngredientRows = <Row>[];
    int totalRowsExceptLast = ingredients.length ~/ 3;
    int elementsInLastRow = ingredients.length % 3;
    Row row;
    for (int i = 0; i < totalRowsExceptLast; i++) {
      row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
              child: Text(ingredients[i * 3]),
              style: buttonStyle,
              onPressed: () {}),
          TextButton(
              child: Text(ingredients[i * 3 + 1]),
              style: buttonStyle,
              onPressed: () {}),
          TextButton(
              child: Text(ingredients[i * 3 + 2]),
              style: buttonStyle,
              onPressed: () {}),
        ],
      );
      orderIngredientRows.add(row);
    }
    if (elementsInLastRow == 1) {
      row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              child: Text(ingredients[totalRowsExceptLast * 3]),
              style: buttonStyle,
              onPressed: () {}),
        ],
      );
      orderIngredientRows.add(row);
    } else if (elementsInLastRow == 2) {
      row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              child: Text(ingredients[totalRowsExceptLast * 3]),
              style: buttonStyle,
              onPressed: () {}),
          TextButton(
              child: Text(ingredients[totalRowsExceptLast * 3 + 1]),
              style: buttonStyle,
              onPressed: () {}),
        ],
      );
      orderIngredientRows.add(row);
    }

    Widget orderWidget = Card(
      color: Colors.white54,
      shadowColor: Colors.white70,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(6),
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              order.orderNo.toString() + ' : ' + order.studentName!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(children: orderIngredientRows),
            _buildOrderActions(order),
          ],
        ),
      ),
    );
    return orderWidget;
  }

  Widget _buildOrderActions(SandwichOrder order) {
    Widget actionWidget = Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ElevatedButton(
              // color: Colors.yellow,
              child: const Text('Making'),
              onPressed: () {
                _finishOrder(order.orderNo!);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
            ),
            const Spacer(),
            ElevatedButton(
              child: const Text('Finish'),
              onPressed: () {
                _finishOrder(order.orderNo!);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
            )
          ],
        ));
    return actionWidget;
  }
}

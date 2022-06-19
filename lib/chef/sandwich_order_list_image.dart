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
        padding: const EdgeInsets.all(4.0),
        itemBuilder: (context, int index) {
          return _buildOrderWithImage(_orderList[index]);
        },
        itemCount: _orderList.length,
        dragStartBehavior: DragStartBehavior.down,
      ),
    );
  }

  Widget _buildOrderWithImage(SandwichOrder order) {
    List<String> ingredients = <String>[];
    if (order.breadId != null) {
      ingredients.add(order.breadId!);
    }
    if (order.meatId != null) {
      ingredients.add(order.meatId!);
    }
    if (order.sauceId != null) {
      ingredients.add(order.sauceId!);
    }
    if (order.vegetableIds != null) {
      order.vegetableIds!.forEach((element) {
        ingredients.add(element);
      });
    }
    if (order.cheeseId != null) {
      ingredients.add(order.cheeseId!);
    }
    List<Row> orderIngredientRows = <Row>[];
    int totalRowsExceptLast = ingredients.length ~/ 5;
    int elementsInLastRow = ingredients.length % 5;
    Row row;
    if (totalRowsExceptLast > 0) {
      for (int i = 0; i < totalRowsExceptLast; i++) {
        row = Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildImage(ingredients[i * 5]),
            _buildImage(ingredients[i * 5 + 1]),
            _buildImage(ingredients[i * 5 + 2]),
            _buildImage(ingredients[i * 5 + 3]),
            _buildImage(ingredients[i * 5 + 4]),
          ],
        );
        orderIngredientRows.add(row);
      }
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
            _buildOrderAction(order),
          ],
        ),
      ),
    );
    return orderWidget;
  }

  Widget _buildImage(String imageId) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'images/$imageId.jpg',
          width: 50,
          height: 50,
        ));
  }

  Widget _buildOrderAction(SandwichOrder order) {
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

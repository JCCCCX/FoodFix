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
      const Center(child: Text("Service is lost ...")),
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
          return _buildOrderWithText(_orderList[index]);
        },
        itemCount: _orderList.length,
        dragStartBehavior: DragStartBehavior.down,
      ),
    );
  }

  Widget _buildOrderWithText(SandwichOrder order) {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildOrderItemWithText('Order #', order.orderNo.toString()),
            _buildOrderItemWithText('Name', order.studentName!),
            _buildOrderItemWithText('Bread', order.breadName ?? ''),
            _buildOrderItemWithText('Meat', order.meatName ?? ''),
            _buildOrderItemWithText('Cheese', order.cheeseName ?? ''),
            _buildOrderItemWithText(
                'Vege',
                order.vegetableNames == null
                    ? ''
                    : order.vegetableNames!.join(',')),
            _buildOrderItemWithText('Sauce', order.sauceName ?? ''),
            _buildOrderAction(order),
          ],
        ),
      ),
    );
    return orderWidget;
  }

  Widget _buildOrderItemWithText(String title, String value) {
    var todayMenuStyle = Theme.of(context).textTheme.headline6;
    double todayMenuItemTitleWidth = 100;
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
                  backgroundColor:
                      MaterialStateProperty.all(Color.fromRGBO(0, 28, 74, 1))),
            )
          ],
        ));
    return actionWidget;
  }
}

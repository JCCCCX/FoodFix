import 'package:flutter/material.dart';
import 'package:foodfix/function/main/order/making_order_finish_page.dart';

class SettingOrderPage extends StatelessWidget {
  const SettingOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: ListView.builder(
            itemBuilder: (a, b) => Container(
              margin:
                  const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
              padding: const EdgeInsets.only(
                  top: 15, bottom: 8, left: 16, right: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  FinishKeyAndValue(
                    keyDesc: "Order Time",
                    valueDesc: "2022-07-26 23:00",
                  ),
                  FinishKeyAndValue(
                    keyDesc: "Order No",
                    valueDesc: "202208082022",
                  ),
                  FinishKeyAndValue(
                    keyDesc: "Student Name",
                    valueDesc: "Alex",
                  ),
                  FinishKeyAndValue(
                    keyDesc: "Order Status",
                    valueDesc: "finish",
                    isCheck: true,
                  ),
                ],
              ),
            ),
            itemCount: 100,
          ),
        ),
        Positioned(
          child: ClipOval(
            child: Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () async {
                  DateTime? duration = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 30)),
                  );
                },
                icon: const Icon(Icons.filter_alt, color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
            ),
          ),
          bottom: 15,
          right: 15,
        )
      ],
    );
  }
}

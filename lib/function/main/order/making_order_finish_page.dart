import 'package:flutter/material.dart';
import 'package:foodfix/function/detail/order_detail_page.dart';
import 'package:foodfix/function/global.dart';

class MakingOrderFinishPage extends StatelessWidget {
  const MakingOrderFinishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView.builder(
        itemBuilder: (a, b) => Container(
          margin: const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
          padding:
              const EdgeInsets.only(top: 15, bottom: 8, left: 16, right: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (c)=>OrderDetailPage()));
            },
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
        ),
        itemCount: 100,
      ),
    );
  }
}

class FinishKeyAndValue extends StatelessWidget {
  final String keyDesc;
  final String valueDesc;
  final double? height;
  final bool isCheck;

  const FinishKeyAndValue(
      {Key? key,
      required this.keyDesc,
      required this.valueDesc,
      this.height,
      this.isCheck = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          SizedBox(
              child: SizedBox(
            child: Text(
              keyDesc,
              style: h1.copyWith(fontSize: 15),
            ),
            width: 150,
          )),
          Text(
            valueDesc,
            style: h5.copyWith(
              height: height,
              color: isCheck
                  ? Theme.of(context).primaryColor
                  : const Color(0xFFb0b7c1),
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}

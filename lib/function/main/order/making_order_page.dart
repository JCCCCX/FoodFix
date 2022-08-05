import 'package:flutter/material.dart';
import 'package:foodfix/function/global.dart';
import 'package:foodfix/widget/key_and_value_widget.dart';

class MakingOrderPage extends StatelessWidget {
  const MakingOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 8,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: const [
                    MakingKeyAndValue(
                        keyDesc: "ORDER", valueDesc: "20200720102203"),
                    MakingKeyAndValue(keyDesc: "NAME", valueDesc: "alex"),
                    MakingKeyAndValue(keyDesc: "sauce", valueDesc: "BBQ"),
                    MakingKeyAndValue(
                      keyDesc: "Meat",
                      valueDesc: "ham \nturkey \npickle",
                      height: 1.5,
                    ),
                    MakingKeyAndValue(
                      keyDesc: "vegetable",
                      valueDesc: "onion \nlettuce\npickle\nturkey\ham\npickle",
                      height: 1.5,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: Theme.of(context).primaryColor,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: const Text(
                  "FINISH",
                  style: TextStyle(
                    height: 1,
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MakingKeyAndValue extends StatelessWidget {
  final String keyDesc;
  final String valueDesc;
  final double? height;

  const MakingKeyAndValue(
      {Key? key, required this.keyDesc, required this.valueDesc, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(
              child: SizedBox(
            child: Text(keyDesc, style: h1),
            width: 130,
          )),
          Text(valueDesc, style: h5.copyWith(height: height))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodfix/function/global.dart';

class MenuSandMainPage extends StatelessWidget {
  const MenuSandMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (a, b) => SandItemWidget(),
      separatorBuilder: (a, b) => const Divider(
        height: 1,
      ),
      itemCount: 100,
    );
  }
}

class SandItemWidget extends StatelessWidget {
  const SandItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Bread", style: h1),
          Column(
            children: [
              Row(
                children: [
                  Checkbox(value: true, onChanged: (t) => {}),
                  Text("1111"),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

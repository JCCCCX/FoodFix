import 'package:flutter/material.dart';
import 'package:foodfix/function/global.dart';

class MenuPublishMainPage extends StatelessWidget {
  const MenuPublishMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Today's Menu Describe", style: h1.copyWith(fontSize: 22)),
            const SizedBox(height: 18),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Color(0xFFf2f2f2),
              ),
              height: 300,
              child: const TextField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "",
                  isCollapsed: true,
                  isDense: true,
                  contentPadding: EdgeInsets.only(left: 12, right: 12, top: 5),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: Theme.of(context).primaryColor,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: const Text(
                "PUBLISH",
                style: TextStyle(
                  height: 1,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

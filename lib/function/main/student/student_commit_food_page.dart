
import 'package:flutter/material.dart';
import 'package:foodfix/function/global.dart';
import 'package:foodfix/function/main/menu/menu_sand_main_page.dart';

class StudentCommitFoodPage extends StatelessWidget {
  const StudentCommitFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf3f3f3),
      appBar: AppBar(
        title: const Text("STUDENT-CONFIRM"),
        automaticallyImplyLeading: false,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 22, bottom: 12),
              padding: const EdgeInsets.only(left: 18, right: 22, top: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Text("Student id", style: h1),
                      Text(
                        "  230006",
                        style: TextStyle(
                            color: Color(0xFF7f7f7e), fontSize: 22, height: 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
                      Text("Student Name", style: h1),
                      Text(
                        "  jason cheng",
                        style: TextStyle(
                            color: Color(0xFF7f7f7e), fontSize: 22, height: 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(height: 1),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Bread", style: h1),
                      Column(
                        children: [
                          CheckBoxItem(
                            hasHeight: true,
                            title: "Grain Wheat",
                            isCheck: ValueNotifier(true),
                          ),
                          CheckBoxItem(
                            hasHeight: true,
                            title: "ABC",
                            isCheck: ValueNotifier(false),
                          ),
                          CheckBoxItem(
                            hasHeight: true,
                            title: "BBQ",
                            isCheck: ValueNotifier(false),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(height: 1),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Meat ", style: h1),
                      Column(
                        children: [
                          CheckBoxItem(
                            hasHeight: true,
                            title: "ham",
                            isCheck: ValueNotifier(true),
                          ),
                          CheckBoxItem(
                            hasHeight: true,
                            title: "turkey",
                            isCheck: ValueNotifier(false),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(height: 1),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("American Style", style: h1),
                      Column(
                        children: [
                          CheckBoxItem(
                            hasHeight: true,
                            title: "onion",
                            isCheck: ValueNotifier(true),
                          ),
                          CheckBoxItem(
                            hasHeight: true,
                            title: "lettuce",
                            isCheck: ValueNotifier(false),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              child: const Text("Special Request", style: h1),
              margin: const EdgeInsets.only(left: 22),
            ),
            Container(
              padding: const EdgeInsets.only(left: 22, right: 16, top: 12),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: const SizedBox(
                  height: 44,
                  width: double.infinity,
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.only(top: 12, left: 20),
                      hintText: "input you special request",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            InkWell(
              highlightColor: Colors.transparent,
              onTap: () => {},
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
                  "Commit",
                  style: TextStyle(
                    height: 1,
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

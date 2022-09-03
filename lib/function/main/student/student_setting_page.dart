import 'package:flutter/material.dart';
import 'package:foodfix/function/main/order/making_order_finish_page.dart';
import 'package:foodfix/function/main/student/student_commit_food_page.dart';

class StudentSettingPage extends StatelessWidget {
  const StudentSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("STUDENT-ORDER"),
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: [
          InkWell(
            onTap: () async {
              DateTime? duration = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 30)),
              );
            },
            child: Container(
              alignment: Alignment.center,
              child: const Icon(Icons.filter_alt, color: Colors.white),
              margin: const EdgeInsets.only(right: 12, top: 8),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (a, index) => Container(
                    margin: const EdgeInsets.only(
                        left: 12, right: 12, top: 5, bottom: 5),
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 8, left: 16, right: 16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FinishKeyAndValue(
                              keyDesc: "Order No",
                              valueDesc: "202208082022",
                            ),
                            const FinishKeyAndValue(
                              keyDesc: "Order Time",
                              valueDesc: "2022-07-26 23:00",
                            ),
                            FinishKeyAndValue(
                              keyDesc: "Order Status",
                              valueDesc: "finish",
                              isCheck: index % 2 == 0,
                            ),
                            const SizedBox(
                              height: 40,
                            )
                          ],
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Delete"),
                          ),
                        )
                      ],
                    ),
                  ),
                  itemCount: 100,
                )),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 12),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    onTap: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (c) => const StudentCommitFoodPage()),
                      )
                    },
                    child: Container(
                      height: 44,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        color: Theme.of(context).primaryColor,
                      ),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: double.infinity,
                      child: const Text(
                        "New",
                        style: TextStyle(
                          height: 1,
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

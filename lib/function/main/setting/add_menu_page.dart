import 'package:flutter/material.dart';

class AddMenuPage extends StatefulWidget {
  const AddMenuPage({Key? key}) : super(key: key);

  @override
  State<AddMenuPage> createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf3f3f3),
      appBar: AppBar(
        title: const Text("Add Menu"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 30),
            decoration: const BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "input you menu",
              ),
            ),
          ),
          const SizedBox(height: 40),
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
    );
  }
}

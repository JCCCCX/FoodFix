import 'package:flutter/material.dart';
import 'package:foodfix/function/global.dart';
import 'package:foodfix/function/main/setting/add_menu_page.dart';

const marginRight = 2.4;

class SettingSandPage extends StatelessWidget {
  const SettingSandPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Bread", style: h1),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) => const AddMenuPage()));
                      },
                      child: Container(
                        child: const Icon(Icons.add, size: 30),
                        margin: const EdgeInsets.only(right: marginRight),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                buildDeleteItem("Grain wheat"),
                buildDeleteItem("Itanlian"),
                buildDeleteItem("ABC wheat"),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Meat", style: h1),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) => const AddMenuPage()));
                      },
                      child: Container(
                        child: const Icon(Icons.add, size: 30),
                        margin: const EdgeInsets.only(right: marginRight),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                buildDeleteItem("hame"),
                buildDeleteItem("turkey"),
                buildDeleteItem("pickle"),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Vegetable", style: h1),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) => const AddMenuPage()));
                      },
                      child: Container(
                        child: const Icon(Icons.add, size: 30),
                        margin: const EdgeInsets.only(right: marginRight),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                buildDeleteItem("lettunce"),
                buildDeleteItem("onion"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDeleteItem(String desc) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(desc, style: h5.copyWith(color: Colors.black, fontSize: 16)),
            ElevatedButton(onPressed: () => {}, child: Text("Delete"))
          ],
        ),
        const SizedBox(height: 3),
        const Divider(height: 1)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodfix/function/global.dart';

class MenuSandMainPage extends StatelessWidget {
  const MenuSandMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const SingleChildScrollView(
              child: SandItemWidget(),
            ),
          ),
        ),
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
              "Save",
              style: TextStyle(
                height: 1,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20)
      ],
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
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Bread", style: h1),
              Column(
                children: [
                  CheckBoxItem(
                    title: "Grain Wheat",
                    isCheck: ValueNotifier(true),
                  ),
                  CheckBoxItem(
                    title: "ABC",
                    isCheck: ValueNotifier(false),
                  ),
                  CheckBoxItem(
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
                    title: "ham",
                    isCheck: ValueNotifier(true),
                  ),
                  CheckBoxItem(
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
                    title: "onion",
                    isCheck: ValueNotifier(true),
                  ),
                  CheckBoxItem(
                    title: "lettuce",
                    isCheck: ValueNotifier(false),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CheckBoxItem extends StatefulWidget {
  final String title;
  final ValueNotifier<bool> isCheck;

  const CheckBoxItem({
    Key? key,
    required this.title,
    required this.isCheck,
  }) : super(key: key);

  @override
  State<CheckBoxItem> createState() => _CheckBoxItemState();
}

class _CheckBoxItemState extends State<CheckBoxItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: SizedBox(
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            width: 150,
          ),
        ),
        Checkbox(
            value: widget.isCheck.value,
            onChanged: (t) {
              setState(() {
                widget.isCheck.value = !widget.isCheck.value;
              });
            }),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class TitleTextFieldWidget extends StatelessWidget {
  final String title;
  final String textFieldDesc;
  final TextEditingController controller;

  const TitleTextFieldWidget({
    Key? key,
    required this.title,
    required this.textFieldDesc,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Color(0xFF140000),
              ),
            ),
            margin: const EdgeInsets.only(right: 16),
          ),
          SizedBox(
            height: 44,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: textFieldDesc,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0x00e2e2e2), width: 1),
                ),
                isCollapsed: false,
                isDense: false,
                contentPadding: const EdgeInsets.only(left: 2),
                hintStyle: const TextStyle(
                  color: Color(0xffc2c2c1),
                  height: 1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

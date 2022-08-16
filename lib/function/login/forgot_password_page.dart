import 'package:flutter/material.dart';
import 'package:foodfix/function/main/main_tab_page.dart';
import 'package:foodfix/widget/title_textfile_widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(bottom: 60, left: 20),
              child: const Text(
                "FORGOT PASSWORD",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            TitleTextFieldWidget(
              title: "E-mail",
              textFieldDesc: "Input you email",
              controller: emailController,
            ),
            const SizedBox(height: 40),
            InkWell(
              highlightColor: Colors.transparent,
              onTap: () => {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (c) => const MainTabPage()))
              },
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
                  "SUBMIT",
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

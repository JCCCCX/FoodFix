import 'package:flutter/material.dart';
import 'package:foodfix/function/login/forgot_password_page.dart';
import 'package:foodfix/function/main/main_tab_page.dart';
import 'package:foodfix/widget/title_textfile_widget.dart';

class LoginMainPage extends StatelessWidget {
  const LoginMainPage({Key? key}) : super(key: key);

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
                "WELCOME TO HILL ORDER",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            const TitleTextFieldWidget(
              title: "E-mail",
              textFieldDesc: "input  email",
            ),
            const SizedBox(height: 30),
            const TitleTextFieldWidget(
              title: "Password",
              textFieldDesc: "input  password",
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 8),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (c) => {},
                  ),
                  Text(
                    "Remember me",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.only(top: 8),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                highlightColor: Colors.transparent,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (c) => ForgotPasswordPage()),
                  );
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
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
                  "Continue",
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

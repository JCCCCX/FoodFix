import 'package:flutter/material.dart';
import 'package:foodfix/entity/user.dart';
import 'package:foodfix/function/login/forgot_password_page.dart';
import 'package:foodfix/function/main/main_tab_page.dart';
import 'package:foodfix/util/global_model.dart';
import 'package:foodfix/util/log_util.dart';
import 'package:oktoast/oktoast.dart';
import 'package:foodfix/util/server_agent.dart';
import 'package:foodfix/widget/title_textfile_widget.dart';
import 'package:provider/provider.dart';

class LoginMainPage extends StatelessWidget {
  LoginMainPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

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
            TitleTextFieldWidget(
              title: "E-mail",
              textFieldDesc: "input  email",
              controller: emailController,
            ),
            const SizedBox(height: 30),
            TitleTextFieldWidget(
              title: "Password",
              textFieldDesc: "input  password",
              controller: pwdController,
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
              onTap: () => {tryLogin(context)},
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

  void tryLogin(BuildContext context) async {
    String email = emailController.text;
    String passwd = pwdController.text;
    logD('---- email:$email, passwd:$passwd');
    String sessionId = await ServerAgent.doLogin(email, passwd);
    logD('---- sessionID:$sessionId');
    if (sessionId != '') {
      String role = await ServerAgent.checkLogin(sessionId);
      logD('---- role:$role');
      if (role != 'unknown') {
        // Set signed up user into global model
        User me = User(email: email, roleName: role, sessionId: sessionId);
        GlobalModel gm = Provider.of<GlobalModel>(context, listen: false);
        gm.saveIdentity(me);

        if (role == 'Chef') {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (c) => const MainTabPage()));
        } else if (role == 'Student') {
          // TODO: goto student main page
        }
      }
    } else {
      // show error message
      showToast('invalid e-mail or password',
          duration: const Duration(seconds: 5));
    }
  }
}

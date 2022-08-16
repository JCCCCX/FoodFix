import 'package:flutter/material.dart';
import 'package:foodfix/function/login/login_main_page.dart';
import 'package:foodfix/function/main/main_tab_page.dart';
import 'package:foodfix/student/student_main.dart';
import 'package:foodfix/util/global_model.dart';
import 'package:foodfix/util/provider_config.dart';
import 'package:foodfix/util/storage_manager.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ProviderConfig.getInstance().getGlobal(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<GlobalModel>(context).setContext(context);

    Widget app = MaterialApp(
        title: 'FoodFix',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF04008d),
          primarySwatch: Colors.indigo,
        ),
        //home: LoginMainPage(),
        routes: {
          '/': (context) {
            return FutureBuilder<bool>(
              future: StorageManager.tryToLoadIdentityFromLocal(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else {
                    Widget readyPage = LoginMainPage();
                    final model = Provider.of<GlobalModel>(context);
                    if (model.isNewUser || !model.hasLoggedIn) {
                      readyPage = LoginMainPage();
                    } else {
                      if (model.me.roleName == 'Chef') {
                        readyPage = const MainTabPage();
                      } else if (model.me.roleName == 'Student') {
                        // TODO: goto student main page
                      } else {
                        readyPage = LoginMainPage();
                      }
                    }
                    return readyPage;
                  }
                } else {
                  return const Center(
                      child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ));
                }
              },
            );
          }
        });

    return OKToast(child: app);
  }
}

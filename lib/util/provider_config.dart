import 'package:flutter/material.dart';
import 'package:foodfix/util/global_model.dart';
import 'package:provider/provider.dart';

class ProviderConfig {
  static ProviderConfig? _instance;

  static ProviderConfig getInstance() {
    _instance = _instance ?? ProviderConfig._internal();
    return _instance!;
  }

  ///全局
  ChangeNotifierProvider<GlobalModel> getGlobal(Widget child) {
    return ChangeNotifierProvider<GlobalModel>(
      create: (context) => GlobalModel(),
      child: child,
    );
  }

  // ///登陆页面
  // ChangeNotifierProvider<LoginModel> getLoginPage(Widget child) {
  //   return ChangeNotifierProvider<LoginModel>(
  //     create: (context) => LoginModel(),
  //     child: child,
  //   );
  // }

  ProviderConfig._internal();
}

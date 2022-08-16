import 'package:flutter/material.dart';
import 'package:foodfix/entity/user.dart';
import 'package:foodfix/util/log_util.dart';
import 'package:foodfix/util/storage_manager.dart';

class GlobalModel extends ChangeNotifier {
  BuildContext? context;

  User me = User(email: 'dummy', roleName: '', sessionId: '');

  bool isLocalIdentityLoaded = false;

  bool isNewUser = true;

  bool hasLoggedIn = false;

  GlobalModel() {
    StorageManager.setGlobalModel(this);
  }

  void setContext(BuildContext context) {
    if (this.context == null) {
      this.context = context;
    }
  }

  void saveIdentity(User user) async {
    logD('.....saving user identity：${user.email}');

    me = user;

    StorageManager.saveIdentity(user);

    isNewUser = false;
    hasLoggedIn = false;
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:foodfix/entity/user.dart';
import 'package:foodfix/util/global_model.dart';
import 'package:foodfix/util/log_util.dart';
import 'package:foodfix/util/server_agent.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

/// structure of local directory：
/// app-root: /storage/emulated/0/Android/data/info.foodfix.app/files
/// app-root/identity/me.identity
class StorageManager {
  static GlobalModel? globalModel;

  static String identityDataRoot = '';
  static String externalDocumentsDirectory = '';

  static void setGlobalModel(GlobalModel gm) {
    globalModel = gm;
  }

  static Future<bool> tryToLoadIdentityFromLocal() async {
    try {
      if (await Permission.storage.isGranted) {
        if (Platform.isAndroid) {
          externalDocumentsDirectory =
              (await getExternalStorageDirectory())!.path;
        } else if (Platform.isIOS) {
          externalDocumentsDirectory =
              (await getApplicationDocumentsDirectory()).path;
        }
        // make sure dir is available
        identityDataRoot = '$externalDocumentsDirectory/identity';
        Directory(identityDataRoot).createSync(recursive: false);

        // try to load identity from local
        globalModel!.me = StorageManager.loadIdentity();
        logI('---------loaded identity: ${globalModel!.me.toString()}');
        if (globalModel!.me.email == 'dummy') {
          /// can not find user identity from local, should goto login page
          globalModel!.isNewUser = true;
          globalModel!.hasLoggedIn = false;
        } else {
          /// found user identity from local, check if sessionId is still valid
          globalModel!.isNewUser = false;
          globalModel!.hasLoggedIn = false;
          String roleName =
              await ServerAgent.checkLogin(globalModel!.me.sessionId);
          if (roleName != 'unkown') {
            globalModel!.hasLoggedIn = true;
            globalModel!.me.roleName = roleName;
            saveIdentity(globalModel!.me);
          }
        }
        globalModel!.isLocalIdentityLoaded = true;
      } else {
        await Permission.storage.request();
        logE('------------------------- denied to access storage');
      }
    } on FileSystemException catch (e) {
      logE('!!!!!!!!!! Access to local file system failed !!!!!!!!!$e');
    }
    return globalModel!.isNewUser;
  }

  /// identity structure：
  /// email, roleName, sessionId
  static User loadIdentity() {
    String localDataPath = '$identityDataRoot/me.identity';
    User me = User(email: 'dummy', roleName: '', sessionId: '');
    try {
      File idFile = File(localDataPath);
      if (idFile.existsSync()) {
        logI('----- local identity found ----------$localDataPath');
        String idString = idFile.readAsStringSync(encoding: utf8);
        List<String> foo = idString.split('\t');

        me = User(email: foo[0], roleName: foo[1], sessionId: foo[2]);
      } else {
        logI(
            '----- local identity Not found, need to sign up ----------$localDataPath');
      }
    } on FileSystemException catch (e) {
      logE('-------------- load identity failed ! -------------$e');
    } finally {}

    return me;
  }

  static void saveIdentity(User me) async {
    String identityDataPath = '$identityDataRoot/me.identity';
    IOSink? sink;
    try {
      File file = File(identityDataPath);
      if (!await file.exists()) {
        file.createSync(recursive: true);
      }
      List<String> contents = <String>[];
      contents.add(me.email);
      contents.add(me.roleName);
      contents.add(me.sessionId);
      sink = file.openWrite(mode: FileMode.write, encoding: utf8);
      sink.write(contents.join('\t'));
    } on FileSystemException catch (e) {
      logE('-------------- save identity failed ! ------------- $e');
    } finally {
      if (sink != null) sink.close();
    }
  }
}

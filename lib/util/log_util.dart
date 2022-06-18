import 'package:logger/logger.dart';

var _logger = Logger(
  printer: PrettyPrinter(),
  level: Level.debug,
);

logV(String message) {
  _logger.v(message);
}

logD(String message) {
  _logger.d(message);
}

logI(String message) {
  _logger.i(message);
}

logW(String message) {
  _logger.w(message);
}

logE(String message) {
  _logger.e(message);
}

logWTF(String message) {
  _logger.wtf(message);
}
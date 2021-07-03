
import 'dart:async';

import 'package:flutter/services.dart';

class Spyder {
  static const MethodChannel _channel =
      const MethodChannel('spyder');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

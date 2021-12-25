
import 'dart:async';

import 'package:flutter/services.dart';

class BumbleScrollbar {
  static const MethodChannel _channel = MethodChannel('bumble_scrollbar');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}

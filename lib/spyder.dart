import 'dart:async';

import 'package:flutter/services.dart';

class Spyder {
  static const MethodChannel _channel = const MethodChannel('spyder');
  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> encryptUsingCaesarCipher(String text, String shift) async {
    final String encryptedText =
        await _channel.invokeMethod('encryptUsingCaesarCipher');
    return encryptedText;
  }

  static Future<String> encryptUsingHillCipher(String text, String key) async {
    final String encryptedText =
        await _channel.invokeMethod('encryptUsingHillCipher');
    return encryptedText;
  }

  static Future<String> encryptUsingRailFenceCipher(
      String text, int key) async {
    final String encryptedText =
        await _channel.invokeMethod('encryptUsingRailFenceCipher');
    return encryptedText;
  }

  static Future<String> encryptUsingVignereCipher(
      String text, String key) async {
    final String encryptedText =
        await _channel.invokeMethod('encryptUsingVignereCipher');
    return encryptedText;
  }

  static Future<String> encryptUsingPlayFairCipher(
      String text, String key) async {
    final String encryptedText =
        await _channel.invokeMethod('encryptUsingPlayFairCipher');
    return encryptedText;
  }

  static Future<String> decryptUsingCaesarCipher(String text, int shift) async {
    final String decryptedText =
        await _channel.invokeMethod('decryptUsingCaesarCipher');
    return decryptedText;
  }

  static Future<String> decryptUsingHillCipher(String text, String key) async {
    final String decryptedText =
        await _channel.invokeMethod('decryptUsingHillCipher');
    return decryptedText;
  }

  static Future<String> decryptUsingRailFenceCipher(
      String text, int key) async {
    final String decryptedText =
        await _channel.invokeMethod('decryptUsingRailFenceCipher');
    return decryptedText;
  }

  static Future<String> decryptUsingVignereCipher(
      String text, String key) async {
    final String decryptedText =
        await _channel.invokeMethod('decryptUsingVignereCipher');
    return decryptedText;
  }

  static Future<String> decryptUsingPlayFairCipher(
      String text, String key) async {
    final String decryptedText =
        await _channel.invokeMethod('decryptUsingPlayFairCipher');
    return decryptedText;
  }
}

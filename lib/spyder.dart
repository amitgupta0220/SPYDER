import 'dart:async';

import 'package:flutter/services.dart';

class Spyder {
  static const MethodChannel _channel = const MethodChannel('spyder');
  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> encryptUsingCaesarCipher(
      String text, String shift) async {
    final String encryptedText = await _channel.invokeMethod(
        'encryptUsingCaesarCipher',
        <String, dynamic>{'key': shift, 'text': text});
    return encryptedText;
  }

  static Future<String> encryptUsingAtbashCipher(String text) async {
    final String encryptedText = await _channel.invokeMethod(
        'encryptUsingAtbashCipher', <String, dynamic>{'text': text});
    return encryptedText;
  }

  static Future<String> encryptUsingRailFenceCipher(
      String text, String key) async {
    final String encryptedText = await _channel.invokeMethod(
        'encryptUsingRailFenceCipher',
        <String, dynamic>{'key': key, 'text': text});
    return encryptedText;
  }

  static Future<String> encryptUsingVignereCipher(
      String text, String key) async {
    final String encryptedText = await _channel.invokeMethod(
        'encryptUsingVignereCipher',
        <String, dynamic>{'key': key, 'text': text});
    return encryptedText;
  }

  static Future<String> encryptUsingPlayFairCipher(
      String text, String key) async {
    final String encryptedText = await _channel.invokeMethod(
        'encryptUsingPlayFairCipher',
        <String, dynamic>{'key': key, 'text': text});
    return encryptedText;
  }

  static Future<String> decryptUsingCaesarCipher(
      String text, String shift) async {
    final String decryptedText = await _channel.invokeMethod(
        'decryptUsingCaesarCipher',
        <String, dynamic>{'key': shift, 'text': text});
    return decryptedText;
  }

  static Future<String> decryptUsingAtbashCipher(String text) async {
    final String decryptedText = await _channel.invokeMethod(
        'decryptUsingAtbashCipher', <String, dynamic>{'text': text});
    return decryptedText;
  }

  static Future<String> decryptUsingRailFenceCipher(
      String text, String key) async {
    final String decryptedText = await _channel.invokeMethod(
        'decryptUsingRailFenceCipher',
        <String, dynamic>{'key': key, 'text': text});
    return decryptedText;
  }

  static Future<String> decryptUsingVignereCipher(
      String text, String key) async {
    final String decryptedText = await _channel.invokeMethod(
        'decryptUsingVignereCipher',
        <String, dynamic>{'key': key, 'text': text});
    return decryptedText;
  }

  static Future<String> decryptUsingPlayFairCipher(
      String text, String key) async {
    final String decryptedText = await _channel.invokeMethod(
        'decryptUsingPlayFairCipher',
        <String, dynamic>{'key': key, 'text': text});
    return decryptedText;
  }
}

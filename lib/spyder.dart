import 'dart:async';

import 'package:flutter/services.dart';

//Spyder main class includes all encryption and decryption techniques

class Spyder {
  static const MethodChannel _channel = const MethodChannel('spyder');
  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

//Caesar Cipher Encryption
  static Future<String> encryptUsingCaesarCipher(
      String text, String shift) async {
    final String encryptedText = await _channel.invokeMethod(
        'encryptUsingCaesarCipher',
        <String, dynamic>{'key': shift, 'text': text});
    return encryptedText;
  }

//Hill Cipher Encryption
  static Future<String> encryptUsingHillCipher(
      String text, List<int> key) async {
    final String encryptedText = await _channel.invokeMethod(
        'encryptUsingHillCipher', <String, dynamic>{'key': key, 'text': text});
    return encryptedText;
  }

//Railfence Encryption
  static Future<String> encryptUsingRailFenceCipher(
      String text, int key) async {
    final String encryptedText = await _channel.invokeMethod(
        'encryptUsingRailFenceCipher',
        <String, dynamic>{'key': key, 'text': text});
    return encryptedText;
  }

//Vigenere Cipher Encryption
  static Future<String> encryptUsingVignereCipher(
      String text, String key) async {
    final String encryptedText = await _channel.invokeMethod(
        'encryptUsingVignereCipher',
        <String, dynamic>{'key': key, 'text': text});
    return encryptedText;
  }

//PlayFair Encryption
  static Future<String> encryptUsingPlayFairCipher(
      String text, String key) async {
    final String encryptedText = await _channel.invokeMethod(
        'encryptUsingPlayFairCipher',
        <String, dynamic>{'key': key, 'text': text});
    return encryptedText;
  }

//Caesar Cipher Decryption
  static Future<String> decryptUsingCaesarCipher(
      String text, String shift) async {
    final String decryptedText = await _channel.invokeMethod(
        'decryptUsingCaesarCipher',
        <String, dynamic>{'key': shift, 'text': text});
    return decryptedText;
  }

//Hill Cipher Decryption
  static Future<String> decryptUsingHillCipher(String text, String key) async {
    final String decryptedText = await _channel.invokeMethod(
        'decryptUsingHillCipher', <String, dynamic>{'key': key, 'text': text});
    return decryptedText;
  }

//Railfence Decryption
  static Future<String> decryptUsingRailFenceCipher(
      String text, int key) async {
    final String decryptedText = await _channel.invokeMethod(
        'decryptUsingRailFenceCipher',
        <String, dynamic>{'key': key, 'text': text});
    return decryptedText;
  }

//Vigenere Decryption
  static Future<String> decryptUsingVignereCipher(
      String text, String key) async {
    final String decryptedText = await _channel.invokeMethod(
        'decryptUsingVignereCipher',
        <String, dynamic>{'key': key, 'text': text});
    return decryptedText;
  }

  //PlayFair Cipher Decryption
  static Future<String> decryptUsingPlayFairCipher(
      String text, String key) async {
    final String decryptedText = await _channel.invokeMethod(
        'decryptUsingPlayFairCipher',
        <String, dynamic>{'key': key, 'text': text});
    return decryptedText;
  }
}

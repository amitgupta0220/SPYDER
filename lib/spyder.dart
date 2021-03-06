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

//Atbash Cipher Encryption
  static Future<String> encryptUsingAtbashCipher(String text) async {
    final String encryptedText = await _channel.invokeMethod(
        'encryptUsingAtbashCipher', <String, dynamic>{'text': text});
    return encryptedText;
  }

//Railfence Encryption
  static Future<String> encryptUsingRailFenceCipher(
      String text, String key) async {
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

//AutoKey Cipher Encryption
  static Future<String> encryptUsingAutoKeyCipher(
      String text, String key) async {
    final String encryptedText = await _channel.invokeMethod(
        'encryptUsingAutoKeyCipher',
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

//Atbash Cipher decryption
  static Future<String> decryptUsingAtbashCipher(String text) async {
    final String decryptedText = await _channel.invokeMethod(
        'decryptUsingAtbashCipher', <String, dynamic>{'text': text});
    return decryptedText;
  }

//Railfence Decryption
  static Future<String> decryptUsingRailFenceCipher(
      String text, String key) async {
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

  //Autokey Cipher Decryption
  static Future<String> decryptUsingAutoKeyCipher(
      String text, String key) async {
    final String decryptedText = await _channel.invokeMethod(
        'decryptUsingAutoKeyCipher',
        <String, dynamic>{'key': key, 'text': text});
    return decryptedText;
  }
}

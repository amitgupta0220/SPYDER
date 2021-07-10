package com.spyder.spyder;

import android.os.Build;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import static java.lang.Integer.parseInt;

import com.spyder.spyder.CaesarCipher;

/**
 * SpyderPlugin
 */
public class SpyderPlugin implements FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "spyder");
        channel.setMethodCallHandler(this);
    }

    @RequiresApi(api = Build.VERSION_CODES.O)
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("getPlatformVersion")) {

            result.success("Android " + android.os.Build.VERSION.RELEASE);
        } else if (call.method.equals("encryptUsingCaesarCipher")) {
            String keyString = call.argument("key");
            String msg = call.argument("text");

            CaesarCipher ct = new CaesarCipher();
            String encrypMsg = ct.toEncrypt(msg, keyString);
            result.success(encrypMsg);

        } else if (call.method.equals("decryptUsingCaesarCipher")) {
            String keyString = call.argument("key");
            assert keyString != null;
            int dcyptkey = parseInt(keyString);
            String encypText = call.argument("text");
            CaesarCipher ct = new CaesarCipher();
            String decrpMsg = ct.toDecrypt(encypText, dcyptkey);
            result.success(decrpMsg);

        } else if (call.method.equals("encryptUsingAtbashCipher")) {
            String input = call.argument("text");
            assert input != null;
            AtbashCipher ab = new AtbashCipher();
            String res = ab.toEncrypt(input);
            result.success(res);

        } else if (call.method.equals("decryptUsingAtbashCipher")) {
            String input = call.argument("text");
            assert input != null;
            AtbashCipher ab = new AtbashCipher();
            String deciphered = ab.toDecrypt(input);
            result.success(deciphered);

        } else if (call.method.equals("encryptUsingRailFenceCipher")) {
            String message = call.argument("text");
            assert message != null;
            message = message.replaceAll("\\s", "");
            String keyString = call.argument("key");
            assert keyString != null;
            int key = parseInt(keyString);
            RailFenceCipher rf = new RailFenceCipher();
            String encrypText = rf.toEncrypt(message, key);
            result.success(encrypText);

        } else if (call.method.equals("decryptUsingRailFenceCipher")) {
            String message = call.argument("text");
            assert message != null;
            message = message.replaceAll("\\s", "");
            String keyString = call.argument("key");
            assert keyString != null;
            int key = parseInt(keyString);
            RailFenceCipher rf = new RailFenceCipher();
            String decrypText = rf.toDecrypt(message, key);
            result.success(decrypText);

        } else if (call.method.equals("encryptUsingVignereCipher")) {
            String message = call.argument("text");
            String mappedKey = call.argument("key");
            assert mappedKey != null;
            mappedKey = mappedKey.toUpperCase();
            if (message != null) {
                message = message.toUpperCase();
            }
            VigenereCipher vigenereCipher = new VigenereCipher();
            String res = vigenereCipher.toEncrypt(message, mappedKey);
            result.success(res);

        } else if (call.method.equals("decryptUsingVignereCipher")) {
            String message = call.argument("text");
            String mappedKey = call.argument("key");
            assert mappedKey != null;
            mappedKey = mappedKey.toUpperCase();
            if (message != null) {
                message = message.toUpperCase();
            }
            VigenereCipher vigenereCipher = new VigenereCipher();
            String decryptedText = vigenereCipher.toDecrypt(message, mappedKey);
            result.success(decryptedText);

        } else if (call.method.equals("encryptUsingAutoKeyCipher")) {
            String plainText = call.argument("text");
            String keyPhrase = call.argument("key");
            StringBuilder cipherText = new StringBuilder();
            assert plainText != null;
            plainText = plainText.toUpperCase();
            assert keyPhrase != null;
            keyPhrase = keyPhrase.toUpperCase();
            for (int i = 0; i < plainText.length(); i++) {
                int x = (((plainText.charAt(i) - 'A') + (keyPhrase.charAt(i) - 'A')) % 26);
                cipherText.append((char) (x + 'A'));
            }

            result.success(cipherText.toString());
        } else if (call.method.equals("decryptUsingAutoKeyCipher")) {
            String plainText = "";
            String cipherText = call.argument("text");
            String keyPhrase = call.argument("key");
            assert cipherText != null;
            cipherText = cipherText.toUpperCase();
            assert keyPhrase != null;
            keyPhrase = keyPhrase.toUpperCase();

            for (int i = 0; i < cipherText.length(); i++) {

                int x = (((cipherText.charAt(i) - 'A') - (keyPhrase.charAt(i) - 'A')) % 26);
                x = (x < 0) ? (26 - Math.abs(x)) : x;
                plainText += (char) (x + 'A');
                keyPhrase += (char) (x + 'A');
            }

            result.success(plainText);
        } else {
            result.notImplemented();
        }
    }


    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}

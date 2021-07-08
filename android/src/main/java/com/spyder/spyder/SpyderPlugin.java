package com.spyder.spyder;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import static java.lang.Integer.parseInt;

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

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("getPlatformVersion")) {

            result.success("Android " + android.os.Build.VERSION.RELEASE);
        } else if (call.method.equals("encryptUsingCaesarCipher")) {
            String keyString = call.argument("shift");
            String msg = call.argument("text");
            if (keyString != null) {
                int key = parseInt(keyString);
//          int key = call.argument("shift");

                StringBuilder encrypMsg = new StringBuilder();

                if (msg != null) {
                    for (int i = 0; i < msg.length(); i++) {
                        // again casting
                        if ((int) msg.charAt(i) == 32) {
                            encrypMsg.append((char) 32); // ignoring space, casting int to char

                        } else if ((int) msg.charAt(i) + key > 122) {
                            int temp = ((int) msg.charAt(i) + key) - 122;
                            encrypMsg.append((char) (96 + temp));

                        } else if ((int) msg.charAt(i) + key > 90 && (int) msg.charAt(i) < 96) {
                            int temp = ((int) msg.charAt(i) + key) - 90;
                            encrypMsg.append((char) (64 + temp));

                        } else {
                            encrypMsg.append((char) ((int) msg.charAt(i) + key));

                        }
                    } // for loop
                }
                System.out.println(encrypMsg);
                result.success(encrypMsg.toString());
            }
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}

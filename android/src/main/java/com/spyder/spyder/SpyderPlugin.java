package com.spyder.spyder;

import androidx.annotation.NonNull;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

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
            String keyString = call.argument("key");
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
                result.success(encrypMsg.toString());
            }
        } else if (call.method.equals("decryptUsingCaesarCipher")) {
            String keyString = call.argument("key");
            assert keyString != null;
            int dcyptkey = parseInt(keyString);
            StringBuilder decrypMsg = new StringBuilder();
            String encypText = call.argument("text");
            if (encypText != null) {
                for (int i = 0; i < encypText.length(); i++) {
                    // now type casting
                    if ((int) encypText.charAt(i) == 32) {
                        decrypMsg.append((char) 32);
                    } else if (((int) encypText.charAt(i) - dcyptkey) < 97 && ((int) encypText.charAt(i) - dcyptkey) > 90) {
                        //lower case
                        int temp = ((int) encypText.charAt(i) - dcyptkey) + 26;
                        decrypMsg.append((char) temp);
                    } else if ((encypText.charAt(i) - dcyptkey) < 65) {
                        // upper case
                        int temp = ((int) encypText.charAt(i) - dcyptkey) + 26;
                        decrypMsg.append((char) temp);
                    } else {
                        decrypMsg.append((char) ((int) encypText.charAt(i) - dcyptkey));
                    }

                } // for loop
            }
            result.success(decrypMsg.toString());

        } else if (call.method.equals("encryptUsingHillCipher")) {
             Map<Character, Integer> char_to_int = new HashMap<Character, Integer>();
            /* Integer to character map */
             Map<Integer, Character> int_to_char = new HashMap<Integer, Character>();
            int[] K = call.argument("key");
             

             String m = call.argument("text");
            if(!verify_input(m, K)){
                System.out.println("Argument error");
            }
            if (m != null) {
                while(m.length() % K.length != 0)
                    m += 'a';
            }
            for(int i = 0; i < 26; i ++)
            {
                char_to_int.put((char) ('a' + i), 0 + i);
                int_to_char.put(0 + i, (char) ('a' + i));
            }

            int K_det = inv((K[0]*K[3]-K[1]*K[2]) % 26);
            K_inv = new int[]{K[3], -K[1], -K[2], K[0]};
            for(int i = 0; i < K_inv.length; i++)
            {
                K_inv[i] = K_det * K_inv[i];
                K_inv[i] = (K_inv[i] + 26) % 26;
            }
            int cnt = (int)Math.ceil((double)m.length() / 2);
            String[] x_substrings = new String[cnt];
            for(int i = 0, idx = 0; i < m.length(); i+=2)
            {
                x_substrings[idx++] = m.substring(i, Math.min(i + 2, m.length()));
            }

            // Initialize output ciphertext string
            String y = "";

            // Perform encryption
            for(int i = 0; i < x_substrings.length; i++)
            {
                int x_i = char_to_int.get(x_substrings[i].charAt(0));
                int x_j = char_to_int.get(x_substrings[i].charAt(1));

                int y_i = x_i * K[0] + x_j * K[2];
                y_i = (y_i + 26) % 26;
                int y_j = x_i * K[1] + x_j * K[3];
                y_j = (y_j + 26) % 26;

                y += int_to_char.get(y_i);
                y += int_to_char.get(y_j);
            }

            result.success(y);


            //------------------------------------------------
//            String msg = call.argument("text");
//            assert msg != null;
//            msg = msg.replaceAll("\\s", "");
//            msg = msg.toUpperCase();
//
//            // if irregular length, then perform padding
//            int lenChk = 0;
//            if (msg.length() % 2 != 0) {
//                msg += "0";
//                lenChk = 1;
//            }
//
//            // message to matrices
//            int[][] msg2D = new int[2][msg.length()];
//            int itr1 = 0;
//            int itr2 = 0;
//            for (int i = 0; i < msg.length(); i++) {
//                if (i % 2 == 0) {
//                    msg2D[0][itr1] = ((int) msg.charAt(i)) - 65;
//                    itr1++;
//                } else {
//                    msg2D[1][itr2] = ((int) msg.charAt(i)) - 65;
//                    itr2++;
//                } // if-else
//            } // for
//
////        // testing 2D matrix
////        for (int i = 0; i < 2; i++) {
////            for (int j = 0; j < msg.length() / 2; j++) {
////                System.out.print((char)(msg2D[i][j]+65) + " ");
////            }
////            System.out.println();
////        }
//
//            String key = call.argument("key");
//            assert key != null;
//            key = key.replaceAll("\\s", "");
//            key = key.toUpperCase();
//
//            int[][] key2D = new int[2][2];
//            int itr3 = 0;
//            for (int i = 0; i < 2; i++) {
//                for (int j = 0; j < 2; j++) {
//                    key2D[i][j] = (int) key.charAt(itr3) - 65;
//                    itr3++;
//                }
//            }
//
//            // validating the key
//            // finding determinant of key matrix
//            int deter = key2D[0][0] * key2D[1][1] - key2D[0][1] * key2D[1][0];
//            deter = moduloFunc(deter, 26);
//            // multiplicative inverse of key matrix
//            int mulInverse = -1;
//            for (int i = 0; i < 26; i++) {
//                int tempInv = deter * i;
//                if (moduloFunc(tempInv, 26) == 1) {
//                    mulInverse = i;
//                    break;
//                }  // if-else
//
//            } // for
//            if (mulInverse == -1) {
//                System.out.println("Error");
//            }
//
//            String encrypText = call.argument("text");
//            int itrCount = msg.length() / 2;
//            if (lenChk == 0){
//                // if msg length % 2 = 0
//                for (int i = 0; i < itrCount; i++) {
//                    int temp1 = msg2D[0][i] * key2D[0][0] + msg2D[1][i] * key2D[0][1];
//                    encrypText += (char)((temp1 % 26) + 65);
//                    int temp2 = msg2D[0][i] * key2D[1][0] + msg2D[1][i] * key2D[1][1];
//                    encrypText += (char)((temp2 % 26) + 65);
//                }
//            } else {
//                // if msg length % 2 != 0 (irregular length msg)
//                for (int i = 0; i < itrCount-1; i++) {
//                    int temp1 = msg2D[0][i] * key2D[0][0] + msg2D[1][i] * key2D[0][1];
//                    encrypText += (char)((temp1 % 26) + 65);
//                    int temp2 = msg2D[0][i] * key2D[1][0] + msg2D[1][i] * key2D[1][1];
//                    encrypText += (char)((temp2 % 26) + 65);
//                }
//            }
//
//            result.success(encrypText);
        } else {
            result.notImplemented();
        }
    }
    private static boolean verify_input(String t, int[] K)
    {
        // Ensure K only contains four integers > 0 and < 26
        for(int i = 0; i < K.length; i++)
        {
            if(K[i] < 0 || K[i] > 26 || K.length != 4)
            {
                System.err.println("Hill cipher key must contain four integers [0,25]!");
                return false;
            }
        }

        // Ensure K is invertible
        // K is invertible if gcd(K_11*K_22-K_12*K_21, 26) == 1
        if(gcd(K[0]*K[3]-K[1]*K[2], 26) != 1)
        {
            System.err.println("Hill cipher key must be invertible!");
            return false;
        }

        // Ensure plaintext/ciphertext only contains characters
        if(!t.matches("[a-zA-Z]+"))
        {
            System.err.println("Hill cipher plaintext/ciphertext must only contain characters!");
            return false;
        }

        return true;
    }
    private int inv(int a)
    {
        // Ensure a is coprime with 26 and multiplicative inverse exists
        if(gcd(a, 26) != 1)
        {
            System.err.println("Input is not coprime with 26! Therefore, input has no multiplicative inverse!");
            throw new IllegalArgumentException();
        }

        // Use extended Euclidean algorithm to find multiplicative inverse
        // ax + by = gcd(a,b)
        // ax + by = 1 mod m
        // ax = 1 mod m
        int m = 26, y = 0, x = 1;
        while(a > 1)
        {
            int q = a / m;
            int t = m;

            m = a % m;
            a = t;
            t = y;

            y = x - q * y;
            x = t;
        }
        x = (x + 26) % 26;

        return x;
    }
    private int K_inv[];
    private static int gcd(int a, int b)
    {
        // Use Euclidean algorithm to find gcd
        if(b == 0)
            return a;

        return gcd(b, a % b);
    }
    public static int moduloFunc(int a, int b) {
        int result = a % b;
        if (result < 0) {
            result += b;
        }
        return result;
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}

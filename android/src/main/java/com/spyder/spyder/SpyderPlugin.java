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
            String encoded = stripInvalidCharacters(input).toLowerCase();
            StringBuilder cyphered = new StringBuilder();

            for (char c : encoded.toCharArray()) {
                cyphered.append(applyCipher(c, "abcdefghijklmnopqrstuvwxyz", "zyxwvutsrqponmlkjihgfedcba"));
            }

            result.success(splitIntoFiveLetterWords(cyphered.toString(), 5));
        } else if (call.method.equals("decryptUsingAtbashCipher")) {
            String input = call.argument("text");
            assert input != null;
            String encoded = stripInvalidCharacters(input).toLowerCase();
            StringBuilder deciphered = new StringBuilder();

            for (char c : encoded.toCharArray()) {
                deciphered.append(applyCipher(c, "abcdefghijklmnopqrstuvwxyz", "zyxwvutsrqponmlkjihgfedcba"));
            }

            result.success(deciphered.toString());
        } else if (call.method.equals("encryptUsingRailFenceCipher")) {
            String message = call.argument("text");
            // removing white space from message
            assert message != null;
            message = message.replaceAll("\\s", "");

            String keyString = call.argument("key");
            assert keyString != null;
            int key = parseInt(keyString);

            char[][] rail = new char[key][message.length()];
            // matrix
            for (int i = 0; i < key; i++) {
                for (int j = 0; j < message.length(); j++) {
                    rail[i][j] = '.';
                }
            } // for

//        // testing rail
//        for (int i = 0; i < key; i++) {
//            for (int j = 0; j < message.length(); j++) {
//                System.out.print(rail[i][j]);
//            }
//            System.out.println();
//        }

            // putting letters in the matrix in zig-zag
            int row = 0;
            int check = 0;
            for (int i = 0; i < message.length(); i++) {
                if (check == 0) {
                    rail[row][i] = message.charAt(i);
                    row++;
                    if (row == key) {
                        check = 1;
                        row--;
                    }
                } else if (check == 1) {
                    row--;
                    rail[row][i] = message.charAt(i);
                    if (row == 0) {
                        check = 0;
                        row = 1;
                    }
                } // if-else
            } // for

            StringBuilder encrypText = new StringBuilder();
            for (int i = 0; i < key; i++) {
                for (int j = 0; j < message.length(); j++) {
                    encrypText.append(rail[i][j]);
//                System.out.print(rail[i][j]);
                }
//            System.out.println();
            }

            encrypText = new StringBuilder(encrypText.toString().replaceAll("\\.", ""));
            result.success(encrypText.toString());
        } else if (call.method.equals("decryptUsingRailFenceCipher")) {
            String message = call.argument("text");
            // removing white space from message
            message = message.replaceAll("\\s", "");

            String keyString = call.argument("key");
            int key = parseInt(keyString);

            char[][] rail = new char[key][message.length()];
            // matrix
            for (int i = 0; i < key; i++) {
                for (int j = 0; j < message.length(); j++) {
                    rail[i][j] = '.';
                }
            } // for

            // testing rail
//        for (int i = 0; i < key; i++) {
//            for (int j = 0; j < message.length(); j++) {
//                System.out.print(rail[i][j]);
//            }
//            System.out.println();
//        }

            // putting letters in the matrix in zig-zag
            int row = 0;
            int check = 0;
            for (int i = 0; i < message.length(); i++) {
                if (check == 0) {
                    rail[row][i] = message.charAt(i);
                    row++;
                    if (row == key) {
                        check = 1;
                        row--;
                    }
                } else if (check == 1) {
                    row--;
                    rail[row][i] = message.charAt(i);
                    if (row == 0) {
                        check = 0;
                        row = 1;
                    }
                } // if-else
            } // for

            // changing order of rails
            int ordr = 0;
            for (int i = 0; i < key; i++) {
                for (int j = 0; j < message.length(); j++) {
                    String temp = rail[i][j] + "";
                    if (temp.matches("\\.")) {
                        // skipping in case of '.'
                        continue;
                    } else {
                        // adding cipher letters one by one diagonally
                        rail[i][j] = message.charAt(ordr);
                        ordr++;
                    } // if-else
                } // inner for
            } // for

            // checking message reorder on rails
            for (int i = 0; i < key; i++) {
                for (int j = 0; j < message.length(); j++) {
                }
            }

            String decrypText = "";
            check = 0;
            row = 0;
            // converting rails back into a single line message
            for (int i = 0; i < message.length(); i++) {
                if (check == 0) {
                    decrypText += rail[row][i];
                    row++;
                    if (row == key) {
                        check = 1;
                        row--;
                    }
                } else if (check == 1) {
                    row--;
                    decrypText += rail[row][i];
                    if (row == 0) {
                        check = 0;
                        row = 1;
                    }
                } // if-else
            } // for

            result.success(decrypText);
        } else if (call.method.equals("encryptUsingVignereCipher")) {
            String message = call.argument("text");
            String mappedKey = call.argument("key");
            assert mappedKey != null;
            mappedKey = mappedKey.toUpperCase();
            if (message != null) {
                message = message.toUpperCase();
            }
            String keyMap = "";
            for (int i = 0, j = 0; i < message.length(); i++) {
                if (message.charAt(i) == (char) 32) {
                    //ignoring space
                    keyMap += (char) 32;

                } else {
                    //mapping letters of key with message
                    if (j < mappedKey.length()) {
                        keyMap += mappedKey.charAt(j);
                        j++;
                    } else {
                        //restarting the key from beginning once its length is complete
                        // and its still not mapped to message
                        j = 0;
                        keyMap += mappedKey.charAt(j);
                        j++; //without incrementing here, key's first letter will be mapped twice

                    }
                } //if-else

            } //for
            mappedKey = keyMap;
            int[][] table = createVigenereTable();
            StringBuilder encryptedText = new StringBuilder();
            for (int i = 0; i < message.length(); i++) {
                if (message.charAt(i) == (char) 32 && mappedKey.charAt(i) == (char) 32) {
                    encryptedText.append(" ");
                } else {
                    //accessing element at table[i][j] position to replace it with letter in message
                    encryptedText.append((char) table[(int) message.charAt(i) - 65][(int) mappedKey.charAt(i) - 65]);
                }
            }

            result.success(encryptedText.toString());
        } else if (call.method.equals("decryptUsingVignereCipher")) {

            int[][] table = createVigenereTable();

            String message = call.argument("text");
            String mappedKey = call.argument("key");
            assert mappedKey != null;
            mappedKey = mappedKey.toUpperCase();
            if (message != null) {
                message = message.toUpperCase();
            }
            String keyMap = "";
            for (int i = 0, j = 0; i < message.length(); i++) {
                if (message.charAt(i) == (char) 32) {
                    //ignoring space
                    keyMap += (char) 32;

                } else {
                    //mapping letters of key with message
                    if (j < mappedKey.length()) {
                        keyMap += mappedKey.charAt(j);
                        j++;
                    } else {
                        //restarting the key from beginning once its length is complete
                        // and its still not mapped to message
                        j = 0;
                        keyMap += mappedKey.charAt(j);
                        j++; //without incrementing here, key's first letter will be mapped twice

                    }
                } //if-else

            } //for
            mappedKey = keyMap;
            String decryptedText = "";

            for (int i = 0; i < message.length(); i++) {
                if (message.charAt(i) == (char) 32 && mappedKey.charAt(i) == (char) 32) {
                    decryptedText += " ";
                } else {
                    decryptedText += (char) (65 + itrCount((int) mappedKey.charAt(i), (int) message.charAt(i)));
                }
            }

            result.success(decryptedText);
        } else if (call.method.equals("encryptUsingAutoKeyCipher")) {
            String plainText = call.argument("text");
            String keyPhrase = call.argument("key");

            assert plainText != null;
            plainText = plainText.toUpperCase();
            assert keyPhrase != null;
            keyPhrase = keyPhrase.toUpperCase();

            AutoKeyCipher at = new AutoKeyCipher();
            String cipherText = at.toEncrypt(keyPhrase, plainText);
            result.success(cipherText);

        } else if (call.method.equals("decryptUsingAutoKeyCipher")) {

            String cipherText = call.argument("text");
            String keyPhrase = call.argument("key");
            assert cipherText != null;
            cipherText = cipherText.toUpperCase();
            assert keyPhrase != null;
            keyPhrase = keyPhrase.toUpperCase();

            AutoKeyCipher at = new AutoKeyCipher();
            String plainText = at.toDecrypt(keyPhrase, cipherText);

            result.success(plainText);
        } else {
            result.notImplemented();
        }
    }

    private static int[][] createVigenereTable() {
        // creating 26x26 table containing alphabets
        int[][] tableArr = new int[26][26];
        for (int i = 0; i < 26; i++) {
            for (int j = 0; j < 26; j++) {
                int temp;
                if ((i + 65) + j > 90) {
                    temp = ((i + 65) + j) - 26;
                    tableArr[i][j] = temp;
                } else {
                    temp = (i + 65) + j;
                    tableArr[i][j] = temp;
                }
            }
        }

        //printing table to check if its correct
//        for (int i = 0; i < 26; i++) {
//            for (int j = 0; j < 26; j++) {
//                System.out.print((char)tableArr[i][j] + " ");
//            }
//            System.out.println();
//        }

        return tableArr;
    }

    private static int itrCount(int key, int msg) {
        // this function will return the count which it takes from key's letter to reach cipher letter
        // and then this count will be used to calculate decryption of encrypted letter in message.
        int counter = 0;
        String result = "";
        for (int i = 0; i < 26; i++) {
            if (key + i > 90) {
                //90 being ASCII of Z
                result += (char) (key + (i - 26));

            } else {
                result += (char) (key + i);
            }
        }

        //counting from key's letter to cipher letter in vigenere table
        for (int i = 0; i < result.length(); i++) {
            if (result.charAt(i) == msg) {
                break; // letter found
            } else {
                counter++;
            }
        }
        return counter;
    }


    private String stripInvalidCharacters(String input) {
        String filteredValue = "";

        for (char c : input.toCharArray()) {
            if (Character.isLetterOrDigit(c)) {
                filteredValue += c;
            }
        }

        return filteredValue;
    }

    private char applyCipher(char input, String PLAIN, String CIPHER) {
        int idx = PLAIN.indexOf(input);

        return idx >= 0 ? CIPHER.toCharArray()[idx] : input;
    }

    @RequiresApi(api = Build.VERSION_CODES.O)
    private String splitIntoFiveLetterWords(String value, int GROUP_SIZE) {
        List<String> words = new ArrayList<>();

        for (int i = 0; i < value.length(); i += GROUP_SIZE) {
            words.add(i + GROUP_SIZE <= value.length() ? value.substring(i, i + GROUP_SIZE) : value.substring(i));
        }

        return String.join(" ", words);
    }


    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}

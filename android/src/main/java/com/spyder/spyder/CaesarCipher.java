package com.spyder.spyder;

import static java.lang.Integer.parseInt;

public class CaesarCipher {
    public String toEncrypt(String msg, String keyString) {
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
            return encrypMsg.toString();
        }
        return "Error";
    }

    public String toDecrypt(String encypText, int dcyptkey) {
        if (encypText != null) {
            StringBuilder decrypMsg = new StringBuilder();
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

            }
            return decrypMsg.toString();
        }
        return "Error";
    }
}

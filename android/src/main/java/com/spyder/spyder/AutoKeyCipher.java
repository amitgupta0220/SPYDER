package com.spyder.spyder;

public class AutoKeyCipher {
    public String toEncrypt(String keyPhrase, String plainText) {
        StringBuilder cipherText = new StringBuilder();
        for (int i = 0; i < plainText.length(); i++) {
            int x = (((plainText.charAt(i) - 'A') + (keyPhrase.charAt(i) - 'A')) % 26);
            cipherText.append((char) (x + 'A'));
        }
        return cipherText.toString();
    }

    public String toDecrypt(String keyPhrase, String cipherText) {
        String plainText = "";
        for (int i = 0; i < cipherText.length(); i++) {

            int x = (((cipherText.charAt(i) - 'A') - (keyPhrase.charAt(i) - 'A')) % 26);
            x = (x < 0) ? (26 - Math.abs(x)) : x;
            plainText += (char) (x + 'A');
            keyPhrase += (char) (x + 'A');
        }
        return plainText;
    }
}

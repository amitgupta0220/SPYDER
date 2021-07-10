package com.spyder.spyder;
import android.os.Build;
import androidx.annotation.RequiresApi;
import java.util.ArrayList;
import java.util.List;

public class AtbashCipher {
    @RequiresApi(api = Build.VERSION_CODES.O)
    public String toEncrypt(String input) {
        String encoded = stripInvalidCharacters(input).toLowerCase();
        StringBuilder cyphered = new StringBuilder();

        for (char c : encoded.toCharArray()) {
            cyphered.append(applyCipher(c, "abcdefghijklmnopqrstuvwxyz", "zyxwvutsrqponmlkjihgfedcba"));
        }
        return splitIntoFiveLetterWords(cyphered.toString(), 5);
    }
    public String toDecrypt(String input){
        String encoded = stripInvalidCharacters(input).toLowerCase();
        StringBuilder deciphered = new StringBuilder();

        for (char c : encoded.toCharArray()) {
            deciphered.append(applyCipher(c, "abcdefghijklmnopqrstuvwxyz", "zyxwvutsrqponmlkjihgfedcba"));
        }
        return  deciphered.toString();
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
}
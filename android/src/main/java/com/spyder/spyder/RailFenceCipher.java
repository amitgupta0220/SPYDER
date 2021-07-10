package com.spyder.spyder;

public class RailFenceCipher {
    public String toEncrypt(String message, int key) {
        char[][] rail = new char[key][message.length()];
        // matrix
        for (int i = 0; i < key; i++) {
            for (int j = 0; j < message.length(); j++) {
                rail[i][j] = '.';
            }
        }
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
            }
        }

        encrypText = new StringBuilder(encrypText.toString().replaceAll("\\.", ""));
        return encrypText.toString();
    }

    public String toDecrypt(String message, int key) {
        char[][] rail = new char[key][message.length()];

        for (int i = 0; i < key; i++) {
            for (int j = 0; j < message.length(); j++) {
                rail[i][j] = '.';
            }
        }
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
        }
        return decrypText;
    }
}

import 'package:spyder_example/Style/MyColors.dart';

class Content {
  List maxHeight = [250.0, 205.0, 340.0, 285.0, 205.0];
  List colors = [
    MyColors.blue,
    MyColors.yellow,
    MyColors.pink,
    MyColors.red,
    MyColors.green
  ];
  List questions = [
    "What is Caesar Cipher?",
    "What is Atbash Cipher?",
    "What is Rail-fence Cipher?",
    "What is Vigenère Cipher?",
    "What is AutoKey Cipher?"
  ];
  List contents = [
    '''The Caesar cipher is one of the earliest known and simplest ciphers. It is a type of substitution cipher in which each letter in the plaintext is 'shifted' a certain number of places down the alphabet. For example, with a shift of 1, A would be replaced by B, B would become C, and so on. The method is named after Julius Caesar, who apparently used it to communicate with his generals.''',
    '''The Atbash cipher is a substitution cipher with a specific key where the letters of the alphabet are reversed. I.e. all 'A's are replaced with 'Z's, all 'B's are replaced with 'Y's, and so on. It was originally used for the Hebrew alphabet, but can be used for any alphabet.''',
    '''The railfence cipher is a very simple, easy to crack cipher. It is a transposition cipher that follows a simple rule for mixing up the characters in the plaintext to form the ciphertext. The railfence cipher offers essentially no communication security, and it will be shown that it can be easily broken even by hand.

Although weak on its own, it can be combined with other ciphers, such as a substitution cipher, the combination of which is more difficult to break than either cipher on it's own.''',
    '''The Vigenère Cipher is a polyalphabetic substitution cipher. The method was originally described by Giovan Battista Bellaso in his 1553 book La cifra del. Sig. Giovan Battista Bellaso; however, the scheme was later misattributed to Blaise de Vigenère in the 19th century, and is now widely known as the Vigenère cipher.

Blaise de Vigenère actually invented the stronger Autokey cipher in 1586.''',
    '''The Autokey Cipher is a polyalphabetic substitution cipher. It is closely related to the Vigenere cipher, but uses a different method of generating the key. It was invented by Blaise de Vigenère in 1586, and is in general more secure than the Vigenere cipher.'''
  ];
}

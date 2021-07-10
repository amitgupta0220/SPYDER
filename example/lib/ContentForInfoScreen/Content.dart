import 'package:spyder_example/Style/MyColors.dart';

class Content {
  List maxHeight = [250.0, 285.0, 340.0, 285.0, 285.0];
  List colors = [
    MyColors.blue,
    MyColors.yellow,
    MyColors.pink,
    MyColors.red,
    MyColors.green
  ];
  List questions = [
    "What is Caesar Cipher?",
    "What is Hill Cipher?",
    "What is Rail-fence Cipher?",
    "What is Vigenère Cipher?",
    "What is PlayFair Cipher?"
  ];
  List contents = [
    '''The Caesar cipher is one of the earliest known and simplest ciphers. It is a type of substitution cipher in which each letter in the plaintext is 'shifted' a certain number of places down the alphabet. For example, with a shift of 1, A would be replaced by B, B would become C, and so on. The method is named after Julius Caesar, who apparently used it to communicate with his generals.''',
    '''Invented by Lester S. Hill in 1929, the Hill cipher is a polygraphic substitution cipher based on linear algebra. Hill used matrices and matrix multiplication to mix up the plaintext.

To counter charges that his system was too complicated for day to day use, Hill constructed a cipher machine for his system using a series of geared wheels and chains. However, the machine never really sold.''',
    '''The railfence cipher is a very simple, easy to crack cipher. It is a transposition cipher that follows a simple rule for mixing up the characters in the plaintext to form the ciphertext. The railfence cipher offers essentially no communication security, and it will be shown that it can be easily broken even by hand.

Although weak on its own, it can be combined with other ciphers, such as a substitution cipher, the combination of which is more difficult to break than either cipher on it's own.''',
    '''The Vigenère Cipher is a polyalphabetic substitution cipher. The method was originally described by Giovan Battista Bellaso in his 1553 book La cifra del. Sig. Giovan Battista Bellaso; however, the scheme was later misattributed to Blaise de Vigenère in the 19th century, and is now widely known as the Vigenère cipher.

Blaise de Vigenère actually invented the stronger Autokey cipher in 1586.''',
    '''The Playfair is significantly harder to break since the frequency analysis used for simple substitution ciphers does not work with it. Frequency analysis can still be undertaken, but on the 25*25=625 possible digraphs rather than the 25 possible monographs. Frequency analysis thus requires much more ciphertext in order to work. For a tutorial on breaking Playfair with a simulated annealing algorithm, see Cryptanalysis of the Playfair Cipher.'''
  ];
}

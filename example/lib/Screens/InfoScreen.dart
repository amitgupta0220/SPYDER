import 'package:flutter/material.dart';
import 'package:spyder_example/Screens/DetailTab.dart';
import 'package:spyder_example/Style/MediaQuery.dart';
import 'package:spyder_example/Style/MyColors.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
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

  @override
  Widget build(BuildContext context) {
    Size size = getSizeOfContext(context);
    return Scaffold(
      backgroundColor: MyColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.08,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InfoBox(
                    selectedIndex: index,
                    color: colors[index % 5],
                    question: questions[index],
                    content: contents[index],
                    maxHeight: double.parse(maxHeight[index].toString()),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class InfoBox extends StatefulWidget {
  final Color color;
  final int selectedIndex;
  final String question, content;
  final double maxHeight;
  InfoBox({
    this.selectedIndex,
    this.color,
    this.question,
    this.content,
    this.maxHeight,
  });
  @override
  _InfoBoxState createState() => _InfoBoxState();
}

class _InfoBoxState extends State<InfoBox> {
  double varHeight = 80;

  @override
  Widget build(BuildContext context) {
    Size size = getSizeOfContext(context);
    return GestureDetector(
      onTap: () {
        if (varHeight == 80) {
          setState(() {
            varHeight = widget.maxHeight;
          });
        } else {
          setState(() {
            varHeight = 80;
          });
        }
      },
      child: AnimatedContainer(
        curve: Curves.easeIn,
        constraints: BoxConstraints(minHeight: 80),
        duration: Duration(milliseconds: 500),
        height: varHeight,
        width: size.width,
        padding: EdgeInsets.all(size.width * 0.05),
        margin: EdgeInsets.all(size.width * 0.05),
        decoration: BoxDecoration(
          color: MyColors.boxBackground,
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.question,
                style: TextStyle(color: widget.color),
              ),
              SizedBox(
                height: 5,
              ),
              varHeight == widget.maxHeight
                  ? Text(
                      widget.content,
                      style: TextStyle(
                        color: MyColors.white,
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 5,
              ),
              varHeight == widget.maxHeight
                  ? GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailTab(
                            selectedTab: widget.selectedIndex,
                            cipherName: widget.question
                                .substring(8, widget.question.length - 1),
                            color: widget.color,
                          ),
                        ));
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: widget.color),
                                color: MyColors.boxBackground,
                                borderRadius: BorderRadius.circular(4)),
                            alignment: Alignment.center,
                            height: 20,
                            width: 50,
                            child: Text(
                              "Start",
                              style: TextStyle(color: widget.color),
                            )),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}

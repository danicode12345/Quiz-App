import 'package:flutter/material.dart';
import 'package:quizapp/question.dart';
import 'package:quizapp/result.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<Question> questions = [
  Question(q: 'soomaliya waxey xornimada qaadatay 1960', a: true),
  Question(
      q: 'madaxaweynihi ugu horeeyay somaliya wuxu aha maxamed siyad bare',
      a: false),
  Question(q: 'somaliya waxey kakoobantahay 18 dagmo;', a: false),
  Question(q: 'somaliya waxey kutaala qaaarad aasia', a: false),
  Question(q: 'madaxmed siyad bare wuxuu xukunka hay 18sano', a: false),
  Question(q: 'somaliya waxaa gumeystay franciska', a: false),
  Question(q: 'farmajo wuxu aha madax weynihi 2aad eesoomaliya', a: false),
  Question(
      q: 'xasan shiikh waamadax weynah kaliya 2jeer xilka kuguuleystay',
      a: true),
  Question(q: 'somaliya waxey dagalsokeeya gashay 1991;', a: true),
  Question(q: 'farmajo wuxu aha madax weynihi 2aad eesoomaliya', a: false),
  Question(q: 'somalia hada waxaa madax weyna ka ah farmajo', a: false),
];
int questinsindex = 0;
int correctanswer = 0;
int falsesanwer = 0;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 11, 60, 40),
        body: Column(children: [
          Expanded(
              flex: 7,
              child: Center(
                child: Text(
                  questions[questinsindex].questionname!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 3.0,
                  ),
                ),
              )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(left: 22, right: 22),
                  height: 65,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      final iscorect = questions[questinsindex].answerquetion;
                      setState(() {
                        if (questinsindex < questions.length - 1)
                          questinsindex++;
                      });
                      if (iscorect == true) {
                        print("waa sax");
                        setState(() {
                          correctanswer = correctanswer + 1;
                        });
                      } else {
                        print("waakhald");
                        setState(() {
                          falsesanwer = falsesanwer + 1;
                        });
                      }
                      ;
                      setState(() {
                        if (questinsindex < questions.length - 1)
                          questinsindex++;
                        else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Result(
                                  answer: correctanswer, falses: falsesanwer),
                            ),
                          );
                        }
                      });
                    },
                    child: Text(
                      "True",
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: Row(children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(left: 22, right: 22, bottom: 22),
                  height: 65,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      final isfalse = questions[questinsindex].answerquetion;
                      setState(() {
                        if (questinsindex < questions.length - 1)
                          questinsindex++;
                      });
                      if (isfalse == false) {
                        print("waa saxday");
                        setState(() {
                          correctanswer = correctanswer + 1;
                        });
                      } else {
                        print("waakhaladay");
                        setState(() {
                          falsesanwer = falsesanwer + 1;
                        });
                      }
                      setState(() {
                        if (questinsindex < questions.length - 1)
                          questinsindex++;
                        else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => Result(
                                  answer: correctanswer, falses: falsesanwer)),
                            ),
                          );
                        }
                      });
                    },
                    child: Text(
                      "False",
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ),
              ),
            ]),
          )
        ]));
  }
}

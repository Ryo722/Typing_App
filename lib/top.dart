import 'package:flutter/material.dart';
//import 'package:typing_app/page_change_test.dart';
import 'package:typing_app/typinggame.dart';

void main() {
  runApp(const Top());
}

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'TypingGame',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/top': (context) => const Top(),
    },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String language = '';     //言語を選択
  int difficulty = 0;   //難易度を選択
  static const List<String> languageList = ['C','C#','C++','Python','JavaScript','Java','PHP','Ruby','Go'];
  List<bool> languageChecker = List.generate(languageList.length, (_) => false);
  static const List<int> difficultyList = [10,15,20];
  List<bool> difficultyChecker = List.generate(difficultyList.length, (_) => false);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Typing Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 5,
                color: Colors.black12,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: const Text(
                        '言語を選択してください',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    ToggleButtons(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(left:2.0, right: 2.0),
                          width: MediaQuery.of(context).size.width / 12,
                          height: MediaQuery.of(context).size.height / 12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(languageList[0]),
                          alignment: Alignment.center,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(left:2.0, right: 2.0),
                          width: MediaQuery.of(context).size.width / 12,
                          height: MediaQuery.of(context).size.height / 12,
                          child: Text(languageList[1]),
                          alignment: Alignment.center,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(left:2.0, right: 2.0),
                          width: MediaQuery.of(context).size.width / 12,
                          height: MediaQuery.of(context).size.height / 12,
                          child: Text(languageList[2]),
                          alignment: Alignment.center,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(left:2.0, right: 2.0),
                          width: MediaQuery.of(context).size.width / 8,
                          height: MediaQuery.of(context).size.height / 12,
                          child: Text(languageList[3]),
                          alignment: Alignment.center,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(left:2.0, right: 2.0),
                          width: MediaQuery.of(context).size.width / 7,
                          height: MediaQuery.of(context).size.height / 12,
                          child: Text(languageList[4]),
                          alignment: Alignment.center,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(left:2.0, right: 2.0),
                          width: MediaQuery.of(context).size.width / 12,
                          height: MediaQuery.of(context).size.height / 12,
                          child: Text(languageList[5]),
                          alignment: Alignment.center,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(left:2.0, right: 2.0),
                          width: MediaQuery.of(context).size.width / 12,
                          height: MediaQuery.of(context).size.height / 12,
                          child: Text(languageList[6]),
                          alignment: Alignment.center,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(left:2.0, right: 2.0),
                          width: MediaQuery.of(context).size.width / 12,
                          height: MediaQuery.of(context).size.height / 12,
                          child: Text(languageList[7]),
                          alignment: Alignment.center,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(left:2.0, right: 2.0),
                          width: MediaQuery.of(context).size.width / 12,
                          height: MediaQuery.of(context).size.height / 12,
                          child: Text(languageList[8]),
                          alignment: Alignment.center,
                        ),
                      ],
                      onPressed: (int index) {
                        setState(() {
                          for (int buttonIndex = 0; buttonIndex <
                              languageChecker.length; buttonIndex++) {
                            if (buttonIndex == index) {
                              languageChecker[buttonIndex] = true;
                              language = languageList[buttonIndex];
                            } else {
                              languageChecker[buttonIndex] = false;
                            }
                          }
                        });
                      },
                      isSelected: languageChecker,
                      textStyle: const TextStyle(fontSize: 20),
                      borderWidth: 2,
                      borderColor: Colors.black,
                      selectedBorderColor: Colors.black,
                    ),
                  ],
                )
            ),

            //言語選択ボタン
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 5,
              color: Colors.black12,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                    child: const Text(
                      '難易度（出題数）を選択してください',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  //難易度選択ボタン
                  ToggleButtons(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(left:2.0, right: 2.0),
                        width: 70,
                        height: 70,
                        child: Text(difficultyList[0].toString(), style: TextStyle(fontSize: 20)),
                        alignment: Alignment.center,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(left:2.0, right: 2.0),
                        width: 70,
                        height: 70,
                        child: Text(difficultyList[1].toString(), style: TextStyle(fontSize: 20)),
                        alignment: Alignment.center,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(left:2.0, right: 2.0),
                        width: 70,
                        height: 70,
                        child: Text(difficultyList[2].toString(), style: TextStyle(fontSize: 20)),
                        alignment: Alignment.center,
                      ),
                    ],
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0; buttonIndex <
                            difficultyChecker.length; buttonIndex++) {
                          if (buttonIndex == index) {
                            difficultyChecker[buttonIndex] = true;
                            difficulty = difficultyList[buttonIndex];
                          } else {
                            difficultyChecker[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    isSelected: difficultyChecker,

                  ),
                ],
              ),
            ),


            //ページ遷移をするボタン、languageとdifficultyを渡す
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: SizedBox(
                width: 150,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (language != '' && difficulty != '') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TypingGame(language, difficulty))
                      );
                    }
                  },
                  child: const Text(
                    'Start!',
                    style: TextStyle(
                      letterSpacing: 1.3,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
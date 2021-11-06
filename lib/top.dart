import 'package:flutter/material.dart';
import 'package:typing_app/TypingGame.dart';
import 'package:typing_app/page_change_test.dart';

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
  String difficulty = '';   //難易度を選択



  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 40));


  static const List<String> languageList = ['C','C#','C++','python','Java Script','Java','php','ruby','go'];
  List<bool> languageChecker = List.generate(languageList.length, (_) => false);
  static const List<String> difficultyList = ['簡単','普通','難しい'];
  List<bool> difficultyChecker = List.generate(difficultyList.length, (_) => false);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('ここにタイトルを入れる'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height /3,
              color: Colors.black12,
              child: Column(
                children: <Widget>[
                  const Text(
                    '言語を選択してください',
                    style: TextStyle(fontSize: 40),
                  ),
                  ToggleButtons(
                    children: <Widget>[
                      Text(languageList[0]),
                      Text(languageList[1]),
                      Text(languageList[2]),
                      Text(languageList[3]),
                      Text(languageList[4]),
                      Text(languageList[5]),
                      Text(languageList[6]),
                      Text(languageList[7]),
                      Text(languageList[8]),
                    ],
                    onPressed: (int index){
                      setState(() {
                        for(int buttonIndex = 0; buttonIndex < languageChecker.length; buttonIndex++){
                          if(buttonIndex == index) {
                            languageChecker[buttonIndex] = true;
                            language = languageList[buttonIndex];
                          }else{
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


            const Text(
                '難易度を選択してください。',
              style: TextStyle(fontSize: 40),
            ),
            //難易度選択ボタン
            ToggleButtons(
              children: <Widget>[
                Text(difficultyList[0]),
                Text(difficultyList[1]),
                Text(difficultyList[2]),
              ],
              onPressed: (int index){
                setState(() {
                  for(int buttonIndex = 0; buttonIndex < difficultyChecker.length; buttonIndex++){
                    if(buttonIndex == index) {
                      difficultyChecker[buttonIndex] = true;
                      difficulty = difficultyList[buttonIndex];
                    }else{
                      difficultyChecker[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: difficultyChecker,

            ),

            //ページ遷移をするボタン、languageとdifficultyを渡す
            ElevatedButton(
                onPressed: (){

                  if (language != '' && difficulty != '') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewPage(language, difficulty))
                    );
                  }

                },
                child: const Text('start!')
            ),
          ],
        ),
      ),
    );
  }
}
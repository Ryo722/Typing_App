import 'package:flutter/material.dart';
import 'package:typing_app/TypingGame.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('ここにタイトルを入れる'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
                '言語を選択してください'
            ),

            //

            //言語選択をする。トグルボタンのリスト予定
            ElevatedButton(
              style: style,
              onPressed: () {
                language = 'C';
              },
              child: const Text('C'),
            ),
            const Text(
                '難易度を選択してください'
            ),

            //難易度を選択する。トグルボタンのリスト予定
            TextButton(
              style: TextButton.styleFrom(
                textStyle:  const TextStyle(fontSize: 40),
              ),
              onPressed: () {
                difficulty = '普通';
              },
              child: const Text('普通'),
            ),

            //ページ遷移をするボタン、languageとdifficultyを渡す
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TypingGame('c', 'nomal'))
                  );
                },
                child: const Text('start!')
            ),
          ],
        ),
      ),
    );
  }
}
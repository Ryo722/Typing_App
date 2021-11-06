import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

//void main() => runApp(MyApp());

class TypingGame extends StatelessWidget {
  const TypingGame(this.language, this.difficulty, {Key? key}) : super(key: key);

  final String language;
  final int difficulty;
  final String title = 'Typing game';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TypingGamePage(title: title, language: language, difficulty: difficulty)
    );
  }
}

class TypingGamePage extends StatefulWidget {
  final String title;
  final String language;
  final int difficulty;

  const TypingGamePage({
    Key? key,
    required this.title,
    required this.language,
    required this.difficulty,
  }) : super(key: key);

  @override
  _TypingGamePageState createState() => _TypingGamePageState();
}

class _TypingGamePageState extends State<TypingGamePage> {
  var textLists = <String>[

    'Hello World',
    'This is my App',
    'How are you?',
    'Hello Hello',
    'I love JavaScript!',
    'Good morning',
    'I am Japanese',
    'Let it be'


  ];

  int num = 0; //リストから取得する単語の番号
  int targetNum = 0; //問題数
  int length = 0; //出題した単語の文字数
  int inputWordChecker = 0; //入力されている文字が先頭から見て部分一致していれば0，していなければ-1
  int maxLengthofInputField = 1;
  int numofKeyTouch = 0;
  String targetWord = 'hello';
  String targetWordUntyped = 'hello';
  String targetWordtyped = '';
  String key = 'A';
  String inputText = '';
  final _focusNode = FocusNode();
  final _controller = TextEditingController();
  Stopwatch stopwatch = Stopwatch();


  void getWorkDone() async{
    final csvFile= await rootBundle.loadString('languagecsv/C.csv');
    for (String line in csvFile.split("\r\n")) {
      // カンマ区切りで各列のデータを配列に格納
      //List rows = line.split(','); // split by comma
      textLists = line.split(',');
    }
  }


  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    _controller.addListener(_printLatestValue);
    stopwatch.start();
    getWorkDone();
    getWordRandom();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    inputText = _controller.text;
    print(inputText);
  }

  void getWordRandom(){
    num = Random().nextInt(8);
    setState(() {
      targetWord = textLists[num];
      targetWordUntyped = textLists[num];
      targetWordtyped = '';
      _controller.clear();
    });
    print(targetWordUntyped);
    targetNum ++;
    checkStopwatch();
  }

  void getWordfromTarget(){
    length = inputText.length;
    checkInputWord();
  }

  void checkInputWord(){
    if(targetWord.lastIndexOf(inputText, length) == 0){
      targetWordtyped = inputText;
      targetWordUntyped = targetWord.substring(length);
      maxLengthofInputField = inputText.length + 2;

      if(targetWordtyped.length == targetWord.length){
        getWordRandom();
      }
    }
  }

  void checkStopwatch(){
    if(targetNum == widget.difficulty){
      stopwatch.stop();
      print(stopwatch.elapsed);
      /*
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ResultPage(10, 'nice'))
      );

       */
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Language : ' + widget.language + widget.difficulty.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            RichText(
              text: TextSpan(
                //textScaleFactor: MediaQuery.of(context).textScaleFactor,
                children: [
                  TextSpan(
                    text: targetWordtyped,
                    style: const TextStyle(color: Colors.blue, fontSize: 40),
                  ),
                  TextSpan(
                    text: targetWordUntyped,
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),

            //キー入力を取得
            RawKeyboardListener(
              focusNode: _focusNode,
              onKey: (event) {
                setState(() {
                  key = event.logicalKey.keyLabel;
                });
                getWordfromTarget();
                numofKeyTouch ++;
              },
              child: TextField(
                maxLength: maxLengthofInputField,
                // enterが押された時の動作を「何もしない」ように指定（デフォルトだとフォーカスが外れるため）
                textInputAction: TextInputAction.none,
                controller: _controller,
                autofocus: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


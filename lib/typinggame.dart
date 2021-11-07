import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'dart:io';
import 'package:typing_app/typing_result.dart';
import 'package:flutter/services.dart';


class TypingGame extends StatelessWidget {
  const TypingGame(this.language, this.difficulty,  {Key? key}) : super(key: key);

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
  int targetNum = 1; //問題数
  int length = 0; //出題した単語の文字数
  int lengthSum = 0; //出題した単語の文字数の合計
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
    final csvFile= await rootBundle.loadString('languagecsv/' + widget.language +'.csv');
    for (String line in csvFile.split("\r\n")) {
      // カンマ区切りで各列のデータを配列に格納
      //List rows = line.split(','); // split by comma
      textLists = line.split(',');
    }
    print(textLists);
  }

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    _controller.addListener(_printLatestValue);

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
  }

  void getWordRandom(){
    num = Random().nextInt(8);
    setState(() {
      targetWord = textLists[num];
      targetWordUntyped = textLists[num];
      targetWordtyped = '';
      _controller.clear();
    });
    targetNum ++;
    lengthSum += targetWord.length;
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
    if(targetNum == widget.difficulty + 1){
      stopwatch.stop();
      print(stopwatch.elapsedMilliseconds/1000);
      print(numofKeyTouch);
      print(lengthSum);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ResultPage(calculateKPM(), calculateAccuracy()))
      ).then((value){
        targetNum = 0;
        numofKeyTouch = 0;
        lengthSum = 0;
        stopwatch.reset();
      });
    }
  }

  double calculateKPM(){
    return numofKeyTouch / (stopwatch.elapsedMilliseconds / 1000 );
  }

  double calculateAccuracy(){
    return lengthSum / (numofKeyTouch / 2); // なぜかキータッチが2倍カウントされているので補正
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center (
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
<<<<<<< HEAD
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Text(
                'Language : ' + widget.language,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            //スペース調整
            SizedBox(
              child: Container(
                height: 130,
              ),
=======
            Text(
              'Language : ' + widget.language,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '現在' + targetNum.toString() + '/' + widget.difficulty.toString() + '問目',
              style: TextStyle(fontSize: 20),
>>>>>>> 5fec331307fb88f59ccb1a7c9bcfafc3c7b390d0
            ),
            RichText(
              text: TextSpan(
                //textScaleFactor: MediaQuery.of(context).textScaleFactor,
                children: [
                  TextSpan(
                    text: targetWordtyped,
                    style: const TextStyle(color: Colors.blue, fontSize: 60),
                  ),
                  TextSpan(
                    text: targetWordUntyped,
                    style: const TextStyle(fontSize: 40),
                  )
                ],
              ),
            ),
            //スペース調整
            SizedBox(
              child: Container(
                height: 60,
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
                if(numofKeyTouch == 0){
                  stopwatch.start();
                }
                numofKeyTouch ++;
              },
              child: Container(
                width: 300,

                child: TextField(
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                  ),
                  maxLength: maxLengthofInputField,
                  // enterが押された時の動作を「何もしない」ように指定（デフォルトだとフォーカスが外れるため）
                  textInputAction: TextInputAction.none,
                  controller: _controller,
                  autofocus: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


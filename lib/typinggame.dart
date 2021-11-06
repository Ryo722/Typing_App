import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

//void main() => runApp(MyApp());

class TypingGame extends StatelessWidget {
  TypingGame(this.language, this.difficulty, {Key? key}) : super(key: key);

  final String language;
  final String difficulty;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Typing game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Typing game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  int num = 0;
  int length = 0;
  int inputWordChecker = 0;
  String targetWord = 'hello';
  String targetWordUntype = 'hello';
  String targetWordtyped = '';
  String key = 'A';
  String inputText = '';
  final _focusNode = FocusNode();
  final _controller = TextEditingController();
  //Timer timer;
  //Datetime time;

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    _controller.addListener(_printLatestValue);
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
      targetWordUntype = textLists[num];
      _controller.clear();
    });
    print(targetWordUntype);
  }

  void getWordfromTarget(){
    length = inputText.length;
    inputWordChecker = targetWord.lastIndexOf(inputText, length);
    print('inputWordChecker: ${inputWordChecker}');
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
              key,
            ),
            Text(
              targetWord,
            ),
            Text(
              targetWordUntype,
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: getWordRandom,
              child: Text(
                '文字列表示',
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
              },
              child: TextField(
                maxLength: targetWord.length,
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

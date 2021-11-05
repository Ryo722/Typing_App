import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  String word = 'hello';
  String key = 'A';
  final _focusNode = FocusNode();
  final _controller = TextEditingController();


  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void getWordRandom(){
    num = Random().nextInt(8);
    setState(() {
      word = textLists[num];
    });
    print(word);
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
              word,
            ),
            Text(
              word,
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: getWordRandom,
              child: Text(
                '文字列表示',
              ),
            ),
            RawKeyboardListener(
              focusNode: _focusNode,
              onKey: (event) {
                setState(() {
                  key = event.logicalKey.keyLabel;
                });
              },
              child: TextField(
                // enterが押された時の動作を「何もしない」ように指定（デフォルトだとフォーカスが外れるため）
                textInputAction: TextInputAction.none,
                controller: _controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

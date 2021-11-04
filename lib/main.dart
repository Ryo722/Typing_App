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

  String word = 'hellp';
  String key = 'A';
  String _message = 'test';


  void get_Word_Random(){
    int num = Random().nextInt(8);
    setState(() {
      word = textLists[num];
    });
    print(word);
  }

  void _handleKeyEvent(RawKeyEvent event) {
    setState(() {
      _message =
      'Key: ${event.logicalKey.debugName}, KeyId: ${event.logicalKey.keyId}';
    });
    print(event.logicalKey.keyLabel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
            ),
            Text(
              word,
            ),
            Text(
              word,
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: get_Word_Random,
              child: Text(
                '文字列表示',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

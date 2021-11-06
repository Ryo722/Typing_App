import 'package:flutter/material.dart';
import 'package:typing_app/page_change_test.dart';

void main() {
  runApp(const Top());
}

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ここにタイトルが入る',
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
  String language = '';
  String difficulty = '';

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
            ElevatedButton(
              style: style,
              onPressed: () {
                  language = 'C';
              },
              child: const Text('C'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle:  const TextStyle(fontSize: 40),
              ),
              onPressed: () {
                difficulty = '普通';
              },
              child: const Text('普通'),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewPage(language,difficulty))
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
import 'package:flutter/material.dart';

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
  String text = '押してない';
  void _press() {
    setState(() {
      text = '押した';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle:  const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('C'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle:  const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('C#'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _press,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
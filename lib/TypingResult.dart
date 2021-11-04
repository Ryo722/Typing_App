import 'package:flutter/material.dart';
import 'package:typing_result/main.dart';   //typing page
import 'package:typing_result/second.dart'; //select page

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result Page"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('wpm', textAlign: TextAlign.center),
            const Text('accuracy', textAlign: TextAlign.center),
            //again button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) {
                          return SecondPage();
                        }));
              },
              child: const Text('Again'),
            ),
            //top button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) {
                          return MyApp();
                        }));
              },
              child: const Text('Top'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:typing_result/main.dart';   //typing page
import 'package:typing_result/second.dart'; //select page

class ResultPage extends StatelessWidget {
  ResultPage(this.speed, this.accuracy);
  final String speed;//speed data
  final String accuracy;//speed data

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
            Text(speed),
            const Text('accuracy', textAlign: TextAlign.center),
            Text(accuracy),
            //again button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) {
                          return SecondPage();
                        }));
              },
              child: const Text('Top'),
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
              child: const Text('Again'),
            ),
          ],
        ),
      ),
    );
  }
}

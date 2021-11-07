import 'package:flutter/material.dart';
import 'package:typing_app/top.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.language, this.difficulty, this.speed, this.accuracy);
  final String language;  //選択言語
  final String difficulty;//難易度
  final int speed;        //速さのデータ
  final int accuracy;     //正確さのデータ


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("結果発表！"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                //result speed
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height * (30 / 100),
                  color: Colors.pinkAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(child: Text('wpm', textAlign: TextAlign.center)),
                      Container(child: Text('$speed')),
                    ],
                  ),
                ),
                //result accuracy
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height * (30 / 100),
                  color: Colors.lightBlueAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(child: Text('accuracy', textAlign: TextAlign.center)),
                      Container(child: Text('$accuracy')),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                //again button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Top()),
                    );
                  },
                  child: const Text('Top'),
                ),
                //top button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop({context, language, difficulty});
                  },
                  child: const Text('Again'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

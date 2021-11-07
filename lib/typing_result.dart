import 'package:flutter/material.dart';
import 'package:typing_app/top.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.speed, this.accuracy);
  final double speed;      //速さのデータ
  final double accuracy;//正確さのデータ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("結果発表！"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Container(
                height: 60,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //result speed
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height * (30 / 100),
                  color: Colors.lightBlue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 300,
                          child: Text(
                          'KPM',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24),
                      )),
                      Container(child: Text(
                          speed.toStringAsFixed(2),
                          style: TextStyle(fontSize: 32),
                      )),
                    ],
                  ),
                ),
                //result accuracy
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height * (30 / 100),
                  color: Colors.lightBlueAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Text(
                          'accuracy',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24),
                      )),
                      Container(child: Text(
                          accuracy.toStringAsFixed(3),
                          style: TextStyle(fontSize: 32),
                      )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              child: Container(
                height: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //again button
                SizedBox(
                  width: 130,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Top()),
                      );
                    },
                    child: const Text('Top',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  child: Container(
                    width: 30,
                  ),
                ),
                //top button
                SizedBox(
                  width: 130,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Again',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

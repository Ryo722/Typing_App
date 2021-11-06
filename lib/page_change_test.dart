import 'package:flutter/material.dart';

class NewPage extends StatelessWidget{
  NewPage(this.language, this.difficulty,{Key? key}) : super(key: key);
  String language;
  String difficulty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text(language),
            Text(difficulty)
          ],
        )
      ),
    );
  }
}

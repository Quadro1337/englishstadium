import 'package:flutter/material.dart';
import 'roundButton.dart';
import 'globals.dart';
import 'speechRecognizer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool taskOpen = false;
  _title(text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 52,
            fontWeight: FontWeight.w700,
            fontFamily: 'AmaticBold'),
      ),
    );
  }

  _task(text1, text2, callback1, callback2) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RoundButton(
            callback: callback1,
            label: text1,
          ),
          RoundButton(
            callback: callback2,
            label: text2,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (taskOpen) {
      return Column(
        children: [
          SpeechScreen(),
          FlatButton(
            child: Text('Вернуться на главную'),
            onPressed: () {
              setState(() {
                taskOpen = false;
              });
            },
          )
        ],
      );
    } else
      return Column(
        children: [
          Container(
            child: Column(
              children: [
                _title('НАЧИНАЮЩИЙ'),
                _task('Приветствие', 'Родственники', () {
                  setState(() {
                    taskOpen = true;
                  });
                }, () {}),
                _task('Время', 'Строения', () {}, () {}),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                _title('СРЕДНИЙ УРОВЕНЬ'),
                _task('Школа', 'Уроки', () {}, () {}),
                _task('Профессии', 'Принадлежности', () {}, () {}),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 40),
            child: Column(
              children: [
                _title('ПРОДВИНУТЫЙ'),
                _task('Фразеологизмы', 'Устаревшие слова', () {}, () {}),
                _task('Политика', 'Средневековье', () {}, () {}),
              ],
            ),
          ),
        ],
      );
  }
}

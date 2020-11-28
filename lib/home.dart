import 'package:flutter/material.dart';
import 'roundButton.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Text(
                  'НОВИЧОК', // не для Навального..

                  style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'AmaticBold'),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RoundButton(
                      callback: () {},
                      label: 'Приветствие',
                      picture: 'Greeting',
                    ),
                    RoundButton(
                      callback: () {},
                      label: 'Родственники',
                      picture: 'Relatives',
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RoundButton(
                      callback: () {},
                      label: 'Время',
                      picture: 'Time',
                    ),
                    RoundButton(
                      callback: () {},
                      label: 'Строения',
                      picture: 'Buildings',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 40),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Text(
                  'УЧЕНИК',
                  style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'AmaticBold'),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RoundButton(
                      callback: () {},
                      label: 'Школа',
                      picture: 'School',
                    ),
                    RoundButton(
                      callback: () {},
                      label: 'Уроки',
                      picture: 'Lessons',
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RoundButton(
                      callback: () {},
                      label: 'Профессии',
                      picture: 'Specials',
                    ),
                    RoundButton(
                      callback: () {},
                      label: 'Принадлежности',
                      picture: 'Supplies',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

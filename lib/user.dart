import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'stats.dart';
import 'package:flutter_svg/svg.dart';
import 'globals.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int currentPage = 0;
  int _stage = 0;
  TextEditingController controller1;
  _input(name, _controller, callback) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 25),
          labelStyle: TextStyle(
              color: Color(0x40000000),
              fontSize: 18,
              fontWeight: FontWeight.w300),
          labelText: name,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(),
          ),
        ),
        validator: (val) {
          if (val.length == 0) {
            return 'Пожалуйста, заполните все поля!';
          } else {
            return null;
          }
        },
        onChanged: callback,
      ),
    );
  }

  _logo() {
    return Container(
        margin: EdgeInsets.all(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/Logo.svg'),
            Container(
              margin: EdgeInsets.only(left: 25),
              child: Text('СТАДИУМ',
                  style: TextStyle(
                      color: Color(0xFFFEA34F),
                      fontSize: 52,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'AmaticBold')),
            )
          ],
        ));
  }

  GlobalKey bottomNavigationKey = GlobalKey();
  _getPage(int page) {
    switch (page) {
      case 0:
        return HomePage();
      case 1:
        return Container();
      default:
        return Column();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Globals.Authorizated)
      return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 60),
            width: double.infinity,
            child: Column(
              children: [
                Stats(),
                Container(
                    height: MediaQuery.of(context).size.height - 180,
                    child: SingleChildScrollView(child: _getPage(currentPage))),
              ],
            )),
        bottomNavigationBar: FancyBottomNavigation(
          inactiveIconColor: Color(0xFF312006),
          barBackgroundColor: Color(0xFFF8C858),
          tabs: [
            TabData(iconData: Icons.home, title: 'Занятия'),
            TabData(
              iconData: Icons.insert_comment,
              title: 'Новости',
            ),
            TabData(iconData: Icons.person, title: 'Профиль'),
            TabData(iconData: Icons.settings, title: 'Настройки'),
          ],
          key: bottomNavigationKey,
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ),
      );
    else {
      switch (_stage) {
        case 0:
          return Scaffold(
              body: Container(
            padding: EdgeInsets.only(top: 60),
            width: double.infinity,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _logo(),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: Text(
                        'Образовательное приложение для тренировки речи',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18)),
                  ),
                  Container(
                    child: FlatButton(
                        height: 75,
                        minWidth: 250,
                        color: Color(0xFFF8C858),
                        onPressed: () {
                          setState(() {
                            _stage++;
                          });
                        },
                        child: Text(
                          'Начать',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 32),
                        )),
                  )
                ],
              ),
            ),
          ));
        case 1:
          return Scaffold(
              body: Container(
            padding: EdgeInsets.only(top: 60),
            width: double.infinity,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _logo(),
                  Container(
                      child: Column(children: [
                    _input('Имя и фамилия', controller1, (String) {}),
                    _input('Номер телефона', controller1, (String) {}),
                    _input('Пароль', controller1, (String) {}),
                    _input('Повторите пароль', controller1, (String) {})
                  ])),
                  Container(
                    child: FlatButton(
                        height: 75,
                        minWidth: 250,
                        color: Color(0xFFF8C858),
                        onPressed: () {
                          setState(() {
                            Globals.Authorizated = true;
                          });
                        },
                        child: Text(
                          'Далее',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 32),
                        )),
                  )
                ],
              ),
            ),
          ));
          return Scaffold(
              body: Container(
            padding: EdgeInsets.only(top: 60),
            width: double.infinity,
          ));
      }
    }
  }
}

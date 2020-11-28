import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'stats.dart';

void main() => runApp(MyApp());

Map<int, Color> colorCodes = {
  50: Color(0xFFF8C858),
  100: Color(0xFFF8C858),
  200: Color(0xFFF8C858),
  300: Color(0xFFF8C858),
  400: Color(0xFFF8C858),
  500: Color(0xFFF8C858),
  600: Color(0xFFF8C858),
  700: Color(0xFFF8C858),
  800: Color(0xFFF8C858),
  900: Color(0xFFF8C858),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        brightness: Brightness.light,
        primarySwatch: MaterialColor(0xFFF8C858, colorCodes),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

bool _lights = false;

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();
// SingleChildScrollView
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 60),
          //height: 500,
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
          TabData(iconData: Icons.insert_comment, title: 'Новости'),
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
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return HomePage();
      case 1:
        return Column();
      default:
        return Column();
    }
  }
}

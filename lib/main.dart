import 'package:flutter/material.dart';
import 'user.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return UserPage();
  }
}

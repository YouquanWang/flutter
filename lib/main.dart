import 'package:flutter/material.dart';
import './router/index.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Color(0XFFFB4844),
        backgroundColor: Colors.white,
        accentTextTheme: TextTheme(
          title: TextStyle(
            color: Colors.white
          )
        ),
        textTheme: TextTheme(
          title: TextStyle(
            color: Color(0XFF333333)
          ),
          subtitle: TextStyle(
            color: Color(0XFF999999)
          ),
          subhead: TextStyle(
            color: Color(0XFF666666)
          ),
        )
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:udalogin/presentation/auth/login.dart';
import 'package:udalogin/presentation/auth/register.dart';
import 'package:udalogin/presentation/bmi/bmi_calc.dart';

import 'presentation/auth/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uda Login UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Welcome(),
      routes: {
        '/home': (BuildContext context) => Welcome(),
        '/login': (BuildContext context) => PageLogin(),
        '/register': (BuildContext context) => PageRegister(),
        '/bmicalc': (BuildContext context) => BmiCalc(),
      },
    );
  }
}

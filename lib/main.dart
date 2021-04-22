import 'package:flutter/material.dart';
import 'package:udalogin/presentation/auth/login.dart';
import 'package:udalogin/presentation/auth/register.dart';

import 'presentation/auth/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Welcome(),
      routes: {
        '/login': (context) => PageLogin(),
        '/register': (BuildContext context) => PageRegister(),
      },
    );
  }
}

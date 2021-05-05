import 'package:flutter/material.dart';

class BmiCalc extends StatefulWidget {
  @override
  _BmiCalcState createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi Calc'),
      ),
    );
  }
}

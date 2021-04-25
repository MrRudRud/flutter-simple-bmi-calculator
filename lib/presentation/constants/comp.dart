import 'package:flutter/material.dart';

class CompanyName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
        children: [
          TextSpan(
            text: "d",
          ),
          TextSpan(text: "ev", style: TextStyle(color: Colors.black)),
          TextSpan(
            text: "rnz",
          ),
        ],
      ),
    );
  }
}

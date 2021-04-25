import 'dart:ui';

import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.amber.shade400, Colors.orange.shade800],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: "d",
                      ),
                      TextSpan(
                          text: "ev", style: TextStyle(color: Colors.black)),
                      TextSpan(
                        text: "rnz",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 70),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: Size.fromHeight(50),
                    // padding: EdgeInsets.symmetric(horizontal: 100),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/register');
                  },
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                    minimumSize: Size.fromHeight(50),
                    // padding: EdgeInsets.symmetric(horizontal: 100),
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  "Quick login with Touch ID",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 20),
                Icon(
                  Icons.fingerprint,
                  color: Colors.white,
                  size: 70,
                ),
                SizedBox(height: 20),
                Text(
                  "Touch ID",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

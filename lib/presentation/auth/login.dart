import 'package:flutter/material.dart';
import 'dart:math' as math;

class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        value: 0.0,
        duration: Duration(seconds: 10),
        upperBound: 1,
        lowerBound: -1,
        vsync: this)
      ..repeat();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; //decoreate height and width

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 25,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          "Back",
          style: TextStyle(fontSize: 14.0, color: Colors.black),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    child: Container(
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: <Color>[
                            Colors.orange.shade800,
                            Colors.amber.shade400,
                          ],
                        ),
                      ),
                    ),
                    builder: (BuildContext context, child) {
                      return ClipPath(
                        clipper: DrawClipt(_controller.value),
                        child: child,
                      );
                    },
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 60),
                    child: Text(
                      'Peach',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Your money is safe',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Text(
                'Sign in to continue',
                style: TextStyle(fontSize: 16),
              ),
              Container(
                width: size.width * 0.8,
                margin: EdgeInsets.only(top: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email id"),
                    input('Username'),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.8,
                margin: EdgeInsets.only(top: 18),
                child: input('Password', isPass: true),
              ),
              Container(
                margin: EdgeInsets.only(top: 18),
                child: GestureDetector(
                  onTap: () {},
                  child: Text('I dont remember my password'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 36),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Your dont have the account?",
                            style: TextStyle(
                                color: Color(0xFFACACAC), fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DrawClipt extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClipt(this.move);

  @override
  Path getClip(Size size) {
    // print(move);
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double xCenter =
        size.width * 0.5 + (size.width * 0.6) * math.sin(move * slice);
    double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);

    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget input(String hint, {bool isPass = false}) {
  return TextField(
    obscureText: isPass,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Color(0xFFACACAC), fontSize: 14),
      fillColor: null,
      // contentPadding: EdgeInsets.only(top: 20, bottom: 20, left: 38),
      enabledBorder: OutlineInputBorder(
        gapPadding: 1.0,
        borderSide: BorderSide(color: Color(0xFFF1F1F1)),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFC7C7C7)),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    ),
  );
}

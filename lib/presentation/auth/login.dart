import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'package:udalogin/presentation/constants/comp.dart';

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
              CompanyName(),
              Container(
                width: size.width * 0.8,
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("Email id"),
                    SizedBox(height: 10),
                    input('Email'),
                    SizedBox(height: 10),
                    text("Password"),
                    SizedBox(height: 10),
                    input('Password', isPass: true),
                    SizedBox(height: 20),
                    Container(
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Colors.amber.shade400,
                                  Colors.orange
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(top: 18),
                      child: GestureDetector(
                        onTap: () {},
                        child: Text('Forgot Password ?'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                child: Divider()),
                          ),
                          Text("or"),
                          Expanded(
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                child: Divider()),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue.shade900,
                      minWidth: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: SvgPicture.asset(
                                'images/social/facebook-app.svg',
                                width: 20.0,
                                height: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            child: Text(
                              'Log in with Facebook',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
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

Widget text(String text) {
  return Text(text, style: TextStyle(fontWeight: FontWeight.bold));
}

Widget input(String hint, {bool isPass = false}) {
  return TextField(
    keyboardType: isPass ? TextInputType.emailAddress : null,
    obscureText: isPass,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Color(0xFFACACAC), fontSize: 14),
      filled: true,
      fillColor: Colors.grey.shade200,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade100),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    ),
  );
}

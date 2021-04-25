import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:udalogin/presentation/constants/comp.dart';
import 'package:udalogin/presentation/constants/header.dart';

class PageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderClipPath(),
              CompanyName(),
              Container(
                width: size.width * 0.9,
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("Email id"),
                    SizedBox(height: 10),
                    input('Email', isPass: false),
                    SizedBox(height: 10),
                    text("Password"),
                    SizedBox(height: 10),
                    input('Password', isPass: true),
                    SizedBox(height: 20),
                    Container(
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {
                          print('login');
                        },
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
                        onTap: () {
                          print('forgot password');
                        },
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
                    SizedBox(height: 30),
                    MaterialButton(
                      onPressed: () {
                        print('login Facebook');
                      },
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
                    SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.only(top: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Dont have an account ?'),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/register');
                            },
                            child: Text(
                              ' Register',
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
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

Widget text(String text) {
  return Text(text, style: TextStyle(fontWeight: FontWeight.bold));
}

Widget input(String hint, {bool isPass = false}) {
  return TextField(
    keyboardType: isPass == false ? TextInputType.emailAddress : null,
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

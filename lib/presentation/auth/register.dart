import 'package:flutter/material.dart';
import 'package:udalogin/presentation/constants/comp.dart';
import 'package:udalogin/presentation/constants/header.dart';

class PageRegister extends StatelessWidget {
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
                    text("Username"),
                    SizedBox(height: 10),
                    input('Username', isPass: false),
                    SizedBox(height: 10),
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
                          print('register');
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
                              "Register Now",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.only(top: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an acoount ?'),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/login');
                            },
                            child: Text(
                              ' Login',
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

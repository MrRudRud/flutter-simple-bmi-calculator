import 'package:flutter/material.dart';

class HeaderClipPath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[Colors.amber.shade400, Colors.orange],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              // borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 4, size.height / 2, size.width / 2, size.height - 30);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height - 10,
        size.width, size.height - 25);
    path.lineTo(size.width, size.height - 50);

    // path.quadraticBezierTo(
    //     size.width / 2, size.height, size.width, size.height - 100);
    // path.quadraticBezierTo(size.width - (size.width / 4), size.height - 50,
    //     size.width, size.height - 100);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

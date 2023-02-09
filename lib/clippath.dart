import 'package:flutter/material.dart';

class TextFieldClipper extends StatelessWidget {
  const TextFieldClipper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          child: Container(
            width: 300,
            height: 80,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.blue,
            ),
          ),
          clipper: CustomClipPath(),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var controlPoint = const Offset(250, 20);
    var endPoint = const Offset(230, 40);
    // var controlPoint1 = const Offset(240, 70);
    // var endPoint1 = const Offset(300, 70);

    path.moveTo(0, 0);

    path.lineTo(300, 0);
    // path.quadraticBezierTo(
    //   controlPoint.dx,
    //   controlPoint.dy,
    //   endPoint.dx,
    //   endPoint.dy,
    // );

    path.lineTo(280, 80);

    // path.quadraticBezierTo(
    //   controlPoint1.dx,
    //   controlPoint1.dy,
    //   endPoint1.dx,
    //   endPoint1.dy,
    // );
    path.lineTo(0, 80);
    path.lineTo(0, 70);
    // path.lineTo(0, size.width / 2);
    // path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

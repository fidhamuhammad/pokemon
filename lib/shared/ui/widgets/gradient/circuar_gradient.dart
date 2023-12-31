import 'package:flutter/material.dart';

class CircularGradientContainer extends StatelessWidget {
  final double size;
  final List<Color> gradientColors;
  final double rotationAngle;
  final double top;
  final double right;
  final double bottom;
  final double left;

  const CircularGradientContainer({
    Key? key,
    required this.size,
    required this.gradientColors,
    this.rotationAngle = 0,
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
    this.left = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      child: Transform.rotate(
        angle: rotationAngle,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: gradientColors),
          ),
        ),
      ),
    );
  }
}



  // Positioned(
  //                 top: 150,
  //                 right: 5,
  //                 child: Transform.rotate(
  //                   angle: 8,
  //                   child: Container(
  //                     width: 180,
  //                     height: 180,
  //                     decoration: const BoxDecoration(
  //                         shape: BoxShape.circle,
  //                         gradient: LinearGradient(colors: [
  //                           //  Color.fromARGB(255, 104, 209, 179),
  //                           // Color.fromARGB(255, 164, 248, 233),
  //                           // Color.fromARGB(255, 8, 227, 176),

  //                           Color(0xff744ff9),
  //                           Color(0xff8369de),
  //                           Color(0xff8da0cb)
  //                         ])),
  //                   ),
  //                 )),
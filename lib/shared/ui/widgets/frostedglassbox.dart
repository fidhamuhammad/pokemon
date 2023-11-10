import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlassBox extends StatelessWidget {
  const FrostedGlassBox({Key? key,
  required this.theChild,
  required this.theHeight,
  required this.theWidth,
  }) : super (key: key);

  final double theHeight;
  final double theWidth;
  final Widget theChild;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: BackdropFilter(
        filter:ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width:  theWidth,
          height: theHeight,
          color: Colors.white.withOpacity(0.1),
          child: theChild,
        ),
        ),
    );
  }
}
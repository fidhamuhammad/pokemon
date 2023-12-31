import 'package:flutter/material.dart';

class FroastedGlassBox extends StatelessWidget {
  const FroastedGlassBox({Key? key,
  required this.theChild,
  required this.theHieght,
  required this.theWidth,
  }): super(key: key);

  final theWidth;
  final theHieght;
  final theChild;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        child: theChild,
        width: theWidth,
        height: theHieght,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5)
        ),
      ),
    );
  }
}
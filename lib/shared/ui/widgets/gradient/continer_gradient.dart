import 'package:flutter/material.dart';

class CustomGradientContainer extends StatelessWidget {
  final Alignment begin;
  final Alignment end;
  final Widget child;

  const CustomGradientContainer({
    Key? key,
    required this.begin,
    required this.end,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 248, 247, 246),
            Color.fromARGB(255, 240, 239, 238),
          ],
          begin: begin,
          end: begin,
        ),
      ),
      child: child,
    );
  }
}


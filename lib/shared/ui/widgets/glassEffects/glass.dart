import 'dart:ui';
import 'package:flutter/material.dart';

class GlassBcakground extends StatelessWidget {
  const GlassBcakground({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 238, 237),
      // const Color(0xff1C1760),
      body: Stack(
        children: [
          Positioned(
              top: 130,
              left: 220,
              child: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 247, 32, 17),
                      Color.fromARGB(255, 245, 233, 56),
                      Color.fromARGB(255, 158, 224, 42),
                      // Color(0xff744ff9),
                      // Color(0xff8369de),
                      // Color(0xff8da0cb)
                    ])),
              )),
          Positioned(
              bottom: 250,
              right: 150,
              child: Transform.rotate(
                angle: 8,
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 247, 32, 17),
                        Color.fromARGB(255, 245, 233, 56),
                        Color.fromARGB(255, 158, 224, 42),

                        // Color(0xff744ff9),
                        // Color(0xff8369de),
                        // Color(0xff8da0cb)
                      ])),
                ),
              )),
          // Center(
          //   child: ClipRRect(
          //     borderRadius: const BorderRadius.all(Radius.circular(25)),
          //     child: BackdropFilter(
          //       filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          //       child: Container(
          //         width: 450,
          //         height: 250,
          //         decoration: BoxDecoration(
          //             color: Colors.grey.withOpacity(0.1),
          //             borderRadius:
          //                 const BorderRadius.all(Radius.circular(25))),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

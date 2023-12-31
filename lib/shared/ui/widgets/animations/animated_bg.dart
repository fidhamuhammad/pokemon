// import 'package:animated_background/animated_background.dart';
// import 'package:flutter/material.dart';

// class CustomAnimatedBackground extends StatefulWidget {
//   CustomAnimatedBackground({Key? key}) : super(key: key);

//   @override
//   State<CustomAnimatedBackground> createState() => _CustomAnimatedBackgroundState();
// }

// class _CustomAnimatedBackgroundState extends State<CustomAnimatedBackground> 
// with SingleTickerProviderStateMixin{
//   ParticleOptions particles = const ParticleOptions(
//     baseColor: Colors.cyan,
//     spawnOpacity: 0.0,
//     opacityChangeRate: 0.25,
//     minOpacity: 0.1,
//     maxOpacity: 0.4,
//     particleCount: 70,
//     spawnMaxRadius: 15.0,
//     spawnMaxSpeed: 100.0,
//     spawnMinSpeed: 30,
//     spawnMinRadius: 7.0,
//   );
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBackground(
//       child: , 
//       vsync: this,
//       behaviour: RandomParticleBehaviour(options: particles)
//       );
//   }
// }
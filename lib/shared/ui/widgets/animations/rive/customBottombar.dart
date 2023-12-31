// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';

// class CustomBottomBar extends StatefulWidget {
//   const CustomBottomBar({super.key});

//   @override
//   State<CustomBottomBar> createState() => _CustomBottomBarState();
// }

// SMIBool? status;

// void onRiveIconInit(Artboard artboard) {
//   final controller =
//       StateMachineController.fromArtboard(artboard, 'CHAT_Interactivity');
//   artboard.addController(controller!);
//   status = controller.findInput<bool>('active') as SMIBool;
// }

// void onTabPress() {
//   status!.change(true);
//   Future.delayed(const Duration(seconds: 1), () {
//     status!.change(false);
//   });
// }

// class _CustomBottomBarState extends State<CustomBottomBar> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Container(
//           margin: const EdgeInsets.fromLTRB(24, 0, 24, 8),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.purple,
//           borderRadius: BorderRadius.circular(24),
//           // boxShadow: [
//           //   BoxShadow(
//           //       color: Colors.pink, blurRadius: 20, offset: const Offset(0, 20))
//           // ],
//         ),
//         child: CupertinoButton(
//           padding: EdgeInsets.all(12),
//           onPressed: onTabPress,
//           child: SizedBox(
//             height: 36,
//             width: 36,
//             child: RiveAnimation.asset(
//               'assets/Rive.riv',
//               stateMachines: [
//                 'CHAT_Interactivity',
//               ],
//               artboard: 'CHAT',
//               //  onInit: (artboard) {
//               //    RiveUtlis.getRiveController(artboard);
//               //  },
//               onInit: onRiveIconInit,
//             ),
//           ),
//         ),
//       ),
//     ));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class VerificationScreen extends StatefulWidget {
//   const VerificationScreen({Key? key}) : super(key: key);

//   @override
//   State<VerificationScreen> createState() => _VerificationScreenState();
// }

// class _VerificationScreenState extends State<VerificationScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
//           child: Column(
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Icon(
//                     Icons.arrow_back,
//                     color: Colors.black38,
//                     size: 32,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 height: 200,
//                 width: 200,
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 218, 218, 209),
//                   shape: BoxShape.circle,
//                 ),
                
//               ),
//               SizedBox(height: 20,),
//               Text('Registerion',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//               ),
//               ),
//               SizedBox(height: 20,),
//               Text('add your email address',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black38,
//               ),
//               textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

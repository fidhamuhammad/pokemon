import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Heading extends StatelessWidget {
  final String text;
  
  final double size;
  
  final FontWeight weight;
  
  final Color color;

  const Heading({
    required this.text,
    required this.size,
    required this.weight,
    required this.color,
    super.key,
  
  });

  @override
  Widget build(BuildContext context) {
    return Text(
text,
style: GoogleFonts.lora(
  color: color,
  fontWeight: weight,
  fontSize: size,
),



// style: 
// TextStyle(
//   color: color,
//   fontWeight: weight,
//   fontSize: size,
//   fontFamily: 'circular',
// ),
    );
  }
}
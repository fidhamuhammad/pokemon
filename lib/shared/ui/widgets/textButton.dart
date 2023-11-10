import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
   final String label;
  final double width;
  final FontWeight? weight;
  final void Function() onPressed;

   const MyTextButton({
    required this.onPressed,
    required this.label,
    required this.width,
    this.weight,
    super.key});
 
   @override
   Widget build(BuildContext context) {
     return  SizedBox(
       width: width,
      child: TextButton(
        
        onPressed: onPressed,
        child: Text(label,
        style: TextStyle(
          fontSize: 20,
          fontWeight: weight??FontWeight.w100,
          color: Colors.white,
          
        ),
        ),
        
      
        
      ),
    );
   }
 }
 
 

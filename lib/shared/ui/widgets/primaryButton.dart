import 'package:app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/utils/textsize.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final double width;
  final void Function() onPressed;
  

  const PrimaryButton({
    required this.label,
    required this.onPressed,
    required this.width,
    super.key,  
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        
        onPressed: onPressed,
        child: Text(label,
        style:
        GoogleFonts.lora(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        )
        //  TextStyle(
        //   fontSize: 20,
        //   fontWeight: FontWeight.bold,
        // ),
        ),
        
      
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          backgroundColor: const Color.fromARGB(255, 229, 175, 12),
 
          padding: primaryButtonPadding,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/shared/utils/textsize.dart';
import 'package:google_fonts/google_fonts.dart';

class PokeTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final IconData prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const PokeTextFormField({
    Key? key,
    this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: TextStyle(
        fontFamily: 'circular',
        color: FormColors.fieldTextcolor,
        fontSize: 18,
      ),
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: GoogleFonts.lora(
            color: Colors.white.withOpacity(0.5),
            fontSize: 18,
            fontWeight: FontWeight.normal),
        //  TextStyle(
        //   fontFamily: 'circular',
        //   fontSize: 18,
        //   color: Colors.white.withOpacity(0.5),
        // ),
        filled: true,
        fillColor: FormColors.fieldBackgroundColor.withOpacity(0.09),
        errorStyle: GoogleFonts.lora(color: Colors.redAccent),
        //  TextStyle(color: Colors.red), // Style for error message
        errorMaxLines: 1,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(fieldBorderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(fieldBorderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            // color: AppTheme.primaryColor,
            color: Colors.redAccent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(fieldBorderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            // color: AppTheme.primaryColor,
            color: Colors.redAccent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(fieldBorderRadius),
        ),
        contentPadding: fieldPadding,
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:app/theme/app_theme.dart';
// import 'package:app/shared/utils/textsize.dart';

// class PokeTextFormField extends StatelessWidget {
//   final TextEditingController controller;
//   final String labelText;
//   final IconData prefixIcon;
//   final bool obscureText;
//   final String? Function(String?)? validator;

//   const PokeTextFormField({
//     Key? key,
//     required this.controller,
//     required this.labelText,
//     required this.prefixIcon,
//     this.obscureText = false,
//     this.validator,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       validator: validator,
//       style: TextStyle(
//         fontFamily: 'circular',
//         color: FormColors.fieldTextcolor,
//         fontSize: 18,
//       ),
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         labelText: labelText,
//         labelStyle: TextStyle(
//           fontFamily: 'circular',
//           fontSize: 18,
//           color: Colors.white.withOpacity(0.4),
//         ),
//         filled: true,
//         fillColor: FormColors.fieldBackgroundColor.withOpacity(0.09),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: BorderRadius.circular(fieldBorderRadius),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: AppTheme.primaryColor,
//             width: 2,
//           ),
//           borderRadius: BorderRadius.circular(fieldBorderRadius),
//         ),
//         contentPadding: fieldPadding,
//         prefixIcon: Icon(
//           prefixIcon,
//           color: Colors.white.withOpacity(0.4),
//         ),
//       ),
//     );
//   }
// }

 

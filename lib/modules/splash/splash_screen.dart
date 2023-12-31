import 'package:animated_background/animated_background.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/modules/authentication/login/login.dart';
import 'package:app/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorizeColors = [
  Colors.amberAccent,
  Colors.blue,
  Color.fromARGB(255, 130, 207, 158),
  Colors.red,
];


class PokeSplashScreen extends StatefulWidget {
  const PokeSplashScreen({super.key});

  @override
  State<PokeSplashScreen> createState() => _PokeSplashScreenState();
}

class _PokeSplashScreenState extends State<PokeSplashScreen>
    with TickerProviderStateMixin {
  int _lineCount = 30; // Adjust the number of racing lines as needed

  void changeScreen() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.push(
            this.context,
            MaterialPageRoute(
              builder: (context) => 
              // LoginScreen(),
              HomePage(),
            ));
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 250, 248),
      body: Center(
        child: SizedBox(
          width: 300.0,
          child: Center(
            child: 
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'Pokedex',
                  textStyle: TextStyle(
                    fontFamily: GoogleFonts.lora().fontFamily,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: colorizeColors,
                ),
                
              ],
              isRepeatingAnimation: true,
              // onTap: () {
              //   print("Tap Event");
              // },
            ),
          ),
        ),
      
        // Text(
        //   'Pokedex',
        //   style: GoogleFonts.lora(
        //     textStyle:  TextStyle(
        //       fontSize: 40,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.amberAccent
        //       )
        //   )
        // ),
      ),

      
    );
  }
}

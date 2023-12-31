import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/modules/news_list/view_news_list.dart';
import 'package:app/shared/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
// import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

const colorizeColors = [
  Color.fromARGB(255, 169, 164, 89),
  Colors.blue,
  Color.fromARGB(255, 130, 207, 158),
  Color.fromARGB(255, 54, 244, 222),
];

class CustomeSliverPadding extends StatelessWidget {
  const CustomeSliverPadding({Key? key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding( 
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 100,
              color: Colors.blueAccent.withOpacity(0.02),        
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'PokeNews',
                        textStyle: TextStyle(
                          fontFamily: GoogleFonts.lora().fontFamily,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        colors: colorizeColors,
                      ),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsListScreen(),
                          ));
                    },
                  ),
                  // hSpace(-10),
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => NewsListScreen(),
                  //         ));
                  //   },
                  //   child: Text(
                  //     'Click here to see!',
                  //     style: TextStyle(
                  //       fontFamily: GoogleFonts.lora().fontFamily,
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      );
  }
}

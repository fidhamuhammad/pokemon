import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PokedexAppBar extends StatefulWidget {
  const PokedexAppBar({super.key});

  @override
  State<PokedexAppBar> createState() => _PokedexAppBarState();
}

class _PokedexAppBarState extends State<PokedexAppBar> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Color _startColor;
  late Color _endColor;

  @override
  void initState() {
    super.initState();
    // _startColor = Colors.blue;
    // _endColor = Colors.purple;

    _startColor = Colors.blue;
    _endColor = Color.fromARGB(255, 134, 101, 252);

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      foregroundColor: Colors.black,
      titleSpacing: -10,
      backgroundColor: Colors.transparent,
      expandedHeight: 150,
      floating: true,
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          _controller.addListener(() {
            setState(() {}); // Trigger a rebuild when the animation value changes
          });

          final color = Color.lerp(_startColor, _endColor, _controller.value)!;

          return FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Stack(
              children: [
                // Overlay with rounded corners
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          // Color.fromARGB(255, 248, 189, 150),
                          Colors.black,
                          color,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(40.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            title: SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: GoogleFonts.lora().fontFamily,
                  color: Colors.white, // Text color
                  fontWeight: FontWeight.w700,
                ),
                child: 
              //   AnimatedTextKit(
              //     animatedTexts: [
              //       // TyperAnimatedText('Welcome to'),
              //       TyperAnimatedText('Pokedex'),
              //     ],
              //     isRepeatingAnimation: true,
              //   ),
              // ),
               AnimatedTextKit(
                              animatedTexts: [
                                WavyAnimatedText('Pokedex',
                                textStyle: TextStyle(
                                  fontFamily: GoogleFonts.lora().fontFamily,
                                  fontSize: 30,
                                  color: Colors.yellow
                                )
                                ),
                              ],
                              isRepeatingAnimation: true,
                              // totalRepeatCount: 5,
                            ),
              ),
            ),
            centerTitle: true,
          );
        },
      ),
      actions: [],
    );
  }
   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
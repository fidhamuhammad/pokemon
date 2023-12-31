import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSliverAppbar extends StatefulWidget {
  const CustomSliverAppbar({Key? key}) : super(key: key);

  @override
  State<CustomSliverAppbar> createState() => _CustomSliverAppbarState();
}

class _CustomSliverAppbarState extends State<CustomSliverAppbar>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Color _startColor;
  late Color _endColor;

  @override
  void initState() {
    super.initState();
    // _startColor = Colors.blue;
    // _endColor = Colors.purple;

   _startColor = Colors.blue;
    // const Color.fromARGB(255, 243, 226, 33);
    _endColor =
    //  Color.fromARGB(95, 210, 242, 151);
    Color.fromARGB(255, 134, 101, 252);

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
      expandedHeight: 200,
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
                          // Color.fromARGB(255, 248, 180, 150),
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
                  fontSize: 50.0,
                  fontFamily: GoogleFonts.ephesis().fontFamily,
                  color: Color.fromARGB(255, 242, 246, 250), // Text color
                  fontWeight: FontWeight.w700,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('Welcome to'),
                    TyperAnimatedText('Pokedex'),
                  ],
                  isRepeatingAnimation: true,
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










// import 'package:anim_search_bar/anim_search_bar.dart';
// import 'package:animated_background/animated_background.dart';
// import 'package:animated_search_bar/animated_search_bar.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CustomSliverAppbar extends StatefulWidget {
//   const CustomSliverAppbar({Key? key}) : super(key: key);

//   @override
//   State<CustomSliverAppbar> createState() => _CustomSliverAppbarState();
// }

// class _CustomSliverAppbarState extends State<CustomSliverAppbar>
//     with TickerProviderStateMixin {
      
//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       foregroundColor: Colors.black,
//       titleSpacing: -10,
//       backgroundColor: Colors.transparent, // Set a transparent background color
//       expandedHeight: 200,
//       floating: true,
//       pinned: true,
//       flexibleSpace: FlexibleSpaceBar(
//         collapseMode: CollapseMode.pin,
//         background: Stack(
//           children: [
//             // Background Image
//             // Positioned.fill(
//             //   child:
//             //   Image.asset(
//             //     'assets/images/poke.png',
//             //     fit: BoxFit.cover,
//             //   ),
//             // ),
//             // Overlay with rounded corners
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Color.fromARGB(255, 232, 248, 150),
//                       Color.fromARGB(255, 191, 152, 211),
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.vertical(
//                     bottom: Radius.circular(40.0),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         title: SizedBox(
//           width: 250.0,
//           child: DefaultTextStyle(
//             style: TextStyle(
//               fontSize: 50.0,
//               fontFamily: GoogleFonts.ephesis().fontFamily,
//               color: Colors.blue,
//               fontWeight: FontWeight.w700,
//             ),
//             child: AnimatedTextKit(
//               animatedTexts: [
//                 TyperAnimatedText('Welcome to'),
//                 TyperAnimatedText('Pokedex'),
//               ],
//               isRepeatingAnimation: true,
//             ),
//           ),
//         ),
//         centerTitle: true,
//       ),
//       actions: [],
//     );
//   }
// }





















// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CustomSliverAppbar extends StatelessWidget {
//   const CustomSliverAppbar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       foregroundColor: Colors.black,
//       titleSpacing: -10,
//       backgroundColor: Colors.yellow,
//       expandedHeight: 200,
//       floating: true,
//       pinned: true,
//       flexibleSpace: FlexibleSpaceBar(
//         collapseMode: CollapseMode.pin,
//         background: Container(
//           color: Colors.transparent, // Set your desired background color
//           child: Center(
//             child: DefaultTextStyle(
//               style: GoogleFonts.lora(
//                 textStyle: TextStyle(
//                     fontSize: 70.0,
//                     color: Colors.amberAccent,
//                     fontWeight: FontWeight.bold),
//               ),
//               child: SizedBox(
//                 width: 250.0,
//                 child: DefaultTextStyle(
//                   style: TextStyle(
//                     fontSize: 70.0,
//                     fontFamily: GoogleFonts.ephesis().fontFamily,
//                     color: Colors.blue,
//                     fontWeight: FontWeight.w700,
//                   ),
//                   child: Center(
//                     child: AnimatedTextKit(
//                       animatedTexts: [
//                         TyperAnimatedText('Welcome to'),
//                         TyperAnimatedText('Pokedex'),
//                       ],
//                       isRepeatingAnimation: true,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         title: Container(), // Empty container to hide the title
//         centerTitle: false,
//       ),
//     );
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CustomSliverAppbar extends StatefulWidget {
//   CustomSliverAppbar({Key? key}) : super(key: key);

//   @override
//   _CustomSliverAppbarState createState() => _CustomSliverAppbarState();
// }

// class _CustomSliverAppbarState extends State<CustomSliverAppbar> {
//   double changingHeight = 300;
//   double appBarHeight = 56.0; // Default AppBar height

//   bool appBarSearchShow = false;

//   final TextEditingController _filter = TextEditingController();

//   List<String> itemList = [];

//   @override
//   void initState() {
//     super.initState();

//     for (int count = 0; count < 50; count++) {
//       itemList.add("Item $count");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       backgroundColor: Colors.white,
//       expandedHeight: 300,
//       floating: false,
//       pinned: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           bottom: Radius.circular(20),
//         )
//       ),
//       flexibleSpace: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//           if (constraints.biggest.height == appBarHeight) {
//             appBarSearchShow = true;
//           } else {
//             appBarSearchShow = false;
//           }
//           return FlexibleSpaceBar(
//             collapseMode: CollapseMode.parallax,
//             titlePadding: EdgeInsets.only(bottom: 10),
//             centerTitle: true,
//             title: constraints.biggest.height != appBarHeight
//                 ? Container(
//                     constraints: BoxConstraints(minHeight: 30, maxHeight: 30),
//                     width: 220,
//                     decoration: BoxDecoration(
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.6),
//                           offset: const Offset(1.1, 1.1),
//                           blurRadius: 5.0,
//                         ),
//                       ],
//                     ),
//                     child: CupertinoTextField(
//                       controller: _filter,
//                       keyboardType: TextInputType.text,
//                       placeholder: 'Search',
//                       placeholderStyle:
//                       TextStyle(
//                         color: Color(0xffC4C6CC),
//                         fontSize: 14.0,
//                         fontFamily: GoogleFonts.lora().fontFamily,
//                       ),
//                       prefix: Padding(
//                         padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
//                         child: Icon(
//                           Icons.search,color: Colors.black,
//                           size: 14,
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8.0),
//                         color: Colors.white,
//                       ),
//                     ),
//                   )
//                 : Container(),
//             background: Container(
//               color: Colors.white,
//               margin: EdgeInsets.only(bottom: 30),
//               child: Image.asset(
//                 'assets/images/bgblue01.png',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

//       foregroundColor: Colors.black,
//       titleSpacing: -10,
//       backgroundColor: Colors.transparent,
//       expandedHeight: 200,
//       floating: true,
//       pinned: true,
//       flexibleSpace: FlexibleSpaceBar(
//         collapseMode: CollapseMode.pin,

//         background: Container(
//           decoration: BoxDecoration(),
//           color: Colors.transparent,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               _buildAnimatedText(),
//               SizedBox(height: 16),
//               _buildSearchBar(),
//             ],
//           ),
//         ),
//         title: Container(),
//         centerTitle: false,
//       ),
//     );
//   }

//   Widget _buildAnimatedText() {
//     return DefaultTextStyle(
//       style: GoogleFonts.lora(
//         textStyle: TextStyle(
//           fontSize: 70.0,
//           color: Colors.blueAccent,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       child: SizedBox(
//         width: 250.0,
//         child: DefaultTextStyle(
//           style: TextStyle(
//             fontSize: 70.0,
//             fontFamily: GoogleFonts.ephesis().fontFamily,
//             color: Colors.blue,
//             fontWeight: FontWeight.w700,
//           ),
//           child: Center(
//             child: AnimatedTextKit(
//               animatedTexts: [
//                 TyperAnimatedText('Welcome to'),
//                 TyperAnimatedText('Pokedex'),
//               ],
//               isRepeatingAnimation: true,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSearchBar() {
//     return Container(
//       padding: EdgeInsets.all(8.0),
//       child: TextField(
//         // Add your search logic here
//         onChanged: (query) {
//           // Implement your search logic
//         },
//         decoration: InputDecoration(
//           hintText: 'Search pokemon here..',
//           prefixIcon: Icon(Icons.search),
//           filled: true,
//           fillColor: FormColors.fieldBackgroundColor.withOpacity(0.4),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: AppTheme.primaryColor,
//               width: 2,
//             ),
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';

// class CustomSliverAppbar extends StatelessWidget {
//   const CustomSliverAppbar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       foregroundColor: Colors.white,
//       titleSpacing: -10,
//       backgroundColor: Colors.transparent,
//       // backgroundColor: Colors.purpleAccent,
//       expandedHeight: 200,
//       floating: true,
//       pinned: true,

//       flexibleSpace: FlexibleSpaceBar(
//         collapseMode: CollapseMode.pin,
//         background:
//             // Lottie.asset('assets/lotties/bird.json'),
//             Image.asset('assets/images/splash_logo.png', fit: BoxFit.cover),

//         title:

//             DefaultTextStyle(
//           style: GoogleFonts.lora(
//             textStyle: TextStyle(
//               fontSize: 40.0,
//               color: Colors.amberAccent,
//             ),
//           ),
//           child: AnimatedTextKit(
//             animatedTexts: [
//               TyperAnimatedText('Welcome to'),
//               TyperAnimatedText('Pokedex'),
//             ],
//             isRepeatingAnimation: true,
//           ),
//         ),

//         centerTitle: false, // Set this to false to left-align the title
//       ),
//     );
//   }
// }

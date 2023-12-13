import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/models/pokemon_summary.dart';
import 'package:app/shared/ui/canvas/white_pokeball_canvas.dart';
import 'package:app/shared/utils/image_utils.dart';
import 'package:app/theme/app_theme.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

class PokeItemWidget extends StatefulWidget {
  final PokemonSummary pokemon;
  final bool isFavorite;

  const PokeItemWidget({
    Key? key,
    required this.pokemon,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  State<PokeItemWidget> createState() => _PokeItemWidgetState();
}

class _PokeItemWidgetState extends State<PokeItemWidget> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    // Initialize isFavorite based on the provided prop
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GlassmorphicContainer(
      width: double.infinity,
      height: double.infinity,
      borderRadius: 15,
      blur: 10,
      alignment: Alignment.center,
      border: 2,
      linearGradient: LinearGradient(
        colors: [
          Colors.transparent, // Set the start color to transparent
          Colors.transparent, // Set the end color to transparent
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.2),
          Colors.white.withOpacity(0.1),
        ],
      ),
      child: Container(
        // Your existing content goes here
        decoration: BoxDecoration(
          color: AppTheme.getColors(context)
              .pokemonItem(widget.pokemon.types[0])
              .withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Stack(
              children: [
                Positioned(
                  bottom: -15,
                  right: -3,
                  child: Container(
                    child: CustomPaint(
                      size: Size(83, (83 * 1.0040160642570282).toDouble()),
                      painter: PokeballLogoPainter(
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 7, bottom: 3),
                    child: Container(
                      child: Hero(
                        tag: widget.isFavorite
                            ? "favorite-pokemon-image-${widget.pokemon.number}"
                            : "pokemon-image-${widget.pokemon.number}",
                        child: ImageUtils.networkImage(
                          url: widget.pokemon.thumbnailUrl,
                        ),
                      ),
                      height: 76,
                      width: 76,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, top: 8),
                    child: Text(
                      "#${widget.pokemon.number}",
                      // style:
                      //  TextStyle(
                      //   fontFamily: "CircularStd-Book",
                      //   fontSize: 14,
                      //   fontWeight: FontWeight.bold,
                      //   color: AppTheme.getColors(context)
                      //       .pokemonDetailsTitleColor
                      //       .withOpacity(0.6),
                      // ),
                      style: GoogleFonts.lora(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.pokemon.name,
                        // style: textTheme.bodyText1?.copyWith(
                        //     fontWeight: FontWeight.bold,
                        //     color: AppTheme.getColors(context)
                        //         .pokemonDetailsTitleColor),
                        style: GoogleFonts.lora(
                            color: Colors.white,
                            // fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: widget.pokemon.types
                            .map((type) => Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: Text(
                                        type,
                                        // style: textTheme.bodyText1?.copyWith(
                                        //   fontSize: 8,
                                        //   color: AppTheme.getColors(context)
                                        //       .pokemonDetailsTitleColor,
                                        // ),
                                        style: GoogleFonts.lora(
                                            color: Colors.white,
                                            fontSize: 8,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(38),
                                        color: AppTheme.getColors(context)
                                            .pokemonDetailsTitleColor
                                            .withOpacity(0.4)),
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:app/shared/models/pokemon_summary.dart';
// import 'package:app/shared/ui/canvas/white_pokeball_canvas.dart';
// import 'package:app/shared/utils/image_utils.dart';
// import 'package:app/theme/app_theme.dart';

// class PokeItemWidget extends StatelessWidget {
//   final PokemonSummary pokemon;
//   final bool isFavorite;

//   const PokeItemWidget(
//       {Key? key, required this.pokemon, this.isFavorite = false})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextTheme textTheme = Theme.of(context).textTheme;

//     return Container(
//       decoration: BoxDecoration(
//         color: AppTheme.getColors(context).pokemonItem(pokemon.types[0]),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(15),
//         child: Stack(
//           children: [
//             Positioned(
//               bottom: -15,
//               right: -3,
//               child: Container(
//                 child: CustomPaint(
//                   size: Size(
//                       83,
//                       (83 * 1.0040160642570282)
//                           .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//                   painter: PokeballLogoPainter(
//                     color: Colors.white.withOpacity(0.3),
//                   ),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomRight,
//               child: Padding(
//                 padding: EdgeInsets.only(right: 7, bottom: 3),
//                 child: Container(
//                   child: Hero(
//                     tag: isFavorite
//                         ? "favorite-pokemon-image-${pokemon.number}"
//                         : "pokemon-image-${pokemon.number}",
//                     child: ImageUtils.networkImage(
//                       url: pokemon.thumbnailUrl,
//                     ),
//                   ),
//                   height: 76,
//                   width: 76,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.topRight,
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 8, top: 8),
//                 child: Text(
//                   "#${pokemon.number}",
//                   style: TextStyle(
//                     fontFamily: "CircularStd-Book",
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: AppTheme.getColors(context)
//                         .pokemonDetailsTitleColor
//                         .withOpacity(0.6),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     pokemon.name,
//                     style: textTheme.bodyText1?.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: AppTheme.getColors(context)
//                             .pokemonDetailsTitleColor),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: pokemon.types
//                         .map((type) => Padding(
//                               padding: const EdgeInsets.only(top: 4),
//                               child: Container(
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 15, vertical: 5),
//                                   child: Text(
//                                     type,
//                                     style: textTheme.bodyText1?.copyWith(
//                                       fontSize: 8,
//                                       color: AppTheme.getColors(context)
//                                           .pokemonDetailsTitleColor,
//                                     ),
//                                   ),
//                                 ),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(38),
//                                     color: AppTheme.getColors(context)
//                                         .pokemonDetailsTitleColor
//                                         .withOpacity(0.4)),
//                               ),
//                             ))
//                         .toList(),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

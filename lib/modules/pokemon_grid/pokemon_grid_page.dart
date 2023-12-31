import 'dart:ui';

import 'package:app/modules/pokemon_grid/wishlist/wishlist.dart';
import 'package:app/shared/ui/widgets/gradient/continer_gradient.dart';
import 'package:app/shared/ui/widgets/sliver_appbar/pokedexappbar.dart';
import 'package:app/shared/ui/widgets/sliver_appbar/sliver_appbar.dart';
import 'package:app/shared/ui/widgets/sliver_appbar/sliver_box.dart';
import 'package:app/shared/utils/spacer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:app/modules/pokemon_grid/widgets/pokemon_grid.dart';
import 'package:app/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:app/shared/utils/app_constants.dart';

class PokemonGridPage extends StatefulWidget {
  const PokemonGridPage({Key? key}) : super(key: key);

  @override
  State<PokemonGridPage> createState() => _PokemonGridPageState();
}

class _PokemonGridPageState extends State<PokemonGridPage> {
  late PokemonStore _pokemonStore;

  @override
  void initState() {
    super.initState();
    _pokemonStore = GetIt.instance<PokemonStore>();
    _fetchPokemonData();
  }

  Future<void> _fetchPokemonData() async {
    await _pokemonStore.fetchPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 17, 37, 148),
      // extendBodyBehindAppBar: true,
      body: Stack(
        children: [
                   
          CustomGradientContainer(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomLeft,
            child: CustomScrollView(
              slivers: [
                PokedexAppBar(),
                // SliverSearch(),
                SliverToBoxAdapter(
                  child: hSpace(16),
                ),
                Observer(
                  builder: (_) {
                    if (_pokemonStore.pokemonsSummary == null) {
                      return SliverFillRemaining(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                          ],
                        ),
                      );
                    } else {
                      if (_pokemonStore.pokemonFilter.pokemonNameNumberFilter !=
                              null &&
                          _pokemonStore.pokemonsSummary!.isEmpty) {
                        return SliverToBoxAdapter(
                          child: Container(
                            height: 250,
                            width: 250,
                            child: Stack(
                              children: [
                                Center(
                                  child: Lottie.asset(
                                    AppConstants.pikachuLottie,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 30),
                                    child: Text(
                                      "${_pokemonStore.pokemonFilter.pokemonNameNumberFilter} was not found",
                                      style: GoogleFonts.lora(
                                        color: Colors.lime,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
            
                      return SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        sliver: PokemonGridWidget(pokemonStore: _pokemonStore),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: GlassContainer.clearGlass(
        height: 60,
        width: 60,
        color: Color.fromARGB(255, 190, 220, 245),
        borderRadius: BorderRadius.circular(30), // Half of the height or width
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavoritePage(),
              ),
            );
          },
          child: Icon(Icons.favorite,
              color: Colors.white), // Set the color as needed
          backgroundColor:
              Color.fromARGB(255, 144, 174, 235).withOpacity(0.03), // Set the background color as transparent
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Navigate to the "Favorites" page
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => FavouritesList(),
      //       ),
      //     );
      //   },
      //   child: Icon(Icons.favorite),
      // ),
    );
  }
}







// import 'dart:ui';

// import 'package:app/modules/pokemon_grid/favorites_list.dart';
// import 'package:app/shared/ui/widgets/sliver_appbar/sliver_appbar.dart';
// import 'package:app/shared/ui/widgets/textButton.dart';
// import 'package:app/shared/utils/spacer.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:get_it/get_it.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';
// import 'package:app/modules/pokemon_grid/widgets/pokemon_grid.dart';
// import 'package:app/shared/stores/pokemon_store/pokemon_store.dart';
// import 'package:app/shared/utils/app_constants.dart';

// class PokemonGridPage extends StatefulWidget {
//   const PokemonGridPage({super.key});

//   @override
//   State<PokemonGridPage> createState() => _PokemonGridPageState();
// }

// class _PokemonGridPageState extends State<PokemonGridPage> {
//   late PokemonStore _pokemonStore;

//   @override
//   void initState() {
//     super.initState();

//     _pokemonStore = GetIt.instance<PokemonStore>();

//     _fetchPokemonData();
//   }

//   Future<void> _fetchPokemonData() async {
//     await _pokemonStore.fetchPokemonData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final TextTheme textTheme = Theme.of(context).textTheme;

//     return Scaffold(
//       body: Stack(
//         children: [
//            // Background Image with Frosted Glass Overlay
//           Image.asset(
//             'assets/images/pokebg.png', // Replace with your image
//             height: double.infinity,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//            BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//             child: Container(
//               color: Colors.black.withOpacity(0.5), // Adjust the opacity as needed
//               height: double.infinity,
//               width: double.infinity,
//             ),
//           ),
//           CustomScrollView(
//             slivers: [
//               CustomSliverAppbar(),            
//               SliverToBoxAdapter(
                
//                 child: SizedBox(height: 16), // Add some space here
//               ),
//               Observer(
//                 builder: (_) {
//                   if (_pokemonStore.pokemonsSummary == null) {
//                     return SliverFillRemaining(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CircularProgressIndicator(),
//                         ],
//                       ),
//                     );
//                   } else {
//                     if (_pokemonStore.pokemonFilter.pokemonNameNumberFilter !=
//                             null &&
//                         _pokemonStore.pokemonsSummary!.isEmpty) {
//                       return SliverToBoxAdapter(
//                         child: Container(
//                           height: 250,
//                           width: 250,
//                           child: Stack(
//                             children: [
//                               Center(
//                                 child: Lottie.asset(
//                                   AppConstants.pikachuLottie,
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment.bottomCenter,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(bottom: 30),
//                                   child: Text(
//                                     "${_pokemonStore.pokemonFilter.pokemonNameNumberFilter} was not found",
//                                     // style: textTheme.bodyText1,
//                                      style: GoogleFonts.lora(
//                                         color: Colors.lime,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.normal
//                                       )
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
                          
//                         ),
//                       );
//                     }

//                     return SliverPadding(
//                       padding: EdgeInsets.symmetric(horizontal: 10),
//                       sliver: PokemonGridWidget(pokemonStore: _pokemonStore),
//                     );
//                   }
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }





// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:get_it/get_it.dart';
// import 'package:lottie/lottie.dart';
// import 'package:app/modules/pokemon_grid/widgets/pokemon_grid.dart';
// import 'package:app/shared/stores/pokemon_store/pokemon_store.dart';
// import 'package:app/shared/utils/app_constants.dart';

// class PokemonGridPage extends StatefulWidget {
//   PokemonGridPage({Key? key}) : super(key: key);

//   @override
//   _PokemonGridPageState createState() => _PokemonGridPageState();
// }

// class _PokemonGridPageState extends State<PokemonGridPage> {
//   late PokemonStore _pokemonStore;

//   @override
//   void initState() {
//     super.initState();

//     _pokemonStore = GetIt.instance<PokemonStore>();

//     _fetchPokemonData();
//   }

//   Future<void> _fetchPokemonData() async {
//     await _pokemonStore.fetchPokemonData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final TextTheme textTheme = Theme.of(context).textTheme;

//     return Observer(
//       builder: (_) {
//         if (_pokemonStore.pokemonsSummary == null) {
//           return SliverFillRemaining(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [CircularProgressIndicator()],
//             ),
//           );
//         } else {
//           if (_pokemonStore.pokemonFilter.pokemonNameNumberFilter != null &&
//               _pokemonStore.pokemonsSummary!.isEmpty) {
//             return SliverToBoxAdapter(
//               child: Container(
//                 height: 250,
//                 width: 250,
//                 child: Stack(
//                   children: [
//                     Center(
//                       child: Lottie.asset(
//                         AppConstants.pikachuLottie,
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Padding(
//                         padding: const EdgeInsets.only(bottom: 30),
//                         child: Text(
//                           "${_pokemonStore.pokemonFilter.pokemonNameNumberFilter} was not found",
//                           style: textTheme.bodyText1,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           }

//           return SliverPadding(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             sliver: PokemonGridWidget(pokemonStore: _pokemonStore),
//           );
//         }
//       },
//     );
//   }
// }

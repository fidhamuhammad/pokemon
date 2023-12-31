// import 'package:app/modules/pokemon_grid/wishlist/bloc/wishlist_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'bloc/wishlist_event.dart';
// import 'bloc/wishlist_state.dart';

// class FavoritePage extends StatefulWidget {
//   @override
//   _FavoritePageState createState() => _FavoritePageState();
// }

// class _FavoritePageState extends State<FavoritePage> {
//   late WishlistBloc _wishlistBloc;

//   @override
//   void initState() {
//     super.initState();
//     _wishlistBloc = WishlistBloc();
//     _wishlistBloc.add(FetchPokemon());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => _wishlistBloc,
//       child: BlocBuilder<WishlistBloc, WishlistState>(
//         builder: (context, state) {
//           if (state is PokemonLoaded) {
//             final pokemon = state.pokemon;

//             return AnimatedContainer(
//               duration: Duration(seconds: 2),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     const Color.fromARGB(255, 111, 185, 246),
//                     Color.fromARGB(255, 175, 196, 250),
//                   ],
//                   stops: [0.2, 0.7],
//                 ),
//               ),
//               child: ListView.builder(
//                 itemCount: 1,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(
//                       pokemon.name,
//                       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
//                     ),
//                     trailing: IconButton(
//                       icon: Icon(Icons.favorite, color: Colors.red.withOpacity(0.7)),
//                       onPressed: () {
//                         // Your logic to remove favorite
//                       },
//                     ),
//                   );
//                 },
//               ),
//             );
//           } else if (state is PokemonError) {
//             return Center(
//               child: Text('Error: ${state.message}'),
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _wishlistBloc.close();
//     super.dispose();
//   }
// }

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/modules/pokemon_grid/wishlist/bloc/wishlist_bloc.dart';
import 'package:app/modules/pokemon_grid/wishlist/bloc/wishlist_state.dart';
import 'package:app/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:app/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/wishlist_event.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late PokemonStore _pokemonStore;

  @override
  void initState() {
    final String email = context.read<AuthStatusProvider>().email;
    context.read<WishlistBloc>().add(FetchPokemon(email: email));
    super.initState();
    _pokemonStore = GetIt.instance<PokemonStore>();
    _pokemonStore
        .fetchPokemonData(); // Make sure to fetch data before displaying favorites
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText('Pokémon Wishlist',
                  textStyle: TextStyle(
                    fontFamily: GoogleFonts.lora().fontFamily,
                    fontSize: 30,
                    color: Colors.yellow,
                  )),
            ],
            isRepeatingAnimation: true,
          ),
        ),
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          final favoritePokemons = _pokemonStore.favoritesPokemonsSummary;

          if (state is PokemonLoaded) {
            return AnimatedContainer(
              duration: Duration(seconds: 2), // Adjust the duration as needed
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color.fromARGB(255, 111, 185, 246),
                    Color.fromARGB(255, 175, 196, 250)
                  ],
                  stops: [0.2, 0.7],
                ),
              ),
              child: ListView.builder(
                itemCount: state.favourite.length,
                itemBuilder: (context, index) {
                  final pokemon = favoritePokemons[index];

                  return ListTile(
                    title: Text(
                      pokemon.name,
                      style: GoogleFonts.lora(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)),
                    ),
                    // Add more information or widgets as needed
                    trailing: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red.withOpacity(0.7),
                      ),
                      onPressed: () {
                        // Unfavorite the Pokemon when the button is pressed
                        _pokemonStore.removeFavoritePokemon(pokemon.number);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${pokemon.name} removed from favorites',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

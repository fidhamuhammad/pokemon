// wishlist_bloc.dart
import 'dart:async';
import 'dart:convert';

import 'package:app/api.dart';
import 'package:app/shared/models/favourite.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:app/shared/models/pokemon.dart';
import 'package:flutter/material.dart';
import 'wishlist_event.dart';
import 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final Dio dio = Dio();

  WishlistBloc() : super(WishlistInitial(

  )){
    on<AddFavouriteEvent>(_addFavourites);
    on<RemoveFavouriteEvent>(_removeFavourites);
    on<FetchPokemon>(_fetchFavourites);

  }

 

  FutureOr<void> _addFavourites(AddFavouriteEvent event, Emitter<WishlistState> emit) async {
    try {
      final response = await dio.post('$baseUrl/wishlist/add', data: {'email':event.email, 'name': event.name});

      if (response.statusCode == 201) {
        // Assume you have another method to handle fetching the updated data
         emit (PokemonSuccess(message: 'Favorites added'));
      } else {
       emit (PokemonError(message: 'Failed to add favorite status'));
      }
    } catch (e) {
     emit(PokemonError(message: 'An error occurred'));
    }
  }

  FutureOr<void> _removeFavourites(RemoveFavouriteEvent event, Emitter<WishlistState> emit) async{
    try {
      final response = await dio.post('$baseUrl/wishlist/remove', data: {'email':event.email, 'name': event.name});

      if (response.statusCode == 201) {
        // Assume you have another method to handle fetching the updated data
         emit (PokemonSuccess(message: 'Favorites added'));
      } else {
       emit (PokemonError(message: 'Failed to add favorite status'));
      }
    } catch (e) {
     emit(PokemonError(message: 'An error occurred'));
    }
  }

  FutureOr<void> _fetchFavourites(FetchPokemon event, Emitter<WishlistState> emit) async{
    try {
      final response = await dio.post('$baseUrl/wishlist/', data: {'email':event.email,});

      if (response.statusCode == 201) {
        // Assume you have another method to handle fetching the updated data
         final data = favouritesFromJson(jsonEncode(response.data));
         emit (PokemonLoaded(favourite: data));
      } else {
       emit (PokemonError(message: 'Failed to add favorite status'));
      }
    } catch (e) {
     emit(PokemonError(message: 'An error occurred'));
    }
  }
}





 // @override
  // Stream<WishlistState> mapEventToState(WishlistEvent event) async* {
  //   if (event is FetchPokemon) {
  //     yield* _mapFetchPokemonToState();
  //   } else if (event is ToggleFavorite) {
  //     yield* _mapToggleFavoriteToState(event.pokemonNumber);
  //   }
  // }

  // Stream<WishlistState> _mapFetchPokemonToState() async* {
  //   try {
  //     final response = await dio.get('$baseUrl/pokemon/1');

  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> data = response.data;
  //       final Pokemon pokemon = Pokemon.fromJson(data);

  //       yield PokemonLoaded(pokemon: pokemon);
  //     } else {
  //       yield PokemonError(message: 'Failed to fetch Pokemon');
  //     }
  //   } catch (e) {
  //     yield PokemonError(message: 'An error occurred');
  //   }
  // }

  // Stream<WishlistState> _mapToggleFavoriteToState(String pokemonNumber) async* {
  //   try {
  //     final response = await dio.post('$baseUrl/user-favorites/', data: {'pokemonNumber': pokemonNumber});

  //     if (response.statusCode == 200) {
  //       // Assume you have another method to handle fetching the updated data
  //       yield* _mapFetchPokemonToState();
  //     } else {
  //       yield PokemonError(message: 'Failed to toggle favorite status');
  //     }
  //   } catch (e) {
  //     yield PokemonError(message: 'An error occurred');
  //   }
  // }








// // wishlist_bloc.dart
// import 'package:app/api.dart';
// import 'package:app/modules/pokemon_grid/wishlist/bloc/wishlist_state.dart';
// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:app/shared/models/pokemon.dart';
// import 'package:flutter/material.dart';

// part 'wishlist_event.dart';
 

// class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
//   final Dio dio = Dio(); // Use Dio for making HTTP requests

//   WishlistBloc() : super(WishlistInitial());

//   @override
//   Stream<WishlistState> mapEventToState(WishlistEvent event) async* {
//     if (event is FetchPokemon) {
//       yield* _mapFetchPokemonToState();
//     } else if (event is ToggleFavorite) {
//       yield* _mapToggleFavoriteToState(event.pokemonNumber);
//     }
//   }

//   Stream<WishlistState> _mapFetchPokemonToState() async* {
//     try {
//       // Make an HTTP request to fetch Pokemon data
//       final response = await dio.get('$baseUrl/pokemon/1');

//       if (response.statusCode == 200) {
//         // Parse the response body
//         final Map<String, dynamic> data = response.data;
//         final Pokemon pokemon = Pokemon.fromJson(data);

//         // Emit the PokemonLoaded state with the fetched Pokemon
//         yield PokemonLoaded(pokemon: pokemon);
//       } else {
//         // Handle errors
//         yield PokemonError(message: 'Failed to fetch Pokemon');
//       }
//     } catch (e) {
//       // Handle exceptions
//       yield PokemonError(message: 'An error occurred');
//     }
//   }

//   Stream<WishlistState> _mapToggleFavoriteToState(String pokemonNumber) async* {
//     try {
//       // Make an HTTP request to toggle favorite status
//       final response = await dio.post('$baseUrl/user-favorites/', data: {'pokemonNumber': pokemonNumber});

//       if (response.statusCode == 200) {
//         // Successful toggle, refetch Pokemon
//         yield* _mapFetchPokemonToState();
//       } else {
//         // Handle errors
//         yield PokemonError(message: 'Failed to toggle favorite status');
//       }
//     } catch (e) {
//       // Handle exceptions
//       yield PokemonError(message: 'An error occurred');
//     }
//   }
// }

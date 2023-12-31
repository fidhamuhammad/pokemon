import 'package:app/shared/models/favourite.dart';
import 'package:app/shared/models/pokemon.dart';
import 'package:equatable/equatable.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object?> get props => [];
}

class WishlistInitial extends WishlistState {}

class PokemonLoaded extends WishlistState {
  final List<Favourites> favourite;

  const PokemonLoaded({required this.favourite});

  @override
  List<Object?> get props => [favourite];
}

class PokemonSuccess extends WishlistState {
  final String message;

  const PokemonSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class PokemonError extends WishlistState {
  final String message;

  const PokemonError({required this.message});

  @override
  List<Object?> get props => [message];
}












// // wishlist_state.dart
 
// import 'package:app/shared/models/pokemon.dart';
// import 'package:equatable/equatable.dart';

// abstract class WishlistState extends Equatable {
//   const WishlistState();

//   @override
//   List<Object?> get props => [];
// }

// class WishlistInitial extends WishlistState {}

// class PokemonLoaded extends WishlistState {
//   final Pokemon pokemon;

//   const PokemonLoaded({required this.pokemon});

//   @override
//   List<Object?> get props => [pokemon];
// }

// class PokemonError extends WishlistState {
//   final String message;

//   const PokemonError({required this.message});

//   @override
//   List<Object?> get props => [message];
// }
















// part of 'wishlist_bloc.dart';

// @immutable
// sealed class WishlistState {}

// class WishlistInitial extends WishlistState {
//   @override
//   List<Object> get props => [];
// }

// class PokemonLoaded extends WishlistState {
//   final Pokemon pokemon;

//   // Remove the 'const' keyword from the constructor
//   PokemonLoaded({required this.pokemon});

//   @override
//   List<Object> get props => [pokemon];
// }

// class PokemonError extends WishlistState {
//   final String message;

//   // Remove the 'const' keyword from the constructor
//   PokemonError({required this.message});

//   @override
//   List<Object> get props => [message];
// }

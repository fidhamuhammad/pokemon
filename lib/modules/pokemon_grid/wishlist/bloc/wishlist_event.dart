// wishlist_event.dart
abstract class WishlistEvent {
  const WishlistEvent();
}

class FetchPokemon extends WishlistEvent {
  final String email;

  FetchPokemon({required this.email});

}

class AddFavouriteEvent extends WishlistEvent {
  final String name;
  final String email;

  AddFavouriteEvent({required this.name, required this.email});

}

class RemoveFavouriteEvent extends WishlistEvent {
  final String name;
  final String email;

  RemoveFavouriteEvent({required this.name, required this.email});

}


// class ToggleFavorite extends WishlistEvent {
//   final String pokemonNumber;

//   ToggleFavorite(this.pokemonNumber);

//   @override
//   List<Object?> get props => [pokemonNumber];
// }











// part of 'wishlist_bloc.dart';

// @immutable
// // sealed class WishlistEvent {}

// abstract class WishlistEvent {
//   WishlistEvent();

//   @override
//   List<Object?> get props => [];
// }

// class FetchPokemon extends WishlistEvent {}

// class ToggleFavorite extends WishlistEvent {
//   final String pokemonNumber;

//   ToggleFavorite(this.pokemonNumber);

//   @override
//   List<Object?> get props => [pokemonNumber];
// }

import 'package:app/modules/home/widgets/pokedex_grid.dart';
import 'package:app/modules/pokemon_grid/pokemon_grid_page.dart';
import 'package:app/modules/profile/user_profile_screen.dart';
import 'package:app/shared/ui/widgets/animations/rive/bottom_appbar.dart';
import 'package:app/shared/ui/widgets/animations/rive/customBottombar.dart';
import 'package:flutter/material.dart';

class PokegridSliver extends StatelessWidget {
  const PokegridSliver({Key? key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(2, 4, 2, 3),
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        childAspectRatio: 2.1,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PokemonGridPage(),
                ),
              );
            },
            child: PokeDexGrid(
              gridText: 'Pokedex',
              gridColor: Color(0xD0795548),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => UserProfileScreen(),
              //   ),
              // );
            },
            child: PokeDexGrid(
              gridText: 'Items',
              gridColor: Color(0xFFFB6C6C),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => CustomBottomBar(),
              //   ),
              // );
            },
            child: PokeDexGrid(
              gridText: 'Moves',
              gridColor: Color(0xFF7AC7FF),
            ),
          ),
          PokeDexGrid(
            gridText: 'Abilities',
            gridColor: Color(0xFFFFCE4B),
          ),
          PokeDexGrid(
            gridText: 'Locations',
            gridColor: Color(0xFFA8B91F),
          ),
          PokeDexGrid(
            gridText: 'Berries',
            gridColor: Color(0xFF9F5BBA),
          ),
        ],
      ),
    );
  }
}











// import 'package:app/modules/home/widgets/pokedex_grid.dart';
// import 'package:app/modules/pokemon_grid/pokemon_grid_page.dart';
// import 'package:app/modules/profile/user_profile_screen.dart';
// import 'package:flutter/material.dart';

// class PokegridSliver extends StatelessWidget {
//   const PokegridSliver({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return  SliverPadding(
//                     padding: EdgeInsets.fromLTRB(2, 4, 2, 3),
//                     sliver: SliverGrid.count(
//                       crossAxisCount: 2,
//                       childAspectRatio: 2.1,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => PokemonGridPage()));
//                           },
//                           child: PokeDexGrid(
//                             gridText: 'Pokedex',
//                              gridColor: Color(0xD0795548),
//                             // gridColor: Color(0xFF48D0B0),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         UserProfileScreen()));
//                           },
//                           child: PokeDexGrid(
//                             gridText: 'Items',
//                             gridColor: Color(0xFFFB6C6C),
//                           ),
//                         ),
//                         PokeDexGrid(
//                           gridText: 'Moves',
//                           gridColor: Color(0xFF7AC7FF),
//                         ),
//                         PokeDexGrid(
//                           gridText: 'Abilities',
//                           // gridColor: Color(0xFFA7A877),
//                           gridColor: Color(0xFFFFCE4B),
//                         ),
//                         PokeDexGrid(
//                             gridText: 'Locations',
//                             gridColor: Color(0xFFA8B91F)
//                             //  Color(0xD0795548),
//                             ),
//                         PokeDexGrid(
//                           gridText: 'Berries',
//                           gridColor: Color(0xFF9F5BBA),
//                         ),
//                       ],
//                     ),
//                   )
//   }
// }



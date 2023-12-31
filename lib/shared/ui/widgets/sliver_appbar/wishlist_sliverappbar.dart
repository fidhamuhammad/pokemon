import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistSliverAppbar extends StatelessWidget {
  const WishlistSliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
             titleSpacing: -10,
                backgroundColor: Colors.transparent,
                expandedHeight: 100,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  // background: Image.asset(
                  //   'assets/images/poke.png',
                  //   fit: BoxFit.cover,
                  // ),
                  title: Text(
                    // 'Favouraite pokedex',
                    'Wish List',
                    style: GoogleFonts.lora(                       
                      textStyle: TextStyle(
                        color: Colors.amber.withOpacity(0.9),
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                      )
                    ),
                  ),
                  centerTitle:
                      true, // Set this to false to left-align the title
                ),
    );
  }
}
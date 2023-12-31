import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:app/shared/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliverSearch extends StatefulWidget {
  const SliverSearch({super.key});

  @override
  State<SliverSearch> createState() => _SliverSearchState();
}

class _SliverSearchState extends State<SliverSearch> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.blue.withOpacity(0.02),
        // width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // AnimatedProfileIcon(),
            // wSpace(50),
            AnimSearchBar(
              width: 400, 
              textController: _searchController, 
              onSuffixTap: (){
                setState(() {
                  _searchController.clear();
                });
              }, 
              color: Color.fromARGB(255, 175, 193, 252).withOpacity(0.05
              ),
              rtl: true,
              onSubmitted: (String value) {
                debugPrint("onSubmitted value: " + value);
              },
              textFieldIconColor: Colors.black,
              helpText: 'search pokemon..',style: TextStyle(fontFamily: GoogleFonts.lora().fontFamily)
             
              // autoFocus: true,
              // closeSearchOnSuffixTap: true,
              // animationDurationInMilli: 500,
               
              )
          ],
        ),
      ),
    );
  }
}
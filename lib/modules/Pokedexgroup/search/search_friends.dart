import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FriendsList extends StatefulWidget {
  const FriendsList({Key? key}) : super(key: key);

  @override
  State<FriendsList> createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearchClicked = false;

  String searchText = '';
  List<String> searchTerms = [
    "Roy",
    "Rahan",
    "Kim",
    "Maha",
    "Haml",
    "Baesil",
    "Pawn",
    "Sam"
  ];

  List<String> filterdItems = [];

  @override
  void initState() {
    super.initState();
    filterdItems = List.from(searchTerms);
  }

  void _onSearchChanged(String value) {
    setState(() {
      searchText = value;
      myFilterItems();
    });
  }

  void myFilterItems() {
    if (searchText.isEmpty) {
      filterdItems = List.from(searchTerms);
    } else {
      filterdItems = searchTerms
          .where(
              (items) => items.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 217, 173, 237),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: isSearchClicked
            ? Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                      hintStyle: TextStyle(color: Colors.black54),
                      border: InputBorder.none,
                      hintText: 'Search Your PokeFriends..'),
                ))
            : const Text('Search Your Poke Friends'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchClicked = !isSearchClicked;
                if (!isSearchClicked) {
                  _searchController.clear();
                  myFilterItems();
                }
              });
            },
            icon: Icon(isSearchClicked ? Icons.close : Icons.search),
          )
        ],
      ),
      body: Stack(
        children: [Positioned(
                  top: 130,
                  left: 220,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          // Color.fromARGB(255, 247, 32, 17),
                          // Color.fromARGB(255, 112, 243, 212),
                          // // Color.fromARGB(255, 245, 233, 56),
                          // Color.fromARGB(255, 158, 224, 42),
                          Color(0xff744ff9),
                          Color(0xff8369de),
                          Color(0xff8da0cb)
                        ])),
                  )),
              Positioned(
                  bottom: 250,
                  right: 150,
                  child: Transform.rotate(
                    angle: 8,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [
                            // Color.fromARGB(255, 247, 32, 17),
                            // Color.fromARGB(255, 245, 233, 56),
                            // Color.fromARGB(255, 158, 224, 42),

                            Color(0xff744ff9),
                            Color(0xff8369de),
                            Color(0xff8da0cb)
                          ])),
                    ),
                  )),
              Positioned(
                  top: 600,
                  left: 250,
                  child: Transform.rotate(
                    angle: 8,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [
                            // Color.fromARGB(255, 247, 32, 17),
                            // Color.fromARGB(255, 245, 233, 56),
                            // Color.fromARGB(255, 158, 224, 42),

                            Color(0xff744ff9),
                            Color(0xff8369de),
                            Color(0xff8da0cb)
                          ])),
                    ),
                  )),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.black
                      .withOpacity(0.08), // Adjust the opacity as needed
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
         SingleChildScrollView(
          child: Container(
            height: _deviceHeight,
            width: _deviceWidth,
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     fit: BoxFit.cover,
            //     image: AssetImage('assets/images/pokeforest02.png'),
            //   ),
            // ),
            child: ListView.builder(
                itemCount: filterdItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      filterdItems[index],
                      style: 
                      GoogleFonts.lora(
                        textStyle: TextStyle(color: Colors.black),
                      )
                    ),
                  );
                }),
          ),
        ),
              ],
      ),
    );
  }
}

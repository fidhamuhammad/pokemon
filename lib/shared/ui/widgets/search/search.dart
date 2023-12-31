import 'package:app/modules/Pokedexgroup/group.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearchClicked = false;

   List<Group> groups = [
    Group(name: 'Team Poke'),
    Group(name: 'Bulbasaur'),
    Group(name: 'Ivysaur'),
    Group(name: 'charizad'),
    Group(name: 'squirtle'),
  ];

  List<Group> filteredGroups = [];

 @override
  void initState() {
    super.initState();
    filteredGroups.addAll(groups);
  }

  void _onSearchChanged(String value) {
    setState(() {
      filteredGroups = groups
          .where(
              (group) => group.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
  

  @override
  Widget build(BuildContext context) {
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
     extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar:
          AppBar(
            backgroundColor: Colors.transparent,
        centerTitle: true,
        title: isSearchClicked
            ? Container(
                height: 40,
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
                      hintText: 'Search Your PokeGroups..'),
                )
                )
            : const Text('Search Your PokeGroups'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchClicked = !isSearchClicked;
                if (!isSearchClicked) {
                  _searchController.clear();
                }
              });
            },
            icon: Icon(isSearchClicked ? Icons.close : Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(      
        child: Container(
        height: _deviceHeight,
        width: _deviceWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/pokeforest02.png'),
          ),
        ),
          child: ListView.builder(
            itemCount: filteredGroups.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filteredGroups[index].name,
                style: GoogleFonts.lora(
                  textStyle: TextStyle(
                    color: Colors.white
                  )
                ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}








 
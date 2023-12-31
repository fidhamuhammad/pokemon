import 'dart:convert';
import 'dart:ui';

import 'package:app/api.dart';
import 'package:app/shared/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Group {
  final String name;

  Group({required this.name});
}

class GroupSearchScreen extends StatefulWidget {
  const GroupSearchScreen({Key? key}) : super(key: key);

  @override
  State<GroupSearchScreen> createState() => _GroupSearchScreenState();
}

class _GroupSearchScreenState extends State<GroupSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _groupNameController = TextEditingController();
  bool isSearchClicked = false;

  List<Group> groups = []; // List is removed as it is fetched from the API
  List<Group> filteredGroups = [];

  @override
  void initState() {
    super.initState();
    _fetchGroups(); // Fetch groups when the screen initializes
  }

  void _onSearchChanged(String value) {
    setState(() {
      filteredGroups = groups
          .where(
              (group) => group.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  Future<void> _fetchGroups() async {
    try {
      // Replace 'https://your-api-url.com/groups' with your actual API endpoint for fetching groups
      final response = await http.get(Uri.parse('$baseUrl/searchgroups'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          groups = data.map((group) => Group(name: group['name'])).toList();
          filteredGroups.addAll(groups);
        });
      } else {
        // Handle the error when fetching groups
        print('Failed to fetch groups: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or other errors
      print('Error fetching groups: $e');
    }
  }

  Future<void> _createGroup(String groupName) async {
    try {
      // Replace 'https://your-api-url.com/createGroup' with your actual API endpoint for creating groups
      final response = await http.post(
        Uri.parse('$baseUrl/creategroup'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'name': groupName}),
      );

      if (response.statusCode == 200) {
        // Group created successfully, you can update the UI or perform other actions
        print('Group created successfully');
        // After creating a group, refetch the groups to update the list
        _fetchGroups();
      } else {
        // Failed to create group, handle the error
        print('Failed to create group: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or other errors
      print('Error creating group: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromARGB(255, 212, 192, 247),
      appBar: AppBar(
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
                ))
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
      body: Stack(
        children: [
          Positioned(
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
            child: Column(
              children: [
                hSpace(_deviceWidth * 0.25),
        
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: TextField(
                //     controller: _groupNameController,
                //     decoration: InputDecoration(
                //       labelText: 'Enter Group Name',
                //       labelStyle: GoogleFonts.lora(
                //         textStyle: TextStyle(color: Colors.white),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.white),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.white),
                //       ),
                //     ),
                //   ),
                // ),
                // ElevatedButton(
                //   onPressed: () {
                //     _createGroup(_groupNameController.text);
                //   },
                //   child: Text('Create Group'),
                // ),
        
                RawMaterialButton(
                  onPressed: () {
                    _createGroup(_groupNameController.text);
                  },
                  shape: CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.blue.withOpacity(0.07), // Change the color as needed
                  padding: EdgeInsets.all(
                      35.0), // Adjust the value to control the size
                  child: Column(
                    children: [
                      Icon(Icons.group_add,color: Colors.white,),
                      Text(
                        'Create Group',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
        
                hSpace(16),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredGroups.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        filteredGroups[index].name,
                        style: GoogleFonts.lora(
                          textStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Group {
//   final String name;

//   Group({required this.name});
// }

// class GroupSearchScreen extends StatefulWidget {
//   const GroupSearchScreen({Key? key}) : super(key: key);

//   @override
//   State<GroupSearchScreen> createState() => _GroupSearchScreenState();
// }

// class _GroupSearchScreenState extends State<GroupSearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   bool isSearchClicked = false;

//   List<Group> groups = [
//     Group(name: 'Team Poke'),
//     Group(name: 'Bulbasaur'),
//     Group(name: 'Ivysaur'),
//     Group(name: 'charizad'),
//     Group(name: 'squirtle'),
//   ];

//   List<Group> filteredGroups = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredGroups.addAll(groups);
//   }

//   void _onSearchChanged(String value) {
//     setState(() {
//       filteredGroups = groups
//           .where(
//               (group) => group.name.toLowerCase().contains(value.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _deviceHeight = MediaQuery.of(context).size.height;
//     final _deviceWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       backgroundColor: Colors.transparent,
//       appBar:
//           AppBar(
//             backgroundColor: Colors.transparent,
//         centerTitle: true,
//         title: isSearchClicked
//             ? Container(
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.5),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: TextField(
//                   controller: _searchController,
//                   onChanged: _onSearchChanged,
//                   decoration: const InputDecoration(
//                       contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
//                       hintStyle: TextStyle(color: Colors.black54),
//                       border: InputBorder.none,
//                       hintText: 'Search Your PokeGroups..'),
//                 ))
//             : const Text('Search Your PokeGroups'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               setState(() {
//                 isSearchClicked = !isSearchClicked;
//                 if (!isSearchClicked) {
//                   _searchController.clear();
//                 }
//               });
//             },
//             icon: Icon(isSearchClicked ? Icons.close : Icons.search),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(      
//         child: Container(
//         height: _deviceHeight,
//         width: _deviceWidth,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage('assets/images/pokeforest02.png'),
//           ),
//         ),
//           child: ListView.builder(
//             itemCount: filteredGroups.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(filteredGroups[index].name,
//                 style: GoogleFonts.lora(
//                   textStyle: TextStyle(
//                     color: Colors.white
//                   )
//                 ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

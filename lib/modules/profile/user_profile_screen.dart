import 'dart:ui';

import 'package:app/modules/Pokedexgroup/group.dart';
import 'package:app/modules/home/home_page.dart';
import 'package:app/modules/pokemon_grid/wishlist/wishlist.dart';
import 'package:app/modules/profile/bloc/profile_bloc.dart';
import 'package:app/modules/Pokedexgroup/search/search_friends.dart';
import 'package:app/modules/Pokedexgroup/group.dart';
import 'package:app/shared/ui/widgets/glassEffects/glass.dart';
import 'package:app/shared/ui/widgets/primaryButton.dart';
import 'package:app/shared/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

final advancedDrawerController = AdvancedDrawerController();

class _UserProfileScreenState extends State<UserProfileScreen> {
  late ProfileBloc _profileBloc;
  late ImagePicker _imagePicker;
  late double _deviceHeight;
  late double _deviceWidth;

  @override
  void initState() {
    super.initState();
    _profileBloc = ProfileBloc();
    _imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => _profileBloc,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return AdvancedDrawer(
            openRatio: 0.55,
            openScale: 0.30,
            controller: advancedDrawerController,
            backdropColor: Colors.transparent,
            rtlOpening: false,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 500),
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: _appBar(),
              body: _profilePage(),
            ),
            drawer: SafeArea(
              child: Container(
                child: ListTileTheme(
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 228.0,
                        height: 228.0,
                        margin: const EdgeInsets.only(
                          top: 24.0,
                          bottom: 64.0,
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          shape: BoxShape.circle,
                        ),
                        child:
                        // ColoredBox(color: Color.fromARGB(255, 86, 28, 194).withOpacity(0.08))
                         Image.asset(
                          'assets/images/pokeavatar.png',
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        tileColor: Colors.white.withOpacity(0.06),
                        leading: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        title: Text('Home'),
                      ),
                      ListTile(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => FavouriteScreen(),
                          //   ),
                          // );
                        },
                        tileColor: Colors.white.withOpacity(0.06),
                        leading: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        title: Text('Favourites'),
                      ),
                      ListTile(
                        tileColor: Colors.white.withOpacity(0.06),
                        leading: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        title: Text('Settings'),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FriendsList(),
                              ));
                        },
                        tileColor: Colors.white.withOpacity(0.06),
                        leading: Icon(
                          Icons.sensor_occupied_outlined,
                          color: Colors.white,
                        ),
                        title: Text('Search friends'),
                      ),
                      // ListTile(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => GlassBcakground(),
                      //         ));
                      //   },
                      //   tileColor: Colors.white.withOpacity(0.06),
                      //   leading: Icon(
                      //     Icons.search,
                      //     color: Colors.white,
                      //   ),
                      //   title: Text('Search Group'),
                      // ),
                       ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GroupSearchScreen(),
                              ));
                        },
                        tileColor: Colors.white.withOpacity(0.06),
                        leading: Icon(
                          Icons.group_add_rounded,
                          color: Colors.white,
                        ),
                        title: Text('Create Group'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void drawerControl() {
    advancedDrawerController.showDrawer();
  }

  @override
  void dispose() {
    _profileBloc.close();
    super.dispose();
  }

  PreferredSizeWidget _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Profile', style: 
        GoogleFonts.lora(
          textStyle: TextStyle(
            color: Colors.white
          )
        ),),
        leading: IconButton(
          onPressed: () {
            drawerControl();
          },
          icon: Icon(Icons.menu_sharp, color: Colors.white,),
        ),
      ),
    );
  }

  Widget _profilePage() {
    return Stack(
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
                      .withOpacity(0.4), // Adjust the opacity as needed
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
        SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          decoration: BoxDecoration(
            // image: DecorationImage(
            //   fit: BoxFit.cover,
            //   image: AssetImage('assets/images/pokeforest02.png'),
            // ),
            // color: Color.fromARGB(255, 43, 19, 64)
      
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hSpace(_deviceHeight * 0.03),
              _avatar(),
              _changeAvatarButton(),
              hSpace(30),
              _nameTile(),
              hSpace(30),
              _emailprofileTile(),
              hSpace(20),
              _phoneNumber(),
              hSpace(20),
              _descriptionBio(),
              hSpace(20),
              _saveProfileChangeButton(),
            ],
          ),
        ),
      ),
      ],
    );
  }

  Widget _avatar() {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('assets/images/pokeavatar.png'),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Icon(
            Icons.add_a_photo_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget _changeAvatarButton() {
    return TextButton(
      onPressed: _pickImage,
      child: Text(
        'Change Avatar',
        style: GoogleFonts.lora(color: Colors.white, fontSize: 15),
      ),
    );
  }

   

  Widget _nameTile() {
    return ListTile(
      tileColor: Colors.white.withOpacity(0.06),
      leading: Icon(
        Icons.person,
        color: Colors.white,
      ),
      title: TextFormField(
        decoration: InputDecoration.collapsed(
          hintText: 'Name',
          hintStyle: GoogleFonts.lora(
            color: Colors.white,
          ),
        ),
        maxLines: null,
      ),
    );
  }

  Widget _emailprofileTile() {
    return ListTile(
      tileColor: Colors.white.withOpacity(0.06),
      leading: Icon(
        Icons.email,
        color: Colors.white,
      ),
      title: Text('email'),
    );
  }

  Widget _descriptionBio() {
    return ListTile(
      tileColor: Colors.white.withOpacity(0.06),
      leading: Icon(
        Icons.edit,
        color: Colors.white,
      ),
      title: TextFormField(
        decoration: InputDecoration.collapsed(
          hintText: 'write your bio',
          hintStyle: GoogleFonts.lora(
            color: Colors.white,
          ),
        ),
        maxLines: null,
      ),
    );
  }

  Widget _phoneNumber() {
    return ListTile(
      tileColor: Colors.white.withOpacity(0.06),
      leading: Icon(
        Icons.phone_android_rounded,
        color: Colors.white,
      ),
      title: Text('number'),
    );
  }

  // Widget _saveProfileChangeButton() {
  //   return PrimaryButton(label: 'Save changes', onPressed: () {}, width: 150);
  // }
  Widget _saveProfileChangeButton() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return PrimaryButton(
          label: 'Save changes',
          onPressed: () {
            // Dispatch the ProfileSaveChanges event when the button is pressed
            BlocProvider.of<ProfileBloc>(context)
                .add(ProfileSaveSuccess() as ProfileEvent);
          },
          width: 150,
        );
      },
    );
  }

  Future<void> _pickImage() async {
    advancedDrawerController.showDrawer();
    try {
      final pickedFile =
          await _imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        // Dispatch the ChangeAvatarRequest event with the image path
        _profileBloc.add(ChangeAvatarRequest(pickedFile: pickedFile.path));
        print('Image path: ${pickedFile.path}');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

//   Future<void> _pickImage() async {
//   advancedDrawerController.showDrawer();

//   _imagePicker ??= ImagePicker();
//   _profileBloc.add(ChangeAvatarRequest(imagePicker: _imagePicker));

//   try {
//     final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       print('Image path: ${pickedFile.path}');
//     }
//   } catch (e) {
//     print('Error picking image: $e');
//   }
// }
}
















// import 'package:app/modules/home/home_page.dart';
// import 'package:app/modules/pokemon_grid/wishlist/wishlist.dart';
// import 'package:app/modules/profile/bloc/profile_bloc.dart';
// import 'package:app/modules/profile/search/search_friends.dart';
// import 'package:app/modules/profile/search/search_group.dart';
// import 'package:app/shared/ui/widgets/primaryButton.dart';
// import 'package:app/shared/utils/spacer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';

// class UserProfileScreen extends StatefulWidget {
//   const UserProfileScreen({Key? key}) : super(key: key);

//   @override
//   State<UserProfileScreen> createState() => _UserProfileScreenState();
// }

// final advancedDrawerController = AdvancedDrawerController();
// final ImagePicker _imagePicker = ImagePicker();

// class _UserProfileScreenState extends State<UserProfileScreen> {
//   late ProfileBloc _profileBloc;
//   late ImagePicker _imagePicker;
//   late double _deviceHeight;
//   late double _deviceWidth;

//   @override
//   void initState() {
//     super.initState();
//     _profileBloc = ProfileBloc();
//     _imagePicker = ImagePicker();
//   }


//   @override
//   Widget build(BuildContext context) {
//     _deviceHeight = MediaQuery.of(context).size.height;
//     _deviceWidth = MediaQuery.of(context).size.width;

//     return BlocProvider(
//       create: (context) => _profileBloc,
//       child: BlocBuilder<ProfileBloc, ProfileState>(
//         builder: (context, state) {
//           return AdvancedDrawer(
//             openRatio: 0.55,
//             openScale: 0.30,
//             controller: advancedDrawerController,
//             backdropColor: Colors.black12,
//             rtlOpening: false,
//             animationCurve: Curves.easeInOut,
//             animationDuration: Duration(milliseconds: 500),
//             child: Scaffold(
//               extendBodyBehindAppBar: true,
//               // backgroundColor: Colors.transparent,
//               appBar: _appBar(),
//               body: _profilePage(),

//             ),
//             drawer: SafeArea(
//               child: Container(
//                 // decoration: BoxDecoration(
//                 //     image: DecorationImage(
//                 //   fit: BoxFit.cover,
//                 //   image: AssetImage('assets/images/pokeforest02.png'),
//                 // )),
//                 child: ListTileTheme(
//                   textColor: Colors.white,
//                   iconColor: Colors.white,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Container(
//                         width: 228.0,
//                         height: 228.0,
//                         margin: const EdgeInsets.only(
//                           top: 24.0,
//                           bottom: 64.0,
//                         ),
//                         clipBehavior: Clip.antiAliasWithSaveLayer,
//                         decoration: BoxDecoration(
//                           color: Colors.black26,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Image.asset(
//                           'assets/images/pokeavatar.png',
//                         ),
//                       ),
//                       ListTile(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => HomePage()),
//                           );
//                         },
//                         tileColor: Colors.white.withOpacity(0.06),
//                         leading: Icon(
//                           Icons.home,
//                           color: Colors.white,
//                         ),
//                         title: Text('Home'),
//                       ),
//                       ListTile(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => FavouriteScreen(),
//                             ),
//                           );
//                         },
//                         tileColor: Colors.white.withOpacity(0.06),
//                         leading: Icon(
//                           Icons.favorite,
//                           color: Colors.white,
//                         ),
//                         title: Text('Favourites'),
//                       ),
//                       ListTile(
//                         tileColor: Colors.white.withOpacity(0.06),
//                         leading: Icon(
//                           Icons.settings,
//                           color: Colors.white,
//                         ),
//                         title: Text('Settings'),
//                       ),
//                       ListTile(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => FriendsList(),));
//                         },
//                         tileColor: Colors.white.withOpacity(0.06),
//                         leading: Icon(
//                           Icons.sensor_occupied_outlined,
//                           color: Colors.white,
//                         ),
//                         title: Text('Search friends'),
//                       ),
//                       ListTile(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => GroupSearchScreen(),));
//                         },
//                         tileColor: Colors.white.withOpacity(0.06),
//                         leading: Icon(
//                           Icons.search,
//                           color: Colors.white,
//                         ),
//                         title: Text('Search Group'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void drawerControl() {
//     advancedDrawerController.showDrawer();
//   }

//   @override
//   void dispose() {
//     _profileBloc.close();
//     super.dispose();
//   }

//   PreferredSizeWidget _appBar() {
//     return PreferredSize(
//       preferredSize: Size.fromHeight(kToolbarHeight),
//       child: AppBar(
//         // backgroundColor: Colors.black.withOpacity(0.04),
//         backgroundColor: Colors.transparent,
//         title: Text('Profile'),
//         leading: IconButton(
//           onPressed: () {
//             drawerControl();
//           },
//           icon: Icon(Icons.menu_sharp),
//         ),
//       ),
//     );
//   }

//   Widget _profilePage() {
//     return SingleChildScrollView(
//       physics: BouncingScrollPhysics(),
//       child: Container(
//         height: _deviceHeight,
//         width: _deviceWidth,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage('assets/images/pokeforest02.png'),
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             hSpace(_deviceHeight * 0.03),
//             _avatar(),
//             _changeAvatarButton(),
//             hSpace(30),
//             _nameTile(),
//             hSpace(30),
//             // _usernameTile(),
//             // hSpace(20),
//             _emailprofileTile(),
//             hSpace(20),
//             _phoneNumber(),
//             hSpace(20),
//             _descriptionBio(),
//             hSpace(20),
//             _saveProfileChangeButton(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _avatar() {
//     return GestureDetector(
//       onTap: _pickImage,
//       child: CircleAvatar(
//         radius: 50,
//          backgroundImage: AssetImage('assets/images/pokeavatar.png'),
//         child: Align(
//           alignment: Alignment.bottomRight,
//           child: Icon(
//           Icons.add_a_photo_outlined,
//           color: Colors.white,
//           size: 30,
//               ),
//         ),
//     )
//     );
//   }

//   Widget _changeAvatarButton() {
//     return TextButton(
//       onPressed: _pickImage,
//       child: Text(
//         'Change Avatar',
//         style: GoogleFonts.lora(color: Colors.white, fontSize: 15),
//       ),
//     );
//   }

//   // Widget _changeAvatarButton() {
//   //   return TextButton(
//   //       onPressed: () {},
//   //       child: Text(
//   //         'change avatar',
//   //         style: GoogleFonts.lora(color: Colors.white, fontSize: 15),
//   //       ));
//   // }

//   Widget _nameTile() {
//     return ListTile(
//         tileColor: Colors.white.withOpacity(0.06),
//         leading: Icon(
//           Icons.person,
//           color: Colors.white,
//         ),
//         title: TextFormField(
//           decoration: InputDecoration.collapsed(
//               hintText: 'Name',
//               hintStyle: GoogleFonts.lora(
//                 color: Colors.white,
//               )),
//           maxLines: null,
//         ));
//   }

//   // Widget _usernameTile() {
//   //   return ListTile(
//   //     tileColor: Colors.white.withOpacity(0.06),
//   //     leading: Icon(
//   //       Icons.person_2,
//   //       color: Colors.white,
//   //     ),
//   //     title: Text('username'),
//   //   );
//   // }

//   Widget _emailprofileTile() {
//     return ListTile(
//       tileColor: Colors.white.withOpacity(0.06),
//       leading: Icon(
//         Icons.email,
//         color: Colors.white,
//       ),
//       title: Text('email'),
//     );
//   }

//   Widget _descriptionBio() {
//     return ListTile(
//         tileColor: Colors.white.withOpacity(0.06),
//         leading: Icon(
//           Icons.edit,
//           color: Colors.white,
//         ),
//         title: TextFormField(
//           decoration: InputDecoration.collapsed(
//           hintText: 'write your bio',
//           hintStyle: GoogleFonts.lora(
//             color: Colors.white

//           )
//           ),
//           maxLines: null,
//         ));
//   }

//   Widget _phoneNumber() {
//     return ListTile(
//       tileColor: Colors.white.withOpacity(0.06),
//       leading: Icon(
//         Icons.phone_android_rounded,
//         color: Colors.white,
//       ),
//       title: Text('number'),
//     );
//   }

//   Widget _saveProfileChangeButton() {
//     return PrimaryButton(label: 'Save changes', onPressed: () {}, width: 150);
//   }

//  Future<void> _pickImage() async {
//     advancedDrawerController.showDrawer();
//     _profileBloc.add(ChangeAvatarRequest(imagePicker: _imagePicker));
//     try {
//       final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

//       if (pickedFile != null) {
//         // Use the picked image file (you might want to save it or upload it to a server)
//         print('Image path: ${pickedFile.path}');
//       }
//     } catch (e) {
//       print('Error picking image: $e');
//     }
//   }
// }

 































// import 'package:app/shared/utils/spacer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
// import 'package:google_fonts/google_fonts.dart';

// class UserProfileScreen extends StatefulWidget {
//   const UserProfileScreen({Key? key}): super(key: key);

//   @override
//   State<UserProfileScreen> createState() => _UserProfileScreenState();
// }
// final advancedDrawerController = AdvancedDrawerController();

// class _UserProfileScreenState extends State<UserProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return AdvancedDrawer(
//       openRatio: 0.55,
//       openScale: 0.30,
//       controller: advancedDrawerController,
//       backdropColor: Colors.greenAccent.withOpacity(0.3),
//       rtlOpening: false,
//       animationCurve: Curves.easeInOut,
//       animationDuration: Duration(milliseconds: 500),
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: 
//         _appbar(),
//         //  AppBar(
//         //   backgroundColor: Colors.black.withOpacity(0.04),
//         //   title: Text('profile'),
//         //   leading: IconButton(
//         //     onPressed: () {
//         //       drawerControl();
//         //     },
//         //      icon: Icon(Icons.menu_sharp)
//         //      ),
//         // ),
//         body: 
//         _profilepage(),
//         // Column(
//         //   children: [
//         //     Center(
//         //       child: CircleAvatar(
//         //         backgroundImage: AssetImage('assets/images/pokeavatar.png'),
//         //         radius: 70,
//         //       ),
//         //     ),
//         //     hSpace(40),
//         //     Text(
//         //       'John Doe',  
//         //       style:  GoogleFonts.lora(
//         //         fontWeight: FontWeight.bold,
//         //         color: Colors.white,
//         //         fontSize: 30,
//         //       )
//         //     ),
//         //     hSpace(20),
//         //     Text(
//         //       'John Doe@gmail.com',  
//         //       style:  GoogleFonts.lora(
//         //         fontWeight: FontWeight.bold,
//         //         color: Colors.white,
//         //         fontSize: 20,
//         //       )
//         //     ),
//         //   ],
//         // ),
//       ),
//       drawer: SafeArea(
//         child: Column(
//           children: [

//           ],
//         ),
//         )
//       );
//   }
   
//   void drawerControl() {
//     advancedDrawerController.showDrawer();
//   }

//   // Widget _appbar() {
//   //   return AppBar(       
//   //         backgroundColor: Colors.black.withOpacity(0.04),
//   //         title: Text('profile'),
//   //         leading: IconButton(
//   //           onPressed: () {
//   //             drawerControl();
//   //           },
//   //            icon: Icon(Icons.menu_sharp)
//   //            ),
      
//   //   );
//   // }

//   PreferredSizeWidget _appBar() {
//   return PreferredSize(
//     preferredSize: Size.fromHeight(kToolbarHeight),
//     child: AppBar(
//       backgroundColor: Colors.black.withOpacity(0.04),
//       title: Text('Profile'),
//       leading: IconButton(
//         onPressed: () {
//           drawerControl();
//         },
//         icon: Icon(Icons.menu_sharp),
//       ),
//     ),
//   );
// }


//   Widget _profilepage(){
//     return SafeArea(
//       child: Center(
//         child: Column(
//           children: [
//             SizedBox(height: 30,),
//             _avatar(),
//           ],
//         ),
//       )
//       );
//   }
// }











 
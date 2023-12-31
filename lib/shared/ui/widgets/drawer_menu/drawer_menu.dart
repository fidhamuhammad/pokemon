import 'package:app/modules/authentication/login/login.dart';
import 'package:app/modules/home/home_page.dart';
import 'package:app/modules/profile/user_profile_screen.dart';
import 'package:app/provider/login_provider.dart';
import 'package:app/shared/ui/widgets/animated_pokeball.dart';
import 'package:app/shared/ui/widgets/textButton.dart';
import 'package:app/shared/utils/app_constants.dart';
import 'package:app/shared/utils/spacer.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DrawerMenuWidget extends StatefulWidget {
  bool isLoggedIn;
  final String? userName;
  final Function()? onLogout;

  DrawerMenuWidget({
    this.userName = '',
    required this.isLoggedIn,
    required this.onLogout,
  });

  @override
  State<DrawerMenuWidget> createState() => _DrawerMenuWidgetState();
}

class _DrawerMenuWidgetState extends State<DrawerMenuWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GlassmorphicContainer(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height,
      borderRadius: 0.5,
      blur: 100,
      alignment: Alignment.center,
      border: 0.1,
      linearGradient: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topCenter,
        colors: [
          Color.fromARGB(255, 12, 41, 254).withOpacity(0.5),
          Color.fromARGB(255, 141, 167, 244).withOpacity(0.1),
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 119, 153, 255).withOpacity(0.5),
          Color.fromARGB(255, 110, 130, 245).withOpacity(0.3),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage('assets/images/froasted_blur.jpg'),
            //   fit: BoxFit.cover,
            // ),
            color: Color.fromARGB(255, 145, 162, 198).withOpacity(0.4)),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                hSpace(30),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/pokeavatar.png'),
                ),
                hSpace(10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Welcome!',
                          style: GoogleFonts.lora(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                        text:
                            widget.userName != null ? widget.userName! : 'user',
                        style: GoogleFonts.lora(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
                hSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedPokeballWidget(color: Colors.black, size: 24),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("Pokedex",
                        // style: textTheme.headline1,
                        style: GoogleFonts.lora(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                hSpace(30),          
                    // widget.isLoggedIn == false
                    // ? Column(
                    //     children: [
                    //       ListTile(
                    //         title: Align(
                    //           alignment: Alignment.center,
                    //           child: TextButton(
                    //             onPressed: () {
                    //           Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),)); // Close the drawer
                    //              if (widget.onLogout != null) {
                    //                 widget.onLogout!();
                    //               }  
                    //             }, 
                    //           child: Text(
                    //             'Logout',
                    //             style: GoogleFonts.lora(
                    //               textStyle: TextStyle(
                    //                 color: Colors.black,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 20,
                    //               ),
                    //             ),
                    //           ),
                    //           )
                    //         ),                         
                    //       ),
                    //     ],
                    //   )
                    // : ListTile(
                    //     title: GestureDetector(
                    //       onTap: () {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) => SignUpScreen(),
                    //           ),
                    //         );
                    //       },
                    //       child: Align(
                    //         alignment: Alignment.center,
                    //         child: RichText(
                    //           text: TextSpan(
                    //             text: 'New to pokedex? ',
                    //             style: GoogleFonts.lora(
                    //               textStyle: TextStyle(
                    //                 color: Colors.black,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 15,
                    //               ),
                    //             ),
                    //             children: [
                    //               TextSpan(
                    //                 text: 'Sign Up',
                    //                 style: GoogleFonts.lora(
                    //                   textStyle: TextStyle(
                    //                     color: Colors.white,
                    //                     fontWeight: FontWeight.bold,
                    //                     fontSize: 15,
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    Consumer<AuthStatusProvider>(builder:
                     (context, value, child) {
                       if (value.isLoggedIn) {
                         return Text('logout');
                       }
                       else{
                        return  ListTile(
                        title: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  LoginScreen(),
                              ),
                            );
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                text: 'New to pokedex? ',
                                style: GoogleFonts.lora(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Login',
                                    style: GoogleFonts.lora(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                       }
                     },
                     )
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Lottie.asset(
                AppConstants.diglettLottie,
                height: 200.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}






 // Add the rest of your widgets as needed
                // widget.userName == ''
                //     ? Padding(
                //         padding: const EdgeInsets.only(top: 12.0),
                //         // ignore: unnecessary_null_comparison
                //         child: widget == null
                //             ? InkWell(
                //                 onTap: () => {
                //                   Navigator.push(
                //                     context,
                //                     MaterialPageRoute(
                //                       builder: (context) => SignUpScreen(),
                //                     ),
                //                   )
                //                 },
                //                 child: RichText(
                //                   text: TextSpan(
                //                       style: DefaultTextStyle.of(context).style,
                //                       children: [
                //                         TextSpan(
                //                           text: 'Don\'t have an account?',
                //                         ),
                //                         TextSpan(
                //                             text: 'Signup Now!',
                //                             style: TextStyle(
                //                                 color: const Color.fromARGB(
                //                                     255, 16, 148, 255))),
                //                       ]),
                //                 ),
                //               )
                //             : Text(''),
                //       )
                //     : TextButton(
                //         onPressed: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) =>
                //                     // LoginScreen(),
                //                     SignUpScreen()),
                //           );
                //         },
                //         child: Text(
                //             'New to pokedex! Signup here', // You can customize the text here
                //             // style: TextStyle(color: Colors.black87),
                //             style: GoogleFonts.lora(
                //                 color: Colors.white,
                //                 fontSize: 20,
                //                 fontWeight: FontWeight.normal)),
                //       ),
                // ListTile(
                //   title: Text('home'),
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                //   },
                // ),
                // widget.isLoggedIn
                //     ? ListTile(
                //         title: Text(
                //           'Logout',
                //           style: GoogleFonts.lato(
                //               textStyle: TextStyle(
                //             color: Colors.black,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //           )),
                //         ),
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => HomePage(),
                //               ));
                //         },
                //       )
                //     : ListTile(
                //         title: RichText(
                //             text: TextSpan(
                //                 text: 'New to pokedex?',
                //                 style: DefaultTextStyle.of(context).style,
                //                 children: [
                //               TextSpan(
                //                 text: 'Sign Up',
                //                 style: GoogleFonts.lato(
                //                   textStyle: TextStyle(
                //                     color: Colors.black,
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 20,
                //                   ),
                //                 ),
                //               ),
                //             ],
                //             ),
                //             ),
                //       ),

              //  !widget.isLoggedIn
              //       ? 
              //       ListTile(
              //           title: GestureDetector(
              //             onTap: () {
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => SignUpScreen(),
              //                 ),
              //               );
              //             },
              //             child: Align(
              //               alignment: Alignment.center,
              //               child: RichText(
              //                 text:
              //                  TextSpan(
              //                   text: 'New to pokedex? ',
              //                   style:  GoogleFonts.lora(
              //                     textStyle: TextStyle(
              //                           color: Colors.black,
              //                           fontWeight: FontWeight.bold,
              //                           fontSize: 15,
              //                         ),
              //                   ),
              //                   children: [
              //                     TextSpan(
              //                       text: 'Sign Up',
              //                       style: GoogleFonts.lora(
              //                         textStyle: TextStyle(
              //                           color:  Colors.white,
              //                           fontWeight: FontWeight.bold,
              //                           fontSize: 15,
              //                         ),
              //                       ),
                                    
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         )
              //       : ListTile(
              //           title:
              //            Align(
              //             alignment: Alignment.center,
              //              child: 
              //              Text(
              //               'Logout',
              //               style: GoogleFonts.lora(
              //                 textStyle: TextStyle(
              //                   color: Colors.black,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 20,
              //                 ),
              //               ),
              //               ),
              //            ),
              //           onTap: () {
              //             Navigator.pop(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => 
              //                  HomePage(),
              //               ),
              //             );
              //           },
              //         ),
              // ],


















// import 'package:app/shared/ui/widgets/animated_pokeball.dart';
// import 'package:app/shared/utils/app_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:glassmorphism/glassmorphism.dart';
// import 'package:lottie/lottie.dart';

// class DrawerMenuWidget extends StatefulWidget {
//   final bool isLoggedIn;
//   final String? userName;
//   DrawerMenuWidget({
//     this.userName = '',
//     required this.isLoggedIn,
//   });

//   @override
//   State<DrawerMenuWidget> createState() => _DrawerMenuWidgetState();
// }

// class _DrawerMenuWidgetState extends State<DrawerMenuWidget>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     _controller =
//         AnimationController(vsync: this, duration: Duration(seconds: 2))
//           ..repeat();

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final TextTheme textTheme = Theme.of(context).textTheme;

//     return GlassmorphicContainer(
//       width: MediaQuery.of(context).size.width * 0.8,
//       height: MediaQuery.of(context).size.height,
//       borderRadius: 5,
//       blur: 10,
//       alignment: Alignment.center,
//       border: 0.1,
//       linearGradient: LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [
//           // Colors.white.withOpacity(0.2),
//           // Colors.white.withOpacity(0.1),
//           Color.fromARGB(255, 52, 159, 194).withOpacity(0.2),
//           Color.fromARGB(255, 96, 156, 176).withOpacity(0.1),
//         ],
//       ),
//       borderGradient: LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [
//           // Colors.white.withOpacity(0.5),
//           // Colors.white.withOpacity(0.3),
//           Color.fromARGB(255, 114, 195, 209).withOpacity(0.5),
//           Color.fromARGB(255, 105, 205, 218).withOpacity(0.3),
//         ],
        
//       ),
      
//       child: Stack(
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 30),
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: AssetImage('assets/images/R.jpg'),
//               ),
//               SizedBox(height: 10),
//               RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                         text: 'Welcome!',
//                         style: TextStyle(
//                             color: Colors.black, fontWeight: FontWeight.bold)),
//                     TextSpan(
//                         text:
//                             widget.userName != null ? widget.userName! : 'user',
//                         style: TextStyle(color: Colors.white))
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AnimatedPokeballWidget(color: Colors.black, size: 24),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     "Pokedex",
//                     style: textTheme.headline1,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               // Add the rest of your widgets as needed
//             ],
//           ),
//           // Align(
//           //   alignment: Alignment.bottomRight,
//           //   child: Lottie.asset(
//           //     'assets/lottie/diglett.json', // Change to your Lottie file
//           //     height: 200.0,
//           //   ),
//           // ),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Lottie.asset(
//               AppConstants.diglettLottie,
//               height: 200.0,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:lottie/lottie.dart';
// import 'package:app/modules/home/home_page_store.dart';
// import 'package:app/shared/ui/widgets/animated_pokeball.dart';
// import 'package:app/shared/ui/widgets/drawer_menu/widgets/drawer_menu_item.dart';
// import 'package:app/shared/utils/app_constants.dart';
// import 'package:app/theme/app_theme.dart';

// class DrawerMenuWidget extends StatefulWidget {
//   const DrawerMenuWidget({Key? key, required bool isLoggedIn, String? userName}) : super(key: key);

//   @override
//   State<DrawerMenuWidget> createState() => _DrawerMenuWidgetState();
// }

// class _DrawerMenuWidgetState extends State<DrawerMenuWidget>
//     with TickerProviderStateMixin {
//   final HomePageStore _homeStore = GetIt.instance<HomePageStore>();

//   late AnimationController _controller;

//   @override
//   void initState() {
//     _controller =
//         AnimationController(vsync: this, duration: Duration(seconds: 2))
//           ..repeat();

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final TextTheme textTheme = Theme.of(context).textTheme;

//     return Container(
//       color: Theme.of(context).backgroundColor,
//       child: Stack(
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   Image.asset(
//                     AppConstants.pokedexIcon,
//                     width: 100,
//                     height: 100,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       AnimatedPokeballWidget(
//                           color: AppTheme.getColors(context).pokeballLogoBlack,
//                           size: 24),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Text("Pokedex", style: textTheme.headline1),
//                     ],
//                   ),
//                 ],
//               ),
//               GridView(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2, mainAxisExtent: 70),
//                 children: [
//                   DrawerMenuItemWidget(
//                     color: AppTheme.getColors(context).drawerPokedex,
//                     text: "Pokedex",
//                     onTap: () {
//                       Navigator.pop(context);

//                       _homeStore.setPage(HomePageType.POKEMON_GRID);
//                     },
//                   ),
//                   DrawerMenuItemWidget(
//                     color: AppTheme.getColors(context).drawerItems,
//                     text: "Items",
//                     onTap: () {
//                       Navigator.pop(context);

//                       _homeStore.setPage(HomePageType.ITENS);
//                     },
//                   ),
//                   DrawerMenuItemWidget(
//                       color: AppTheme.getColors(context).drawerMoves,
//                       text: "Moves"),
//                   DrawerMenuItemWidget(
//                       color: AppTheme.getColors(context).drawerAbilities,
//                       text: "Abilities"),
//                   DrawerMenuItemWidget(
//                       color: AppTheme.getColors(context).drawerTypeCharts,
//                       text: "Type Charts"),
//                   DrawerMenuItemWidget(
//                       color: AppTheme.getColors(context).drawerLocations,
//                       text: "Locations"),
//                 ],
//               ),
//             ],
//           ),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Lottie.asset(
//               AppConstants.diglettLottie,
//               height: 200.0,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }







// import 'package:app/modules/authentication/signup/signup.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:lottie/lottie.dart';
// import 'package:app/modules/home/home_page_store.dart';
// import 'package:app/shared/ui/widgets/animated_pokeball.dart';
// import 'package:app/shared/utils/app_constants.dart';
// import 'package:app/theme/app_theme.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class DrawerMenuWidget extends StatefulWidget {
//   final bool isLoggedIn;
//   final String? userName;
//   DrawerMenuWidget({
//     this.userName = '',
//     required this.isLoggedIn,
//   });

//   @override
//   State<DrawerMenuWidget> createState() => _DrawerMenuWidgetState();
// }

// class _DrawerMenuWidgetState extends State<DrawerMenuWidget>
//     with TickerProviderStateMixin {
//   final HomePageStore _homeStore = GetIt.instance<HomePageStore>();
//   String? userName;
//   late AnimationController _controller;

//   @override
//   void initState() {
//     _controller =
//         AnimationController(vsync: this, duration: Duration(seconds: 2))
//           ..repeat();

//     super.initState();
//     initSharedPreferences();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final TextTheme textTheme = Theme.of(context).textTheme;

//     return Stack(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//               // image: DecorationImage(image: AssetImage('assets/images/bgblue01.png'),
//               // fit: BoxFit.cover,
//               // )
//               color: Colors.lightBlueAccent,
//               ),
//         ),
//         Positioned(
//           child: RichText(
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                     text: 'Welcome!', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                 TextSpan(
//                     text: this.userName != null ? userName : 'user',
//                     style: TextStyle(color: Colors.white))
//               ],
//             ),
//           ),
//           top: 100,
//           left: 40,
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(
//               children: [
//                 Image.asset(
//                   AppConstants.pokedexIcon,
//                   width: 100,
//                   height: 100,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     AnimatedPokeballWidget(
//                         color: AppTheme.getColors(context).pokeballLogoBlack,
//                         size: 24),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Text(
//                       "Pokedex",
//                       style: textTheme.headline1,
//                       // style: TextStyle(color: Colors.white, fontSize: 30),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             // GridView(

//             //   shrinkWrap: true,
//             //   physics: const NeverScrollableScrollPhysics(),
//             //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             //       crossAxisCount: 2, mainAxisExtent: 70),
//             //   children: [
//             //     DrawerMenuItemWidget(
//             //       color: AppTheme.getColors(context).drawerPokedex,
//             //       text: "Pokedex",
//             //       // onTap: () {
//             //       //   Navigator.pop(context);
//             //       //   _homeStore.setPage(HomePageType.POKEMON_GRID);
//             //       // },
//             //     ),
//             //     DrawerMenuItemWidget(
//             //       color: AppTheme.getColors(context).drawerItems,
//             //       text: "Items",
//             //       onTap: () {
//             //         Navigator.pop(context);
//             //         _homeStore.setPage(HomePageType.ITENS);
//             //       },
//             //     ),
//             //     DrawerMenuItemWidget(
//             //         color: AppTheme.getColors(context).drawerMoves,
//             //         text: "Moves",
//             //         onTap: () {

//             //         },
//             //         ),
//             //     DrawerMenuItemWidget(
//             //         color: AppTheme.getColors(context).drawerAbilities,
//             //         text: "Abilities",
//             //          onTap: () {

//             //         },
//             //         ),
//             //     DrawerMenuItemWidget(
//             //         color: AppTheme.getColors(context).drawerTypeCharts,
//             //         text: "Type Charts",
//             //          onTap: () {

//             //         },
//             //         ),
//             //     DrawerMenuItemWidget(
//             //         color: AppTheme.getColors(context).drawerLocations,
//             //         text: "Locations",
//             //          onTap: () {

//             //         },
//             //         ),
//             //   ],
//             // ),
//             userName == ''
//                 ? Padding(
//                     padding: const EdgeInsets.only(top: 12.0),
//                     child: this.userName == null
//                         ? InkWell(
//                             onTap: () => {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => SignUpScreen(),
//                                 ),
//                               )
//                             },
//                             child: RichText(
//                               text: TextSpan(
//                                   style: DefaultTextStyle.of(context).style,
//                                   children: [
//                                     TextSpan(
//                                       text: 'Don\'t have an account? ',
//                                     ),
//                                     TextSpan(
//                                         text: ' Signup Now! ',
//                                         style: TextStyle(
//                                             color: const Color.fromARGB(
//                                                 255, 16, 148, 255))),
//                                   ]),
//                             ),
//                           )
//                         : Text(''),
//                   )
//                 : TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => 
//                           // LoginScreen(),
//                           SignUpScreen()
//                         ),
//                       );
//                     },
//                     child: Text(
//                       'New to pokedex! Signup here', // You can customize the text here
//                       style: TextStyle(color: Colors.black87),
//                     ),
//                   )
//           ],
//         ),
//         Align(
//           alignment: Alignment.bottomRight,
//           child: Lottie.asset(
//             AppConstants.diglettLottie,
//             height: 200.0,
//           ),
//         ),
//       ],
//     );
//   }

//   Future<void> initSharedPreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     this.userName = prefs.getString('userName');
//     print(this.userName);
//     print('00000000000');
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:get_it/get_it.dart';
// // import 'package:lottie/lottie.dart';
// // import 'package:app/modules/home/home_page_store.dart';
// // import 'package:app/shared/ui/widgets/animated_pokeball.dart';
// // import 'package:app/shared/ui/widgets/drawer_menu/widgets/drawer_menu_item.dart';
// // import 'package:app/shared/utils/app_constants.dart';
// // import 'package:app/theme/app_theme.dart';

// // class DrawerMenuWidget extends StatefulWidget {
// //   const DrawerMenuWidget({Key? key, required bool isLoggedIn, String? userName}) : super(key: key);

// //   @override
// //   State<DrawerMenuWidget> createState() => _DrawerMenuWidgetState();
// // }

// // class _DrawerMenuWidgetState extends State<DrawerMenuWidget>
// //     with TickerProviderStateMixin {
// //   final HomePageStore _homeStore = GetIt.instance<HomePageStore>();

// //   late AnimationController _controller;

// //   @override
// //   void initState() {
// //     _controller =
// //         AnimationController(vsync: this, duration: Duration(seconds: 2))
// //           ..repeat();

// //     super.initState();
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final TextTheme textTheme = Theme.of(context).textTheme;

// //     return Container(
// //       color: Theme.of(context).backgroundColor,
// //       child: Stack(
// //         children: [
// //           Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Column(
// //                 children: [
// //                   Image.asset(
// //                     AppConstants.pokedexIcon,
// //                     width: 100,
// //                     height: 100,
// //                   ),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       AnimatedPokeballWidget(
// //                           color: AppTheme.getColors(context).pokeballLogoBlack,
// //                           size: 24),
// //                       const SizedBox(
// //                         width: 5,
// //                       ),
// //                       Text("Pokedex", style: textTheme.headline1),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //               GridView(
// //                 shrinkWrap: true,
// //                 physics: const NeverScrollableScrollPhysics(),
// //                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                     crossAxisCount: 2, mainAxisExtent: 70),
// //                 children: [
// //                   DrawerMenuItemWidget(
// //                     color: AppTheme.getColors(context).drawerPokedex,
// //                     text: "Pokedex",
// //                     onTap: () {
// //                       Navigator.pop(context);

// //                       _homeStore.setPage(HomePageType.POKEMON_GRID);
// //                     },
// //                   ),
// //                   DrawerMenuItemWidget(
// //                     color: AppTheme.getColors(context).drawerItems,
// //                     text: "Items",
// //                     onTap: () {
// //                       Navigator.pop(context);

// //                       _homeStore.setPage(HomePageType.ITENS);
// //                     },
// //                   ),
// //                   DrawerMenuItemWidget(
// //                       color: AppTheme.getColors(context).drawerMoves,
// //                       text: "Moves"),
// //                   DrawerMenuItemWidget(
// //                       color: AppTheme.getColors(context).drawerAbilities,
// //                       text: "Abilities"),
// //                   DrawerMenuItemWidget(
// //                       color: AppTheme.getColors(context).drawerTypeCharts,
// //                       text: "Type Charts"),
// //                   DrawerMenuItemWidget(
// //                       color: AppTheme.getColors(context).drawerLocations,
// //                       text: "Locations"),
// //                 ],
// //               ),
// //             ],
// //           ),
// //           Align(
// //             alignment: Alignment.bottomRight,
// //             child: Lottie.asset(
// //               AppConstants.diglettLottie,
// //               height: 200.0,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

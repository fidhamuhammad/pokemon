import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:app/modules/Pokedexgroup/group.dart';
import 'package:app/modules/home/bloc/news_bloc.dart';
import 'package:app/modules/home/home_page_store.dart';
import 'package:app/modules/home/widgets/pokedex_grid.dart';
import 'package:app/modules/items/items_page.dart';
import 'package:app/modules/news_list/view_news_list.dart';
import 'package:app/modules/pokemon_details/pokemon_details.dart';
import 'package:app/modules/pokemon_details/widgets/pokemon_panel/pages/about/about_page.dart';
import 'package:app/modules/pokemon_grid/pokemon_grid_page.dart';
import 'package:app/modules/profile/user_profile_screen.dart';
import 'package:app/provider/login_provider.dart';
import 'package:app/shared/stores/item_store/item_store.dart';
import 'package:app/shared/stores/pokemon_store/pokemon_store.dart';
import 'package:app/shared/ui/widgets/app_bar.dart';
import 'package:app/shared/ui/widgets/drawer_menu/drawer_menu.dart';
import 'package:app/shared/ui/widgets/gradient/circuar_gradient.dart';
import 'package:app/shared/ui/widgets/drawer_menu/widgets/drawer_menu_item.dart';
import 'package:app/shared/ui/widgets/pokeball.dart';
import 'package:app/shared/ui/widgets/search/search.dart';
import 'package:app/shared/ui/widgets/animations/rive/bottom_appbar.dart';
import 'package:app/shared/ui/widgets/sliver_appbar/pokegrid_sliver.dart';
import 'package:app/shared/ui/widgets/sliver_appbar/sliver_appbar.dart';
import 'package:app/shared/ui/widgets/sliver_appbar/sliver_box.dart';
import 'package:app/shared/ui/widgets/sliver_appbar/sliver_padding.dart';
import 'package:app/shared/utils/app_constants.dart';
import 'package:app/shared/utils/spacer.dart';
import 'package:app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';



class HomePage extends StatefulWidget {
  bool isLoggedIn;
  HomePage({Key? key, this.isLoggedIn = false}) : super(key: key);
  

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _backgroundAnimationController;
  late Animation<double> _blackBackgroundOpacityAnimation;
  String? userName;
  final _newsBloc = new NewsBloc();
  // bool isLoggedIn = false;
  late AnimationController _fabAnimationRotationController;
  late AnimationController _fabAnimationOpenController;
  late Animation<double> _fabRotateAnimation;
  late Animation<double> _fabSizeAnimation;

  late PokemonStore _pokemonStore;
  late ItemStore _itemStore;
  late HomePageStore _homeStore;
  late PanelController _panelController;

  late List<ReactionDisposer> reactionDisposer = [];
  late List<Map<String, String>> newsList = [];

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
    _pokemonStore = GetIt.instance<PokemonStore>();
    _itemStore = GetIt.instance<ItemStore>();
    _homeStore = GetIt.instance<HomePageStore>();
    _panelController = PanelController();
    // print(isLoggedIn);

    _backgroundAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _blackBackgroundOpacityAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_backgroundAnimationController);

    _fabAnimationRotationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _fabAnimationOpenController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    _fabRotateAnimation = Tween(begin: 180.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.easeOut, parent: _fabAnimationRotationController));

    _fabSizeAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.4), weight: 80.0),
      TweenSequenceItem(tween: Tween(begin: 1.4, end: 1.0), weight: 20.0),
    ]).animate(_fabAnimationRotationController);

    reactionDisposer.add(
      reaction((_) => _homeStore.isFilterOpen, (_) {
        if (_homeStore.isFilterOpen) {
          _panelController.open();
          _homeStore.showBackgroundBlack();
          _homeStore.hideFloatActionButton();
        } else {
          _panelController.close();
          _homeStore.hideBackgroundBlack();
          _homeStore.showFloatActionButton();
        }
      }),
    );

    reactionDisposer.add(
      reaction((_) => _homeStore.isBackgroundBlack, (_) {
        if (_homeStore.isBackgroundBlack) {
          _backgroundAnimationController.forward();
        } else {
          _backgroundAnimationController.reverse();
        }
      }),
    );

    reactionDisposer.add(
      reaction((_) => _homeStore.isFabVisible, (_) {
        if (_homeStore.isFabVisible) {
          _fabAnimationRotationController.forward();
        } else {
          _fabAnimationRotationController.reverse();
        }
      }),
    );

    _fabAnimationRotationController.forward();
  }

  @override

  Widget build(BuildContext context) {
  final authStatusProvider = Provider.of<AuthStatusProvider>(context);

    // Widget _tabBody = Container(color: Colors.cyan,);
    // final List<Widget> _screens = [
    //   commonTabScene('User'),
    //   commonTabScene('Audio'),
    //   commonTabScene('Settings'),
    //   commonTabScene('Bell'),
    // ];

    // @override
    // void initState() {
    //   _tabBody = _screens.first;
    //   super.initState();
      
    // }


    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ThemeSwitchingArea(
      child: Builder(builder: (context) {
        return Scaffold(
          // backgroundColor: Color.fromARGB(255, 12, 25, 110),
          // backgroundColor: Colors.white,

          key: const Key('home_page'),

          endDrawer: Drawer(
            child: DrawerMenuWidget(
              isLoggedIn: false,
              userName: userName,
              onLogout: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('userName');
                setState(() {
                  widget.isLoggedIn = false;
                });
                Navigator.pop(context);
              },
            ),
          ),
          extendBody: true,
          body: Stack(
            children: [
              Container (
                 decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 233, 240, 248),
            Color.fromARGB(255, 250, 248, 247),
          ],
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
        ),),
                child: CustomScrollView(
                  slivers: [
                    CustomSliverAppbar(),
                    SliverSearch(),
                    PokegridSliver(),
                    CustomeSliverPadding(),
                    CustomNavigationBar(
                      // onTabChange: (tabIndex) {
                        
                      // },
                    ),
                  ],
                  
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget commonTabScene(String tabName){
    return Container(
      alignment: Alignment.center,
      child: Text(tabName, style: const TextStyle(fontSize: 28),),
    );
  }

  Future<void> initSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.userName = prefs.getString('userName');
    print(this.userName);
    if (userName != '') {
      setState(() {
        widget.isLoggedIn = true;
      });
    }
  }

  @override
  void dispose() {
    _backgroundAnimationController.dispose();
    _fabAnimationRotationController.dispose();
    _fabAnimationOpenController.dispose();
    super.dispose();
  }
}







      // above code till to here only



 // Align(
              //   alignment: AlignmentDirectional(3, -3.0),
              //   child: Container(
              //     height: 300,
              //     width: 300,
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: Colors.deepPurple
              //     ),
              //   ),
              // ),
              // CircularGradientContainer(
              //     right: 320,
              //     top: 50,
              //     size: 20,
              //     gradientColors: [
              //       Color(0xff744ff9),
              //       Color(0xff8369de),
              //       Color(0xff8da0cb)
              //     ]),
              // CircularGradientContainer(
              //     left: 320,
              //     bottom: 15,
              //     size: 50,
              //     gradientColors: [
              //       Color(0xff744ff9),
              //       Color(0xff8369de),
              //       Color(0xff8da0cb)
              //     ]),
              // CircularGradientContainer(
              //   top: 20,
              //   left: 20,
              //   size: 50, gradientColors: [
              //   Color(0xff744ff9),
              //   Color(0xff8369de),
              //   Color(0xff8da0cb)
              // ]),

              // BackdropFilter(
              //   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              //   child: Container(
              //     color: Colors.black
              //         .withOpacity(0.08), // Adjust the opacity as needed
              //     height: double.infinity,
              //     width: double.infinity,
              //   ),
              // ),



















//   Widget _searchBox() {
//   // final state = Provider.of<PokemonState>(context);
//   // return SliverToBoxAdapter(
//   //   child: InkWell(
//   //     onTap: () async {
//   //       await showSearch(
//   //         context: context,
//   //         delegate: PokemonSearch(state.pokemonList),
//   //       );
//   //     },
//       // child: 
//       Container(
//         height: 40,
//         padding: EdgeInsets.symmetric(horizontal: 15),
//         margin: EdgeInsets.only(right: 30, top: 30, bottom: 20),
//         decoration: BoxDecoration(
//           color: Color(0xfff6f6f6),
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: Row(
//           children: <Widget>[
//             Icon(Icons.search, color: Colors.grey.shade600),
//             SizedBox(width: 10),
//             Text(
//               'Search Pokemon, Move, Ability',
//               style: TextStyle(
//                 color: Colors.grey.shade600,
//                 // fontSize: getFontSize(context, 14),
//               ),
//             )
//           ],
//         ),
//       );
// }



//  // Background Image or Color
//               Container(
//                 // Set your background image or color here
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(
//                         'assets/images/pokebg.png'), // Replace with your background image
//                     fit: BoxFit.cover,
//                   ),
//                   // color: Color.fromARGB(255, 202, 198, 198)
//                 ),
//               ),

//  // Frosted Glass Overlay
//               BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                 child: Container(
//                   color: Colors.black
//                       .withOpacity(0.5), // Adjust the opacity as needed
//                   // Add any additional styling or child widgets here
//                 ),
//               ),





// SliverPadding(
                  //   padding: EdgeInsets.fromLTRB(3, 8, 4, 3),
                  //   sliver: SliverToBoxAdapter(
                  //     child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           Text('Pokemon News',
                  //               style: GoogleFonts.lora(
                  //                   textStyle: TextStyle(
                  //                       color: Colors.white,
                  //                       letterSpacing: 0.5,
                  //                       fontSize: 28,
                  //                       fontWeight: FontWeight.bold))),
                  //           TextButton(
                  //             onPressed: () {
                  //               Navigator.push(
                  //                   context,
                  //                   MaterialPageRoute(
                  //                     builder: (context) => NewsListScreen(),
                  //                   ));
                  //             },
                  //             child: Text('View All',
                  //                 style: GoogleFonts.lora(
                  //                     color: Colors.white,
                  //                     fontSize: 15,
                  //                     fontWeight: FontWeight.normal)
                  //                 // style: TextStyle(
                  //                 //     color: Color.fromARGB(255, 188, 220, 246),
                  //                 //     fontWeight: FontWeight.bold,
                  //                 //     fontFamily: GoogleFonts.montserrat().fontFamily
                  //                 //     ),
                  //                 ),
                  //           ),
                  //         ]),
                  //   ),
                  // ),
                  // BlocProvider(
                  //   create: (context) => _newsBloc..add(LoadNewsEvent()),
                  //   child: BlocBuilder<NewsBloc, NewsState>(
                  //     builder: (context, state) {
                  //       if (state is NewsLoadedSuccessfully) {
                  //         print('${state.newsList[1]}999999999999999999999999');
                  //         return SliverList.separated(
                  //           itemBuilder: (BuildContext context, int index) {
                  //             return Container(
                  //               margin: EdgeInsets.fromLTRB(8, 1, 8, 1),
                  //               decoration: BoxDecoration(
                  //                 color: Color.fromARGB(255, 85, 85, 82)
                  //                     .withOpacity(0.3),
                  //                 borderRadius: BorderRadius.circular(20.0),
                  //               ),
                  //               child: ListTile(
                  //                 contentPadding: EdgeInsets.all(10),
                  //                 title: Text(
                  //                   state.newsList[index]['title'],
                  //                   style: TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //                 subtitle: Container(
                  //                   alignment: Alignment.bottomLeft,
                  //                   decoration: BoxDecoration(
                  //                       borderRadius: BorderRadius.all(
                  //                           Radius.circular(100))),
                  //                   child: Text(
                  //                     state.newsList[index]['date'],
                  //                     style: TextStyle(color: Colors.white),
                  //                   ),
                  //                 ),
                  //                 leading: CircleAvatar(
                  //                   radius: 40,
                  //                   backgroundImage: NetworkImage(
                  //                     state.newsList[index]['pic'],
                  //                   ),
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //           separatorBuilder: (context, index) => SizedBox(),
                  //           itemCount: state.newsList
                  //               .length, // Replace with your actual item count
                  //         );
                  //       } else {
                  //         return SliverFillRemaining(
                  //           child: Center(
                  //             child: CircularProgressIndicator(),
                  //           ),
                  //         );
                  //       }
                  //     },
                  //   ),
                  // ),






// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
// import 'package:app/modules/home/home_page_store.dart';
// import 'package:app/modules/items/items_page.dart';
// import 'package:app/modules/pokemon_grid/pokemon_grid_page.dart';
// import 'package:app/shared/stores/item_store/item_store.dart';
// import 'package:app/shared/stores/pokemon_store/pokemon_store.dart';
// import 'package:app/shared/ui/widgets/app_bar.dart';
// import 'package:app/shared/ui/widgets/drawer_menu/drawer_menu.dart';
// import 'package:app/shared/utils/app_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:get_it/get_it.dart';
// import 'package:mobx/mobx.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
//   late AnimationController _backgroundAnimationController;
//   late Animation<double> _blackBackgroundOpacityAnimation;

//   late AnimationController _fabAnimationRotationController;
//   late AnimationController _fabAnimationOpenController;
//   late Animation<double> _fabRotateAnimation;
//   late Animation<double> _fabSizeAnimation;

//   late PokemonStore _pokemonStore;
//   late ItemStore _itemStore;
//   late HomePageStore _homeStore;
//   late PanelController _panelController;

//   late List<ReactionDisposer> reactionDisposer = [];

//   @override
//   void initState() {
//     super.initState();

//     _pokemonStore = GetIt.instance<PokemonStore>();
//     _itemStore = GetIt.instance<ItemStore>();
//     _homeStore = GetIt.instance<HomePageStore>();
//     _panelController = PanelController();

//     _backgroundAnimationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 250),
//     );
//     _blackBackgroundOpacityAnimation =
//         Tween(begin: 0.0, end: 1.0).animate(_backgroundAnimationController);

//     _fabAnimationRotationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 400),
//     );

//     _fabAnimationOpenController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 250),
//     );

//     _fabRotateAnimation = Tween(begin: 180.0, end: 0.0).animate(CurvedAnimation(
//         curve: Curves.easeOut, parent: _fabAnimationRotationController));

//     _fabSizeAnimation = TweenSequence([
//       TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.4), weight: 80.0),
//       TweenSequenceItem(tween: Tween(begin: 1.4, end: 1.0), weight: 20.0),
//     ]).animate(_fabAnimationRotationController);

//     reactionDisposer.add(
//       reaction((_) => _homeStore.isFilterOpen, (_) {
//         if (_homeStore.isFilterOpen) {
//           _panelController.open();
//           _homeStore.showBackgroundBlack();
//           _homeStore.hideFloatActionButton();
//         } else {
//           _panelController.close();
//           _homeStore.hideBackgroundBlack();
//           _homeStore.showFloatActionButton();
//         }
//       }),
//     );

//     reactionDisposer.add(
//       reaction((_) => _homeStore.isBackgroundBlack, (_) {
//         if (_homeStore.isBackgroundBlack) {
//           _backgroundAnimationController.forward();
//         } else {
//           _backgroundAnimationController.reverse();
//         }
//       }),
//     );

//     reactionDisposer.add(
//       reaction((_) => _homeStore.isFabVisible, (_) {
//         if (_homeStore.isFabVisible) {
//           _fabAnimationRotationController.forward();
//         } else {
//           _fabAnimationRotationController.reverse();
//         }
//       }),
//     );

//     _fabAnimationRotationController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ThemeSwitchingArea(
//       child: Builder(builder: (context) {
//         return Scaffold(
//           key: const Key('home_page'),
//           backgroundColor: Theme.of(context).colorScheme.background,
//           endDrawer: const Drawer(
//             child: DrawerMenuWidget(),
//           ),
//           body: Stack(children: [
//             SafeArea(
//               bottom: false,
//               child: CustomScrollView(
//                 slivers: [
//                   SliverPadding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                     ),
//                     sliver: Observer(
//                       builder: (_) => AppBarWidget(
//                         title: _homeStore.page.description,
//                         lottiePath: AppConstants.squirtleLottie,
//                       ),
//                     ),
//                   ),
//                   Observer(
//                     builder: (_) {
//                       switch (_homeStore.page) {
//                         case HomePageType.POKEMON_GRID:
//                           return PokemonGridPage();
//                         case HomePageType.ITENS:
//                           return ItemsPage();
//                         default:
//                           return PokemonGridPage();
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ]),
          
//         );
//       }),
//     );
//   }
// }

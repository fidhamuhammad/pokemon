import 'package:app/modules/authentication/signup/signup.dart';
import 'package:app/modules/pokemon_grid/wishlist/wishlist.dart';
import 'package:app/modules/profile/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';
import 'package:app/shared/ui/widgets/animations/rive/models/tab_item.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

final List<TabItems> _icons = TabItems.tabItemsList;

int _selectedTab = 0;

void onRiveIconInit(Artboard artboard, index) {
  final controller =
      StateMachineController.fromArtboard(artboard, _icons[index].stateMachine);
  artboard.addController(controller!);
  _icons[index].status = controller.findInput<bool>('active') as SMIBool;
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  // color: Color.fromARGB(255, 232, 206, 247).withOpacity(0.5),
                  color: Colors.black12.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(_icons.length, (index) {
                      TabItems icon = _icons[index];
                      return GestureDetector(
                        onTap: () {
                          onTabPress(index, context);
                        },
                        child: CupertinoButton(
                          onPressed: () {
                            onTabPress(index, context);
                          },
                          child: AnimatedOpacity(
                            opacity: _selectedTab == index ? 1 : 0.5,
                            duration: const Duration(milliseconds: 200),
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: -4,
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    height: 4,
                                    width: _selectedTab == index ? 20 : 0,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 36,
                                  width: 36,
                                  child: RiveAnimation.asset(
                                    'assets/Rive/icons.riv',
                                    stateMachines: [icon.stateMachine],
                                    artboard: icon.artboard,
                                    onInit: (artboard) {
                                      onRiveIconInit(artboard, index);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTabPress(int index, BuildContext context) {
    if (_selectedTab != index) {
      setState(() {
        _selectedTab = index;
      });

      _icons[index].status!.change(true);
      Future.delayed(const Duration(seconds: 1), () {
        _icons[index].status!.change(false);
      });

      // Navigate to the corresponding page
      switch (index) {
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileScreen()));
          break;
        case 1:
          Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritePage()));
          break;
        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
          break;
        // Add more cases for additional tabs/pages
      }
    }
  }
}

















// // import 'package:app/shared/utils/rive_utils.dart';
// import 'package:app/shared/ui/widgets/rive/models/tab_item.dart';
// import 'package:app/shared/utils/spacer.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';

// class CustomNavigationBar extends StatefulWidget {
//   const CustomNavigationBar({
//     Key? key,
//     // required this.onTabChange
//   }) : super(key: key);

//   // final Function(int tabIndex) onTabChange;

//   @override
//   State<CustomNavigationBar> createState() => _CustomNavigationBarState();
// }

// final List<TabItems> _icons = TabItems.tabItemsList;

// int _selectedTab = 0;

// void onRiveIconInit(Artboard artboard, index) {
//   final controller =
//       StateMachineController.fromArtboard(artboard, _icons[index].stateMachine);
//   artboard.addController(controller!);
//   _icons[index].status = controller.findInput<bool>('active') as SMIBool;
// }

// class _CustomNavigationBarState extends State<CustomNavigationBar> {
//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.purple,
//                   borderRadius: BorderRadius.circular(28),
//                   //  boxShadow: [
//                   //    BoxShadow(
//                   //      color: Colors.pink,
//                   //      blurRadius: 20,
//                   //      offset: const Offset(0, 20)
//                   //    )
//                   //  ]
//                 ),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: List.generate(_icons.length, (index) {
//                       TabItems icon = _icons[index];
//                       return GestureDetector(
//                         onTap: () {
//                           onTabPress(index);
//                         },
//                         child: CupertinoButton(
//                           onPressed: () {
//                             onTabPress(index);
//                           },
//                           child: AnimatedOpacity(
//                             opacity: _selectedTab == index ? 1 : 0.5,
//                             duration: const Duration(milliseconds: 200),
//                             child: Stack(
//                               clipBehavior: Clip.none,
//                               alignment: Alignment.center,
//                               children: [
//                                 Positioned(
//                                   top: -4,
//                                   child: AnimatedContainer(
//                                     duration: const Duration(milliseconds: 200),
//                                     height: 4,
//                                     width: _selectedTab == index ? 20 : 0,
//                                     decoration: BoxDecoration(
//                                       color: Colors.amber,
//                                       borderRadius: BorderRadius.circular(2),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 36,
//                                   width: 36,
//                                   child: RiveAnimation.asset('assets/Rive.riv',
//                                       stateMachines: [icon.stateMachine],
//                                       artboard: icon.artboard,
//                                       onInit: (artboard) {
//                                     onRiveIconInit(artboard, index);
//                                   }),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     })),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void onTabPress(int index) {
//     if (_selectedTab != index) {
//       setState(() {
//         _selectedTab = index;
//       });
//       // widget.onTabChange(index);

//       _icons[index].status!.change(true);
//       Future.delayed(const Duration(seconds: 1), () {
//         _icons[index].status!.change(false);
//       });
//     }
//   }
// }

 












// Scaffold(
//       bottomNavigationBar: SafeArea(child: Container(
//         padding: EdgeInsets.all(12),
//         margin: EdgeInsets.symmetric(horizontal: 24),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(24))
//         ),
//       )),
//     );


















// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';
// import 'package:app/shared/ui/widgets/rive/models/tab_item.dart';

// class CustomNavigationBar extends StatefulWidget {
//   const CustomNavigationBar({Key? key}) : super(key: key);

//   @override
//   State<CustomNavigationBar> createState() => _CustomNavigationBarState();
// }

// final List<TabItems> _icons = TabItems.tabItemsList;

// void onRiveIconInit(Artboard? artboard, int index) {
//   if (artboard != null) {
//     final controller =
//         StateMachineController.fromArtboard(artboard, _icons[index].stateMachine);
//     artboard.addController(controller!);
//     _icons[index].status = controller.findInput<bool>('active') as SMIBool;
//   }
// }

// void onTabPress(int index) {
//   _icons[index].status!.change(true);
//   Future.delayed(const Duration(seconds: 1), () {
//     _icons[index].status!.change(false);
//   });
// }

// class _CustomNavigationBarState extends State<CustomNavigationBar> {
//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.purple,
//                   borderRadius: BorderRadius.circular(28),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: List.generate(_icons.length, (index) {
//                     TabItems icon = _icons[index];
//                     return GestureDetector(
//                       onTap: () {
//                         onTabPress(index);
//                       },
//                       child: CupertinoButton(
//                         child: SizedBox(
//                           height: 36,
//                           width: 36,
//                           child: RiveAnimation.asset(
//                             'assets/Rive.riv',
//                             stateMachines: [icon.stateMachine],
//                             artboard: icon.artboard,
//                             onInit: (artboard) {
//                               onRiveIconInit(artboard, index);
//                             },
//                           ),
//                         ),
//                         onPressed: () {},
//                       ),
//                     );
//                   }),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }











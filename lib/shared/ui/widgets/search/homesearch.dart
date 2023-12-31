import 'package:flutter/material.dart';

class HomeSearchSliver extends StatelessWidget {
  const HomeSearchSliver({ Key? key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        
  child: Container(
    height: 40,
    padding: EdgeInsets.symmetric(horizontal: 15),
    margin: EdgeInsets.only(right: 30, top: 30, bottom: 20),
    decoration: BoxDecoration(
      color: Color(0xfff6f6f6),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Row(
      children: <Widget>[
        Icon(Icons.search, color: Colors.grey.shade600),
        SizedBox(width: 10),
        Text(
          'Search Pokemon, Move, Ability',
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
      ],
    ),
  ),
    );
}
  }
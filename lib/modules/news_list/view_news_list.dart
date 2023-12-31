// news_list_screen.dart
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/modules/news_list/model/news_modal.dart';
import 'package:app/modules/news_list/repository/news_service.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

const colorizeColors = [
  Colors.amberAccent,
  Colors.blue,
  Color.fromARGB(255, 33, 35, 34),
  Colors.red,
];

class NewsListScreen extends StatefulWidget {
  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  late Future<List<News>> futureNews;
  final NewsService newsService = NewsService();

  @override
  void initState() {
    super.initState();
    futureNews = newsService.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 38, 85),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText('News',
                textStyle: TextStyle(
                    color: Colors.amberAccent,
                    fontFamily: GoogleFonts.lora().fontFamily,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ],
          isRepeatingAnimation: true,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white), // Set the back button color
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(), // Empty container to set the height
        ),
      ),
      body: FutureBuilder<List<News>>(
        future: futureNews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No news available.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final news = snapshot.data![index];
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GlassContainer.clearGlass(
                      height: 100,
                      // width: double.infinity,
                      width: 300,
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(
                              0.03), // Set the desired color and opacity
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          title: AnimatedTextKit(
                            animatedTexts: [
                              ColorizeAnimatedText(
                                news.title,
                                textStyle: TextStyle(
                                    fontFamily: GoogleFonts.lora().fontFamily,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900),
                                colors: colorizeColors,
                              )
                            ],
                          ),
                          subtitle: Text(
                            news.description,
                            style: GoogleFonts.lora(
                                textStyle: TextStyle(
                                    color: Color.fromARGB(255, 227, 224, 224),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w100)),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}











//  import 'package:app/modules/news_list/repository/news_service.dart';
// import 'package:flutter/material.dart';
 
 
// class News {
//   final String title;
//   final String description;

//   News({required this.title, required this.description});
// }

// class NewsListScreen extends StatefulWidget {
//   @override
//   _NewsListScreenState createState() => _NewsListScreenState();
// }

// class _NewsListScreenState extends State<NewsListScreen> {
//   late Future<List<News>> futureNews;
//   final NewsService newsService = NewsService();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     futureNews = newsService.fetchNews();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('News List'),
//       ),
//       body: FutureBuilder<List<News>>(
//         future: futureNews,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No news available.'));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 final news = snapshot.data![index];
//                 return ListTile(
//                   title: Text(news.title),
//                   subtitle: Text(news.description),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

 





//  import 'package:app/modules/home/bloc/news_bloc.dart';
// import 'package:app/shared/utils/spacer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class NewsListPage extends StatefulWidget {
//   const NewsListPage({Key? key}) : super(key: key);

//   @override
//   State<NewsListPage> createState() => _NewsListPageState();
// }


// class _NewsListPageState extends State<NewsListPage> {
//   final _newsBloc = NewsBloc(); // Initialize your NewsBloc properly


// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colors.transparent,
//     body: Stack(
//       children: [
//         // Background Image or Content
//         Image.asset(
//           'assets/images/pokebg.png',
//           fit: BoxFit.cover,
//           width: double.infinity,
//           height: double.infinity,
//         ),

//         // Frosted Glass Container
//         Container(
//           color: Colors.black.withOpacity(0.5),
//         ),

//         // News Content
//         Positioned.fill(
//           child: BlocBuilder<NewsBloc, NewsState>(
//             bloc: _newsBloc,
//             builder: (context, state) {
//               if (state is NewsLoadedSuccessfully) {
//                 return CustomScrollView(
//                   slivers: [
//                     SliverToBoxAdapter(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 80),
//                         child: Text(
//                           'Pokedex News',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 40,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SliverList(
//                       delegate: SliverChildBuilderDelegate(
//                         (BuildContext context, int index) {
//                           return Column(
//                             children: [
//                               hSpace(10),
//                               Container(
//                                 margin: EdgeInsets.fromLTRB(8, 1, 8, 1),
//                                 decoration: BoxDecoration(
//                                   color: Colors.red.withOpacity(0.9),
//                                   borderRadius: BorderRadius.circular(20.0),
//                                 ),
//                                 child: ListTile(
//                                   contentPadding: EdgeInsets.all(10),
//                                   title: Text(
//                                     state.newsList[index]['title'],
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   subtitle: Container(
//                                     alignment: Alignment.bottomLeft,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(100),
//                                       ),
//                                     ),
//                                     child: Text(
//                                       state.newsList[index]['date'],
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                   ),
//                                   leading: CircleAvatar(
//                                     radius: 40,
//                                     backgroundImage: NetworkImage(
//                                       state.newsList[index]['pic'],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                         childCount: state.newsList.length,
//                       ),
//                     ),
//                   ],
//                 );
//               } else {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }
// }






 
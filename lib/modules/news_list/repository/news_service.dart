// news_service.dart
import 'dart:convert';
import 'package:app/api.dart';
import 'package:app/modules/news_list/model/news_modal.dart';
import 'package:http/http.dart' as http;

class NewsService {
  // static const baseUrl = '$baseUrl'; // Replace with your Nest.js backend URL

  Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse('$baseUrl/news'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => News.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}












// import 'dart:convert';

// import 'package:app/api.dart';
// import 'package:app/modules/news_list/view_news_list.dart';
// import 'package:http/http.dart' as http;
 
//  class NewsService{
//   Future<List<News>> fetchNews() async {
//     final response = await http.get(Uri.parse('$baseUrl'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return data.map((item) => News(title: item['title'], description: item['body'])).toList();
//     } else {
//       throw Exception('Failed to load news');
//     }
//   }
//  }
import 'dart:convert';
import 'package:http/http.dart' as http;

class GroupService {
  final String baseUrl;

  GroupService(this.baseUrl);

  Future<String> createGroup(String groupName) async {
    final response = await http.post(
      Uri.parse('$baseUrl/groups/create'),
      body: jsonEncode({'group_name': groupName}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['group_id']; // Replace with the actual response structure
    } else {
      throw Exception('Failed to create group');
    }
  }

  Future<void> joinGroup(String groupId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/groups/join'),
      body: jsonEncode({'group_id': groupId}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to join group');
    }
  }
}

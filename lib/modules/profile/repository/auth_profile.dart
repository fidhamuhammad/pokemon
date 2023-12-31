import 'package:app/api.dart';
import 'package:http/http.dart' as http;


class AuthProfile {
  // static const String baseUrl = 'https://your-api-url.com'; // Replace with your actual API base URL

  Future<http.Response> saveProfileChanges(Map<String, dynamic> updatedProfileData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/saveProfileChanges'), // Replace with your actual API endpoint
      body: updatedProfileData,
      headers: {
        'Content-Type': 'application/json', // Modify based on your API requirements
      },
    );

    return response;
  }
}

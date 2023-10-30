import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:popticle_flutter_unity/common/const/data.dart';
import 'package:riverpod/riverpod.dart';

class ApiService {
  final String baseUrl = ip;

  ApiService();

  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    // This check handles any non-successful status code (outside the 200-299 range)
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Failed with code ${response.statusCode}: ${response.body}');
    }

    return jsonDecode(response.body);
  }
}

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

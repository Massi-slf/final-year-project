import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://10.0.2.2:8000/api"; // Corrected IP

  Future<Map<String, dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products/'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('API Response: $data'); // Print the API response

      if (data is Map<String, dynamic>) {
        return data;
      } else {
        print('Unexpected response format: $data');
        throw Exception('Failed to load products');
      }
    } else {
      print('Failed to load products: ${response.statusCode} ${response.body}');
      throw Exception('Failed to load products');
    }
  }
}

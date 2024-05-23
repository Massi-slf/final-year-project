import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  
  final String baseUrl = "http://192.168.214.193:8000/api"; // Corrected IP

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
  Future<void> deleteProduct(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString('token')!;

    final response = await http.delete(
    
      Uri.parse('$baseUrl/products/$productId/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', 
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete product: ${response.reasonPhrase}');
    }
  }
}

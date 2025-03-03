import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ubi_crm/network/api_services/api_services.i.dart';
import 'package:ubi_crm/network/response.dart';

class ApiService implements IApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  @override
  Future<ApiResponse<dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> payload,
  }) async {

      final Uri url = Uri.parse('$baseUrl$endpoint');
      try {
        http.Response response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(payload),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return ApiResponse.success(response.body, response.statusCode);
        } else {
          final data = jsonDecode(response.body);
          return ApiResponse.failure(data['message'], response.statusCode);
        }
      } catch (e) {
        return ApiResponse.failure('Error during POST request: $e', 500);
      }

  }
}
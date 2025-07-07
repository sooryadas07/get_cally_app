import 'package:dio/dio.dart';
import '../models/sign_up_request_model.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://mock-api.calleyacd.com/api/auth',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  // Register
  Future<String?> register(SignUpRequestModel user) async {
    try {
      final response = await _dio.post('/register', data: user.toJson());

      if (response.statusCode == 201 || response.statusCode == 200) {
        return response.data['message'] ?? 'Registration successful';
      } else {
        return 'Registration failed: ${response.data['message']}';
      }
    } on DioException catch (e) {
      return 'Error: ${e.response?.data['message'] ?? e.message}';
    }
  }

  // Login
  Future<String?> login(String email, String password) async {
    try {
      final response = await _dio.post('/login', data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        return response.data['message'] ?? 'Login successful';
      } else {
        return 'Login failed: ${response.data['message']}';
      }
    } on DioException catch (e) {
      return 'Error: ${e.response?.data['message'] ?? e.message}';
    }
  }
}

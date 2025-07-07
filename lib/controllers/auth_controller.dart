import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/sign_up_request_model.dart';

class AuthController {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://mock-api.calleyacd.com/api/auth',
    headers: {'Content-Type': 'application/json'},
  ));

  Future<String?> registerUser(SignUpRequestModel model) async {
    try {
      final response = await _dio.post('/register', data: model.toJson());

      if (response.statusCode == 201) {
        return null; // success
      } else {
        return 'Registration failed: ${response.statusMessage}';
      }
    } on DioException catch (e) {
      return e.response?.data['message'] ?? e.message;
    } catch (e) {
      return 'Unexpected error: $e';
    }
  }
}

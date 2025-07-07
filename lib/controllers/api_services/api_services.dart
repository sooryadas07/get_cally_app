import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://mock-api.calleyacd.com/api/',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  /// Send OTP
  Future<Response> sendOtp(String email) async {
    try {
      final response = await _dio.post(
        'auth/send-otp',
        data: {'email': email},
      );
      return response;
    } catch (e) {
      throw Exception('Failed to send OTP: $e');
    }
  }

  /// Verify OTP
  Future<Response> verifyOtp(String email, String otp) async {
    try {
      final response = await _dio.post(
        'auth/verify-otp',
        data: {
          'email': email,
          'otp': otp,
        },
      );
      return response;
    } catch (e) {
      throw Exception('Failed to verify OTP: $e');
    }
  }

  /// Get List
  Future<Response> getList(String userId, String email) async {
    try {
      final response = await _dio.get(
        'list',
        queryParameters: {'userId': userId},
        data: {'email': email},
      );
      return response;
    } catch (e) {
      throw Exception('Failed to fetch list: $e');
    }
  }

  Future<Response> getListDetails(String listId, String email) async {
    try {
      final response = await _dio.get(
        'list/$listId',
        data: {'email': email},
      );
      return response;
    } catch (e) {
      throw Exception('Failed to fetch list details: $e');
    }
  }
}

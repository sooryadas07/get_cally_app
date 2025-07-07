import 'package:dio/dio.dart';

class ListController {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://mock-api.calleyacd.com/api/',
    headers: {'Content-Type': 'application/json'},
  ));

  /// Get All Lists for a user
  Future<List<dynamic>?> getList(String userId, String email) async {
    try {
      final response = await _dio.get(
        'list',
        queryParameters: {'userId': userId},
        data: {'email': email}, // unusual but per API docs
      );

      if (response.statusCode == 200) {
        return response.data is List ? response.data : [response.data];
      } else {
        print("Error fetching list: ${response.statusMessage}");
        return null;
      }
    } catch (e) {
      print('Get list failed: $e');
      return null;
    }
  }

  /// Get details of a specific list
  Future<Map<String, dynamic>?> getListDetails(String listId, String email) async {
    try {
      final response = await _dio.get(
        'list/$listId',
        data: {'email': email},
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        print("Error fetching list details: ${response.statusMessage}");
        return null;
      }
    } catch (e) {
      print('Get list details failed: $e');
      return null;
    }
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpServices {
  final String baseUrl;

  HttpServices({required this.baseUrl});

  // GET (Read)
  Future<dynamic> getData(String endpoint, [String? token]) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );

      return _processResponse(response, endpoint);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // POST (Create)
  Future<dynamic> postData(
    String endpoint,
    Map<String, dynamic> data, [
    String? token,
  ]) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: json.encode(data),
      );

      return _processResponse(response, endpoint);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // PUT (Update)
  Future<dynamic> putData(
    String endpoint,
    Map<String, dynamic> data, [
    String? token,
  ]) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: json.encode(data),
      );

      return _processResponse(response, endpoint);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // DELETE
  Future<dynamic> deleteData(String endpoint, [String? token]) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );

      return _processResponse(response, endpoint);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  dynamic _processResponse(http.Response response, String endpoint) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Response from $endpoint: ${response.body}');
      return json.decode(response.body);

    } else {
      throw HttpException(
        'Failed request to $endpoint: ${response.statusCode} ${response.reasonPhrase}',
        uri: Uri.parse('$baseUrl/$endpoint'),
      );
    }
  }

  void _handleError(dynamic e) {
    if (kDebugMode) {
      print("HTTP Error: $e");
    }
  }
}

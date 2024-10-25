import 'dart:convert';

import 'package:flutter_github_users/data/network/model/search_response.dart';
import 'package:flutter_github_users/data/network/model/user_response.dart';
import 'package:flutter_github_users/data/repository.dart';
import 'package:http/http.dart' as http;

class RepositoryImpl implements Repository {
  RepositoryImpl({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  final String baseUrl = "https://api.github.com";

  @override
  Future<UserResponse> getUser(String userId) async {
    final request = Uri.parse("$baseUrl/users").replace(path: userId);
    final response = await _httpClient.get(request);
    if (response.statusCode == 200) {
      return UserResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<SearchResponse> searchUser(String query) async {
    final request =
        Uri.parse("$baseUrl/search/users?q=$query").replace(queryParameters: {
      'q': query,
    });
    final response = await _httpClient.get(request);
    if (response.statusCode == 200) {
      return SearchResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

import 'package:flutter_github_users/data/network/model/search_response.dart';
import 'package:flutter_github_users/data/network/model/user_response.dart';

abstract class Repository {
  Future<SearchResponse> searchUser(String query);

  Future<UserResponse> getUser(String userId);
}

import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  const UserResponse({
    required this.login,
    required this.name,
    required this.avatarUrl,
    required this.repository,
    required this.followers,
    required this.following,
    required this.htmlUrl,
    required this.location,
    required this.company,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  final String login;
  final String? name;
  final String avatarUrl;
  final int repository;
  final int followers;
  final int following;
  final String htmlUrl;
  final String? location;
  final String? company;
}
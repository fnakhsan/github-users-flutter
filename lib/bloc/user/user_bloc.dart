import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_github_users/data/network/model/user_response.dart';
import 'package:flutter_github_users/data/repository.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Repository repository;

  UserBloc({required this.repository}) : super(const UserState.loading()) {
    on<UserEvent>((event, emit) async {
      try {
        UserResponse user = await repository.getUser(event.userId);
        emit(UserState.success(user));
      } catch (e) {
        log(e.toString());
        emit(const UserState.failure());
      }
    });
  }
}

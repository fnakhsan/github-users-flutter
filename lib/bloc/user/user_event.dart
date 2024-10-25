part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  final String userId;
  const UserEvent({required this.userId});

  @override
  List<Object> get props => [userId];
}
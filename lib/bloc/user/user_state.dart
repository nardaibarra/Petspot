part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class LoadingProfileState extends UserState {}

class SuccessUserInfoState extends UserState {
  final CurrentUser currentUser;
  SuccessUserInfoState(this.currentUser);
  @override
  List<Object> get props => [currentUser];
}

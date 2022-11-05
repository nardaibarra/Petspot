part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthenticatedState extends AuthState {
  @override
  List<Object> get props => [];
}

class UnauthenticatedState extends AuthState {
  @override
  List<Object> get props => [];
}

class SuccessAuthSigninState extends AuthState {
  @override
  List<Object> get props => [];
}

class ErrorAuthSigninState extends AuthState {
  @override
  List<Object> get props => [];
}

class SuccessAuthSignOutState extends AuthState {
  @override
  List<Object> get props => [];
}

class ErrorAuthSignOutState extends AuthState {
  @override
  List<Object> get props => [];
}

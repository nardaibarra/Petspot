part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class SuccessLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class ErrorLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class SuccessLogoutState extends LoginState {
  @override
  List<Object> get props => [];
}

class ErrorLogoutState extends LoginState {
  @override
  List<Object> get props => [];
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:petspot/Repositories/user_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserAuth auth = UserAuth();
  AuthBloc() : super(AuthInitial()) {
    on<VerifyAuthenticationEvent>(googleVerifyAuth);
    on<SignOutAuthenticationEvent>(googleLogout);
    on<SignInAuthenticationEvent>(googleLogin);
  }
  FutureOr<void> googleVerifyAuth(event, emit) async {
    if (auth.isSignedIn()) {
      emit(AuthenticatedState());
    } else {
      emit(UnauthenticatedState());
    }
  }

  FutureOr<void> googleLogin(event, emit) async {
    try {
      await auth.signInWithGoogle();
      emit(SuccessAuthSigninState());
    } catch (e) {
      emit(ErrorAuthSigninState());
    }
  }

  FutureOr<void> googleLogout(event, emit) async {
    try {
      await auth.signOutGoogleUser();
      print('logout');
      emit(SuccessAuthSignOutState());
    } catch (e) {
      emit(ErrorAuthSignOutState());
    }
  }
}

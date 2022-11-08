import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:petspot/Repositories/user_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<VerifyAuthenticationEvent>(verifyAuth);
    on<GoogleLogoutEvent>(googleLogout);
    on<GoogleLoginEvent>(googleLogin);
  }
  UserAuth auth = UserAuth();

  void verifyAuth(event, emit) {
    if (auth.isSignedIn()) {
      emit(AuthenticatedState());
    } else {
      emit(UnauthenticatedState());
    }
  }

  FutureOr<void> googleLogout(event, emit) async {
    try {
      await auth.signOutGoogleUser();
      await auth.signOutFirebaseUser();
      emit(LoadingLogoutState());
    } catch (e) {
      emit(ErrorLogoutState());
      print('error logout');
      return;
    }
    emit(SuccessLogoutState());
  }

  FutureOr<void> googleLogin(event, emit) async {
    try {
      await auth.signInWithGoogle();
      emit(SuccessLoginState());
      print('login');
    } catch (e) {
      emit(ErrorLoginState());
      print('error login');
    }
  }
}

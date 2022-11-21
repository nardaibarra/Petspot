import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:petspot/Repositories/user_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<GoogleLoginEvent>(googleLogin);
  }
  UserAuth auth = UserAuth();
  FutureOr<void> googleLogin(event, emit) async {
    try {
      await auth.signInWithGoogle();
      emit(SuccessLogoutState());
      print('login');
    } catch (e) {
      emit(ErrorLoginState());
      print('error login');
    }
  }
}

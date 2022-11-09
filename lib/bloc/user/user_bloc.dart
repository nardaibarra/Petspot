import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:petspot/Repositories/user_details.dart';
import 'package:petspot/classes/user.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetUserInfoEevent>(_getAuthUserInfo);
  }

  FutureOr<void> _getAuthUserInfo(
      GetUserInfoEevent event, Emitter<UserState> emit) async {
    emit(LoadingProfileState());

    try {
      var userDetails = UserDetails();
      CurrentUser currentUser = await userDetails.getUserInfo();
      emit(SuccessUserInfoState(currentUser));
    } catch (e) {
      print('error');
    }
  }
}

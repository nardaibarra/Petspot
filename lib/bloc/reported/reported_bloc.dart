import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:petspot/Repositories/reported_pets.dart';

part 'reported_event.dart';
part 'reported_state.dart';

class ReportedBloc extends Bloc<ReportedEvent, ReportedState> {
  ReportedBloc() : super(ReportedInitial()) {
    on<GetAllReportedPetsEvent>(_getAllReportedPets);
  }
  FutureOr<void> _getAllReportedPets(
      ReportedEvent event, Emitter<ReportedState> emit) async {
    print('1');
    emit(ReportedPetsLoadingState());

    try {
      ReportedPets missingPets = ReportedPets();
      List<dynamic> missingPetsList =
          await missingPets.getAllReportedPetsInfo();
      print(missingPetsList);
      emit(ReportedPetsSuccessState(missingPetsList));
    } catch (e) {
      print(e);
    }
  }
}

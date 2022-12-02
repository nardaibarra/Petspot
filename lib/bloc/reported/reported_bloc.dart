import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:petspot/Repositories/reported_pets.dart';

part 'reported_event.dart';
part 'reported_state.dart';

class ReportedBloc extends Bloc<ReportedEvent, ReportedState> {
  ReportedBloc() : super(ReportedInitial()) {
    on<GetAllReportedPetsEvent>(_getAllReportedPets);
    on<FilterReportedPetsEvent>(_filterReportedPets);
  }
  FutureOr<void> _getAllReportedPets(
      ReportedEvent event, Emitter<ReportedState> emit) async {
    emit(ReportedPetsLoadingState());

    try {
      ReportedPets reportedPets = ReportedPets();
      List<dynamic> reportedPetsList =
          await reportedPets.getAllReportedPetsInfo();
      print(reportedPetsList);
      emit(ReportedPetsSuccessState(reportedPetsList));
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> _filterReportedPets(
      FilterReportedPetsEvent event, Emitter<ReportedState> emit) async {
    emit(ReportedPetsLoadingState());

    try {
      ReportedPets reportedPets = ReportedPets();
      List<dynamic> reportedPetsList =
          await reportedPets.getAllReportedPetsFilteredInfo(
              event.specie, event.breed, event.color, event.size, event.sex);
      emit(ReportedPetsSuccessState(reportedPetsList));
    } catch (e) {
      print(e);
    }
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
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
      Position position = await getCurrentPosition();
      List<dynamic> reportedPetsList =
          await reportedPets.getAllReportedPetsInfo();
      print(reportedPetsList);
      emit(ReportedPetsSuccessState(reportedPetsList, position));
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> _filterReportedPets(
      FilterReportedPetsEvent event, Emitter<ReportedState> emit) async {
    emit(ReportedPetsLoadingState());

    try {
      ReportedPets reportedPets = ReportedPets();
      Position position = await getCurrentPosition();
      List<dynamic> reportedPetsList =
          await reportedPets.getAllReportedPetsFilteredInfo(
              event.specie, event.breed, event.color, event.size, event.sex);
      emit(ReportedPetsSuccessState(reportedPetsList, position));
    } catch (e) {
      print(e);
    }
  }

  Future<Position> getCurrentPosition() async {
    // get current position
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    //  get current position

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:petspot/Repositories/missing_pets.dart';

part 'missing_event.dart';
part 'missing_state.dart';

class MissingBloc extends Bloc<MissingEvent, MissingState> {
  MissingBloc() : super(MissingInitial()) {
    on<GetAllMissingPetsEvent>(_getAllMissingPets);
    on<FilterMissingPetsEvent>(_filterMissingPets);
  }

  FutureOr<void> _getAllMissingPets(
      MissingEvent event, Emitter<MissingState> emit) async {
    emit(MissingPetsLoadingState());

    try {
      MissingPets missingPets = MissingPets();
      List<dynamic> missingPetsList = await missingPets.getAllMissingPetsInfo();
      Position position = await getCurrentPosition();
      emit(MissingPetsSuccessState(missingPetsList, position));
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> _filterMissingPets(
      FilterMissingPetsEvent event, Emitter<MissingState> emit) async {
    emit(MissingPetsLoadingState());

    try {
      MissingPets missingPets = MissingPets();
      Position position = await getCurrentPosition();
      List<dynamic> missingPetsList =
          await missingPets.getAllMissingPetsFilteredInfo(
              event.specie, event.breed, event.color, event.size, event.sex);
      emit(MissingPetsSuccessState(missingPetsList, position));
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

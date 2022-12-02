import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
      emit(MissingPetsSuccessState(missingPetsList));
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> _filterMissingPets(
      FilterMissingPetsEvent event, Emitter<MissingState> emit) async {
    emit(MissingPetsLoadingState());

    try {
      MissingPets missingPets = MissingPets();
      List<dynamic> missingPetsList =
          await missingPets.getAllMissingPetsFilteredInfo(
              event.specie, event.breed, event.color, event.size, event.sex);
      emit(MissingPetsSuccessState(missingPetsList));
    } catch (e) {
      print(e);
    }
  }
}

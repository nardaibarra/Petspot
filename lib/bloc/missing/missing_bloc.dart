import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:petspot/Repositories/missing_pets.dart';

part 'missing_event.dart';
part 'missing_state.dart';

class MissingBloc extends Bloc<MissingEvent, MissingState> {
  MissingBloc() : super(MissingInitial()) {
    on<MissingEvent>(_getAllMissingPets);
  }

  FutureOr<void> _getAllMissingPets(
      MissingEvent event, Emitter<MissingState> emit) async {
    emit(MissingPetsLoadingState());

    try {
      MissingPets missingPets = MissingPets();
      List<dynamic> missingPetsList = await missingPets.getAllMissingPetsInfo();
      print(missingPetsList);
      emit(MissingPetsSuccessState(missingPetsList));
    } catch (e) {}
  }
}

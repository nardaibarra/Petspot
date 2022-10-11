import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pets_event.dart';
part 'pets_state.dart';

class PetsBloc extends Bloc<PetsEvent, PetsState> {
  PetsBloc() : super(PetsInitial()) {
    on<PetsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

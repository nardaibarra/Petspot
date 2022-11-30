import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_image_event.dart';
part 'add_image_state.dart';

class AddImageBloc extends Bloc<AddImageEvent, AddImageState> {
  AddImageBloc() : super(AddImageInitial()) {
    on<AddImageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

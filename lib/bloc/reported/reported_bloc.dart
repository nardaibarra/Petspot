import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reported_event.dart';
part 'reported_state.dart';

class ReportedBloc extends Bloc<ReportedEvent, ReportedState> {
  ReportedBloc() : super(ReportedInitial()) {
    on<ReportedEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

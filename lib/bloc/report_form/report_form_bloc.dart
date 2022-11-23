import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'report_form_event.dart';
part 'report_form_state.dart';

class ReportFormBloc extends Bloc<ReportFormEvent, ReportFormState> {
  ReportFormBloc() : super(ReportFormInitial()) {
    on<NextReportFormEvent>(_navigateNext);
    on<PreviousReportFormEvent>(_navigatePrevious);
  }

  FutureOr<void> _navigateNext(
      NextReportFormEvent event, Emitter<ReportFormState> emit) {
    emit(ReportFormSecondStepState());
  }

  FutureOr<void> _navigatePrevious(
      PreviousReportFormEvent event, Emitter<ReportFormState> emit) {
    emit(ReportFormPreviousStepState());
  }
}

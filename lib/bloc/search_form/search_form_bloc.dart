import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_form_event.dart';
part 'search_form_state.dart';

class SearchFormBloc extends Bloc<SearchFormEvent, SearchFormState> {
  SearchFormBloc() : super(SearchFormInitial()) {
    on<NextSearchFormEvent>(_navigateNext);
  }

  FutureOr<void> _navigateNext(
      NextSearchFormEvent event, Emitter<SearchFormState> emit) {
    emit(SearchFormSecondStepState());
  }
}

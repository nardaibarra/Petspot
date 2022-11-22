part of 'search_form_bloc.dart';

abstract class SearchFormEvent extends Equatable {
  const SearchFormEvent();

  @override
  List<Object> get props => [];
}

class NextSearchFormEvent extends SearchFormEvent {
  @override
  List<Object> get props => [];
}

class PreviousSearchFormEvent extends SearchFormEvent {
  @override
  List<Object> get props => [];
}

class NewSearchFormEvent extends SearchFormEvent {
  @override
  List<Object> get props => [];
}

class PostSearchFormEvent extends SearchFormEvent {
  @override
  List<Object> get props => [];
}

class UpdateDropDownEvent extends SearchFormEvent {
  final String specie;

  UpdateDropDownEvent({
    required this.specie,
  });
  @override
  List<Object> get props => [specie];
}

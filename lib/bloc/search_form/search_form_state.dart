part of 'search_form_bloc.dart';

abstract class SearchFormState extends Equatable {
  const SearchFormState();

  @override
  List<Object> get props => [];
}

class SearchFormInitial extends SearchFormState {}

class SearchFormFirstStepState extends SearchFormState {}

class SearchFormPreviousStepState extends SearchFormState {}

class SearchFormSecondStepState extends SearchFormState {}

class SearchFormSuccesfulPostState extends SearchFormState {}

class SearchFormErrorPostState extends SearchFormState {}

class UpdatedDropdwonState extends SearchFormState {
  final List<String> breedDropDownValues;
  UpdatedDropdwonState(this.breedDropDownValues);
  @override
  List<Object> get props => [breedDropDownValues];
}

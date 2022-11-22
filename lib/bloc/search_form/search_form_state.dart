part of 'search_form_bloc.dart';

abstract class SearchFormState extends Equatable {
  const SearchFormState();

  @override
  List<Object> get props => [];
}

class SearchFormInitial extends SearchFormState {}

class SearchFormFirstStepState extends SearchFormState {}

class SearchFormSecondStepState extends SearchFormState {}

class SearchFormSuccesfulPostState extends SearchFormState {}

class SearchFormErrorPostState extends SearchFormState {}

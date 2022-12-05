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

class SearchFormAnonymousState extends SearchFormState {}

class SearchFormErrorPostState extends SearchFormState {}

class UpdatedDropdwonState extends SearchFormState {
  final List<String> breedDropDownValues;
  UpdatedDropdwonState(this.breedDropDownValues);
  @override
  List<Object> get props => [breedDropDownValues];
}

class FirstImagSelecting extends SearchFormState {}

class FirstImageLoading extends SearchFormState {}

class FirstImageLoadingSucces extends SearchFormState {
  final List<dynamic> images;
  FirstImageLoadingSucces(this.images);
  @override
  List<Object> get props => [images];
}

class FirstImageLoadingError extends SearchFormState {}

class secondImageLoadingSucces extends SearchFormState {
  final List<dynamic> images;
  secondImageLoadingSucces(this.images);
  @override
  List<Object> get props => [images];
}

class secondImageLoadingError extends SearchFormState {}

class thirdImageLoadingSucces extends SearchFormState {
  final List<dynamic> images;
  thirdImageLoadingSucces(this.images);
  @override
  List<Object> get props => [images];
}

class thirdImageLoadingError extends SearchFormState {}

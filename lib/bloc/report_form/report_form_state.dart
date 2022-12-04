part of 'report_form_bloc.dart';

abstract class ReportFormState extends Equatable {
  const ReportFormState();

  @override
  List<Object> get props => [];
}

class ReportFormInitial extends ReportFormState {}

class ReportFormFirstStepState extends ReportFormState {}

class ReportFormPreviousStepState extends ReportFormState {}

class ReportFormSecondStepState extends ReportFormState {}

class ReportFormSuccesfulPostState extends ReportFormState {}

class ReportFormErrorPostState extends ReportFormState {}

class UpdatedDropdwonState extends ReportFormState {
  final List<String> breedDropDownValues;
  UpdatedDropdwonState(this.breedDropDownValues);
  @override
  List<Object> get props => [breedDropDownValues];
}

class FirstImagSelecting extends ReportFormState {}

class FirstImageLoading extends ReportFormState {}

class FirstImageLoadingSucces extends ReportFormState {
  final List<dynamic> images;
  FirstImageLoadingSucces(this.images);
  @override
  List<Object> get props => [images];
}

class FirstImageLoadingError extends ReportFormState {}

class secondImageLoadingSucces extends ReportFormState {
  final List<dynamic> images;
  secondImageLoadingSucces(this.images);
  @override
  List<Object> get props => [images];
}

class secondImageLoadingError extends ReportFormState {}

class thirdImageLoadingSucces extends ReportFormState {
  final List<dynamic> images;
  thirdImageLoadingSucces(this.images);
  @override
  List<Object> get props => [images];
}

class thirdImageLoadingError extends ReportFormState {}

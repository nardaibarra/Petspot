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

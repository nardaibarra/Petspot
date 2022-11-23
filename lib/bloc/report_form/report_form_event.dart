part of 'report_form_bloc.dart';

abstract class ReportFormEvent extends Equatable {
  const ReportFormEvent();

  @override
  List<Object> get props => [];
}

class NextReportFormEvent extends ReportFormEvent {
  @override
  List<Object> get props => [];
}

class PreviousReportFormEvent extends ReportFormEvent {
  @override
  List<Object> get props => [];
}

class NewReportFormEvent extends ReportFormEvent {
  @override
  List<Object> get props => [];
}

class PostReportFormEvent extends ReportFormEvent {
  @override
  List<Object> get props => [];
}

class UpdateDropDownEvent extends ReportFormEvent {
  final String specie;

  UpdateDropDownEvent({
    required this.specie,
  });
  @override
  List<Object> get props => [specie];
}

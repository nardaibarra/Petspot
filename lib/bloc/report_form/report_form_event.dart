part of 'report_form_bloc.dart';

abstract class ReportFormEvent extends Equatable {
  const ReportFormEvent();

  @override
  List<Object> get props => [];
}

class NextReportFormEvent extends ReportFormEvent {
  final String sex;
  final String size;
  final String selectedSpecie;
  final String selectedBreed;
  final String selectedColor;

  NextReportFormEvent(
      {required this.sex,
      required this.size,
      required this.selectedSpecie,
      required this.selectedBreed,
      required this.selectedColor});
  @override
  List<Object> get props =>
      [sex, size, selectedSpecie, selectedBreed, selectedColor];
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

class AddImage1Succes extends ReportFormEvent {
  final File image;

  AddImage1Succes(this.image);

  @override
  List<Object> get props => [image];
}

class AddImage2Succes extends ReportFormEvent {
  final File image;

  AddImage2Succes(this.image);

  @override
  List<Object> get props => [image];
}

class AddImage3Succes extends ReportFormEvent {
  final File image;

  AddImage3Succes(this.image);

  @override
  List<Object> get props => [image];
}

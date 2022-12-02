part of 'reported_bloc.dart';

abstract class ReportedEvent extends Equatable {
  const ReportedEvent();

  @override
  List<Object> get props => [];
}

class GetAllReportedPetsEvent extends ReportedEvent {}

class FilterReportedPetsEvent extends ReportedEvent {
  final String specie;
  final String breed;
  final String color;
  final String size;
  final String sex;
  FilterReportedPetsEvent(
      {required this.specie,
      required this.breed,
      required this.color,
      required this.size,
      required this.sex});
  @override
  List<Object> get props => [specie, breed, color, size, sex];
}

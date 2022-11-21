part of 'reported_bloc.dart';

abstract class ReportedEvent extends Equatable {
  const ReportedEvent();

  @override
  List<Object> get props => [];
}

class GetAllReportedPetsEvent extends ReportedEvent {}

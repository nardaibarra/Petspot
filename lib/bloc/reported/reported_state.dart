part of 'reported_bloc.dart';

abstract class ReportedState extends Equatable {
  const ReportedState();
  
  @override
  List<Object> get props => [];
}

class ReportedInitial extends ReportedState {}

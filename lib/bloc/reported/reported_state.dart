part of 'reported_bloc.dart';

abstract class ReportedState extends Equatable {
  const ReportedState();

  @override
  List<Object> get props => [];
}

class ReportedInitial extends ReportedState {}

class ReportedPetsSuccessState extends ReportedState {
  final List<dynamic> listElements;
  ReportedPetsSuccessState(this.listElements);
  @override
  List<Object> get props => [listElements];
}

class ReportedPetsErrorState extends ReportedState {}

class ReportedPetsLoadingState extends ReportedState {}

class ReportedPetsEmptyState extends ReportedState {}

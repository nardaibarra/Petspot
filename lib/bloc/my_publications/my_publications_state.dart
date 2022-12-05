part of 'my_publications_bloc.dart';

abstract class MyPublicationsState extends Equatable {
  const MyPublicationsState();

  @override
  List<Object> get props => [];
}

class MyPublicationsInitial extends MyPublicationsState {}

class MyReportsSuccesfulState extends MyPublicationsState {
  final List<dynamic> activeListElements;
  final List<dynamic> inactiveListElements;
  MyReportsSuccesfulState(this.activeListElements, this.inactiveListElements);
  @override
  List<Object> get props => [activeListElements, inactiveListElements];
}

class MyPetsSuccesfulState extends MyPublicationsState {
  final List<dynamic> activeListElements;
  final List<dynamic> inactiveListElements;
  MyPetsSuccesfulState(this.activeListElements, this.inactiveListElements);
  @override
  List<Object> get props => [activeListElements, inactiveListElements];
}

class MyReportsLoadingState extends MyPublicationsState {}

class MyPetsLoadingState extends MyPublicationsState {}

class MyReportsErrorState extends MyPublicationsState {}

class MyPetsErrorState extends MyPublicationsState {}

class MyReportsDeactivateSuccesfulState extends MyPublicationsState {}

class MyPetsDeactivateSuccesfulState extends MyPublicationsState {}

class MyReportsDeactivateErrorState extends MyPublicationsState {}

class MyPetsDeactivateErrorState extends MyPublicationsState {}

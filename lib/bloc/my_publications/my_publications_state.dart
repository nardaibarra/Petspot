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

class MyPublicationsLoadingState extends MyPublicationsState {}

class MyReportsErrorState extends MyPublicationsState {}

class MyPetsErrorState extends MyPublicationsState {}

class DeactivateSuccesfulState extends MyPublicationsState {}

class DeactivateErrorState extends MyPublicationsState {}

class MyPublicationsAnonymousState extends MyPublicationsState {}

part of 'missing_bloc.dart';

abstract class MissingState extends Equatable {
  const MissingState();

  @override
  List<Object> get props => [];
}

class MissingInitial extends MissingState {}

class MissingPetsSuccessState extends MissingState {
  final List<dynamic> listElements;
  final Position position;
  MissingPetsSuccessState(this.listElements, this.position);
  @override
  List<Object> get props => [listElements, position];
}

class MissingPetsErrorState extends MissingState {}

class MissingPetsAnonymousState extends MissingState {}

class MissingPetsLoadingState extends MissingState {}

class MissingPetsEmptyState extends MissingState {}

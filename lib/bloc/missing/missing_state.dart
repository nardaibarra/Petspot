part of 'missing_bloc.dart';

abstract class MissingState extends Equatable {
  const MissingState();

  @override
  List<Object> get props => [];
}

class MissingInitial extends MissingState {}

class MissingPetsSuccessState extends MissingState {
  final List<dynamic> listElements;
  MissingPetsSuccessState(this.listElements);
  @override
  List<Object> get props => [listElements];
}

class MissingPetsErrorState extends MissingState {}

class MissingPetsLoadingState extends MissingState {}

class MissingPetsEmptyState extends MissingState {}

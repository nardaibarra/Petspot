part of 'pets_bloc.dart';

abstract class PetsState extends Equatable {
  const PetsState();

  @override
  List<Object> get props => [];
}

class PetsInitial extends PetsState {}

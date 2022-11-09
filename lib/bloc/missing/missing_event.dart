part of 'missing_bloc.dart';

abstract class MissingEvent extends Equatable {
  const MissingEvent();

  @override
  List<Object> get props => [];
}

class GetAllMissingPetsEvent extends MissingEvent {}

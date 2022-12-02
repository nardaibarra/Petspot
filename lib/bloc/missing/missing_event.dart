part of 'missing_bloc.dart';

abstract class MissingEvent extends Equatable {
  const MissingEvent();

  @override
  List<Object> get props => [];
}

class GetAllMissingPetsEvent extends MissingEvent {}

class FilterMissingPetsEvent extends MissingEvent {
  final String specie;
  final String breed;
  final String color;
  final String size;
  final String sex;
  FilterMissingPetsEvent(
      {required this.specie,
      required this.breed,
      required this.color,
      required this.size,
      required this.sex});
  @override
  List<Object> get props => [specie, breed, color, size, sex];
}

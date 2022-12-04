part of 'search_form_bloc.dart';

enum Sex { male, female }

enum Size { small, medium, large }

abstract class SearchFormEvent extends Equatable {
  const SearchFormEvent();

  @override
  List<Object> get props => [];
}

class NextSearchFormEvent extends SearchFormEvent {
  final String name;
  final String sex;
  final String size;
  final String selectedSpecie;
  final String selectedBreed;
  final String selectedColor;

  NextSearchFormEvent({
    required this.name,
    required this.sex,
    required this.size,
    required this.selectedSpecie,
    required this.selectedBreed,
    required this.selectedColor,
  });
  @override
  List<Object> get props =>
      [name, sex, size, selectedBreed, selectedSpecie, selectedColor];
}

class PreviousSearchFormEvent extends SearchFormEvent {
  @override
  List<Object> get props => [];
}

class NewSearchFormEvent extends SearchFormEvent {
  @override
  List<Object> get props => [];
}

class PostSearchFormEvent extends SearchFormEvent {
  final String description;

  PostSearchFormEvent({required this.description});
  @override
  List<Object> get props => [description];
}

class UpdateDropDownEvent extends SearchFormEvent {
  final String specie;

  UpdateDropDownEvent({
    required this.specie,
  });
  @override
  List<Object> get props => [specie];
}

class AddImage1Succes extends SearchFormEvent {
  final File image;

  AddImage1Succes(this.image);

  @override
  List<Object> get props => [image];
}

class AddImage2Succes extends SearchFormEvent {
  final File image;

  AddImage2Succes(this.image);

  @override
  List<Object> get props => [image];
}

class AddImage3Succes extends SearchFormEvent {
  final File image;

  AddImage3Succes(this.image);

  @override
  List<Object> get props => [image];
}

part of 'my_publications_bloc.dart';

abstract class MyPublicationsEvent extends Equatable {
  const MyPublicationsEvent();

  @override
  List<Object> get props => [];
}

class GetMyRerportsEvent extends MyPublicationsEvent {
  @override
  List<Object> get props => [];
}

class GetMyPetsEvent extends MyPublicationsEvent {
  @override
  List<Object> get props => [];
}

class DeactivateMyRerportsEvent extends MyPublicationsEvent {
  @override
  List<Object> get props => [];
}

class DeactivateMyPetsEvent extends MyPublicationsEvent {
  @override
  List<Object> get props => [];
}

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

class DeactivatePostEvent extends MyPublicationsEvent {
  final String docId;
  final String postType;
  DeactivatePostEvent({
    required this.docId,
    required this.postType,
  });
  @override
  List<Object> get props => [docId, postType];
}

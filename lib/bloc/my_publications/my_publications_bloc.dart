import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:petspot/Repositories/my_publications.dart';
import 'package:petspot/Repositories/user_auth.dart';

part 'my_publications_event.dart';
part 'my_publications_state.dart';

class MyPublicationsBloc
    extends Bloc<MyPublicationsEvent, MyPublicationsState> {
  MyPublicationsBloc() : super(MyPublicationsInitial()) {
    on<GetMyPetsEvent>(_getMyPets);
    on<GetMyRerportsEvent>(_getMyReports);
    on<DeactivatePostEvent>(_deactivatePost);
  }

  FutureOr<void> _getMyPets(
      GetMyPetsEvent event, Emitter<MyPublicationsState> emit) async {
    var publications = MyPublications();
    UserAuth auth = UserAuth();
    if (auth.isAnonymous()) {
      emit(MyPublicationsAnonymousState());
      return;
    }
    var activePets = await publications.getAllMyMissingPublications(true);
    var inactivePets = await publications.getAllMyMissingPublications(false);
    emit(MyPetsSuccesfulState(activePets, inactivePets));
  }

  FutureOr<void> _getMyReports(
      GetMyRerportsEvent event, Emitter<MyPublicationsState> emit) async {
    var publications = MyPublications();
    var activePets = await publications.getAllMyReportingPublications(true);
    var inactivePets = await publications.getAllMyReportingPublications(false);
    emit(MyReportsSuccesfulState(activePets, inactivePets));
  }

  FutureOr<void> _deactivatePost(
      DeactivatePostEvent event, Emitter<MyPublicationsState> emit) async {
    var publications = MyPublications();

    publications.deactivatePost(event.postType, event.docId);
    emit(DeactivateSuccesfulState());

    emit(MyPublicationsLoadingState());
    if (event.postType == 'mascotas_vistas') {
      var activePets = await publications.getAllMyReportingPublications(true);
      var inactivePets =
          await publications.getAllMyReportingPublications(false);
      emit(MyReportsSuccesfulState(activePets, inactivePets));
    } else {
      var activePets = await publications.getAllMyMissingPublications(true);
      var inactivePets = await publications.getAllMyMissingPublications(false);
      emit(MyPetsSuccesfulState(activePets, inactivePets));
    }
  }
}

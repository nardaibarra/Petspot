import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:petspot/Repositories/my_publications.dart';

part 'my_publications_event.dart';
part 'my_publications_state.dart';

class MyPublicationsBloc
    extends Bloc<MyPublicationsEvent, MyPublicationsState> {
  MyPublicationsBloc() : super(MyPublicationsInitial()) {
    on<GetMyPetsEvent>(_getMyPets);
    on<GetMyRerportsEvent>(_getMyReports);
    on<DeactivateMyPetsEvent>(_deactivateMyPet);
    on<DeactivateMyRerportsEvent>(_deactivateMyReport);
  }

  FutureOr<void> _getMyPets(
      GetMyPetsEvent event, Emitter<MyPublicationsState> emit) async {
    var publications = MyPublications();
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

  FutureOr<void> _deactivateMyPet(
      DeactivateMyPetsEvent event, Emitter<MyPublicationsState> emit) {}

  FutureOr<void> _deactivateMyReport(
      DeactivateMyRerportsEvent event, Emitter<MyPublicationsState> emit) {}
}

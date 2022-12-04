import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';

import '../../Repositories/image.dart';

part 'report_form_event.dart';
part 'report_form_state.dart';

class ReportFormBloc extends Bloc<ReportFormEvent, ReportFormState> {
  String? sex;
  String? size;
  String? selectedSpecie;
  String? selectedBreed;
  String? selectedColor;
  double? lat;
  double? lng;
  List<dynamic> photos = [];
  var imageRepo = ImageRepo();

  ReportFormBloc() : super(ReportFormInitial()) {
    on<NextReportFormEvent>(_navigateNext);
    on<PreviousReportFormEvent>(_navigatePrevious);
    on<AddImage1Succes>(_addImage1);
    on<AddImage2Succes>(_addImage2);
    on<AddImage3Succes>(_addImage3);
    on<PostReportFormEvent>(_post);
  }

  FutureOr<void> _navigateNext(
      NextReportFormEvent event, Emitter<ReportFormState> emit) {
    sex = event.sex;
    size = event.size;
    selectedBreed = event.selectedBreed;
    selectedColor = event.selectedColor;
    selectedSpecie = event.selectedSpecie;
    emit(ReportFormSecondStepState());
  }

  FutureOr<void> _navigatePrevious(
      PreviousReportFormEvent event, Emitter<ReportFormState> emit) {
    emit(ReportFormPreviousStepState());
  }

  Future<FutureOr<void>> _addImage1(
      AddImage1Succes event, Emitter<ReportFormState> emit) async {
    try {
      photos.add(await imageRepo.uploadPictureStorage(event.image));
      emit(FirstImageLoadingSucces(photos));
    } catch (e) {
      emit(FirstImageLoadingError());
    }
  }

  Future<FutureOr<void>> _addImage2(
      AddImage2Succes event, Emitter<ReportFormState> emit) async {
    try {
      photos.add(await imageRepo.uploadPictureStorage(event.image));
      emit(secondImageLoadingSucces(photos));
    } catch (e) {
      emit(secondImageLoadingError());
    }
  }

  Future<FutureOr<void>> _addImage3(
      AddImage3Succes event, Emitter<ReportFormState> emit) async {
    try {
      photos.add(await imageRepo.uploadPictureStorage(event.image));
      emit(thirdImageLoadingSucces(photos));
    } catch (e) {
      emit(thirdImageLoadingError());
    }
  }

  FutureOr<void> _post(
      PostReportFormEvent event, Emitter<ReportFormState> emit) async {
    await getCurrentPosition();
    var currentUser = FirebaseAuth.instance.currentUser;

    try {
      await FirebaseFirestore.instance.collection('mascotas_vistas').add({
        'active': true,
        'color': selectedColor,
        'correoUsuario': currentUser!.email,
        'especie': selectedSpecie,
        'raza': selectedBreed,
        'fotos': photos,
        'sexo': sex,
        'talla': size,
        'telUsuario': currentUser.phoneNumber,
        'timestamp': Timestamp.now(),
        'latitud': lat,
        'longitud': lng,
        'usuario': currentUser.displayName,
        'usuarioID': currentUser.uid
      });
      photos.clear();
      emit(ReportFormSuccesfulPostState());
    } catch (e) {
      emit(ReportFormErrorPostState());
    }
  }

  Future<void> getCurrentPosition() async {
    // get current position
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    //  get current position

    var currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    lat = currentPosition.latitude;
    lng = currentPosition.longitude;
  }
}

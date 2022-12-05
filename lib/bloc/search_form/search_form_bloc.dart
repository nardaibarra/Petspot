import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petspot/Repositories/forms.dart';
import 'package:petspot/Repositories/image.dart';

part 'search_form_event.dart';
part 'search_form_state.dart';

class SearchFormBloc extends Bloc<SearchFormEvent, SearchFormState> {
  String? name;
  String? sex;
  String? size;
  String? selectedSpecie;
  String? selectedBreed;
  String? selectedColor;
  double? lat;
  double? lng;
  List<dynamic> photos = [];
  var imageRepo = ImageRepo();

  SearchFormBloc() : super(SearchFormInitial()) {
    on<NextSearchFormEvent>(_navigateNext);
    on<PreviousSearchFormEvent>(_navigatePrevious);
    on<AddImage1Succes>(_addImage1);
    on<AddImage2Succes>(_addImage2);
    on<AddImage3Succes>(_addImage3);
    on<PostSearchFormEvent>(_post);
  }

  FutureOr<void> _navigateNext(
      NextSearchFormEvent event, Emitter<SearchFormState> emit) {
    name = event.name;
    sex = event.sex;
    size = event.size;
    selectedBreed = event.selectedBreed;
    selectedColor = event.selectedColor;
    selectedSpecie = event.selectedSpecie;

    emit(SearchFormSecondStepState());
  }

  FutureOr<void> _navigatePrevious(
      PreviousSearchFormEvent event, Emitter<SearchFormState> emit) {
    emit(SearchFormPreviousStepState());
  }

  Future<FutureOr<void>> _addImage1(
      AddImage1Succes event, Emitter<SearchFormState> emit) async {
    try {
      photos.add(await imageRepo.uploadPictureStorage(event.image));
      emit(FirstImageLoadingSucces(photos));
    } catch (e) {
      emit(FirstImageLoadingError());
    }
  }

  Future<FutureOr<void>> _addImage2(
      AddImage2Succes event, Emitter<SearchFormState> emit) async {
    try {
      photos.add(await imageRepo.uploadPictureStorage(event.image));
      emit(secondImageLoadingSucces(photos));
    } catch (e) {
      emit(secondImageLoadingError());
    }
  }

  Future<FutureOr<void>> _addImage3(
      AddImage3Succes event, Emitter<SearchFormState> emit) async {
    try {
      photos.add(await imageRepo.uploadPictureStorage(event.image));
      emit(thirdImageLoadingSucces(photos));
    } catch (e) {
      emit(thirdImageLoadingError());
    }
  }

  FutureOr<void> _post(
      PostSearchFormEvent event, Emitter<SearchFormState> emit) async {
    //await getCurrentPosition();
    var currentUser = FirebaseAuth.instance.currentUser;
    Geolocator geolocator = Geolocator();

    try {
      await FirebaseFirestore.instance.collection('mascotas_perdidas').add({
        'active': true,
        'color': selectedColor,
        'correoUsuario': currentUser!.email,
        'especie': selectedSpecie,
        'raza': selectedBreed,
        'fotos': photos,
        'nombre': name,
        'sexo': sex,
        'talla': size,
        'telUsuario': currentUser.phoneNumber,
        'detalles': event.description,
        'timestamp': Timestamp.now(),
        'latitud': lat,
        'longitud': lng,
        'usuario': currentUser.displayName,
        'usuarioID': currentUser.uid
      });
      photos.clear();
      emit(SearchFormSuccesfulPostState());
    } catch (e) {
      emit(SearchFormErrorPostState());
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

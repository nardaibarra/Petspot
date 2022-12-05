import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

import 'package:petspot/Repositories/user_auth.dart';
import 'package:petspot/classes/reportedPet.dart';

class ReportedPets {
  static final ReportedPets _singleton = ReportedPets._internal();
  final FirebaseFirestore _fireBaseStore = FirebaseFirestore.instance;

  factory ReportedPets() {
    return _singleton;
  }
  UserAuth auth = UserAuth();
  Position nullPosition = Position(
      longitude: 0,
      latitude: 0,
      timestamp: null,
      accuracy: 0,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0);
  Future<List<dynamic>> getAllReportedPetsInfo() async {
    List reportedPetsList = [];
    var reportedPetsDataQuery = await _fireBaseStore
        .collection('mascotas_vistas')
        .where('active', isEqualTo: true)
        .get();
    var reportedPetsDocs =
        reportedPetsDataQuery.docs.map((doc) => doc.data()).toList();
    reportedPetsDocs.forEach((element) {
      String name = element['nombre'] ?? '-';
      String specie = element['especie'] ?? '-';
      String breed = element['raza'] ?? '-';
      String color = element['color'] ?? '-';
      String size = element['talla'] ?? '-';
      String user = element['usuario'] ?? '-';
      String userId = element['usuarioId'] ?? '-';
      List<dynamic> photos = element['fotos'] ?? [];
      String telephone = element['telefono'] ?? '-';
      String sex = element['sexo'] ?? '-';
      Timestamp timestamp = element['timestamp'] ?? Timestamp.now();
      double latitud = element['latitud'] ?? 0;
      double longitud = element['longitud'] ?? 0;
      print(photos);
      print(name);
      reportedPetsList.add(ReportedPet(
          specie: specie,
          breed: breed,
          color: color,
          size: size,
          user: user,
          userId: userId,
          photos: photos,
          sex: sex,
          telephone: telephone,
          timestamp: timestamp,
          latitud: latitud,
          longitud: longitud));
    });
    return reportedPetsList;
  }

  Future<List<dynamic>> getAllReportedPetsFilteredInfo(
      specie, breed, color, size, sex) async {
    var specieFilter = specie;
    var breedFilter = breed;
    var colorFilter = color;
    var sizeFilter = size;
    var sexFilter = sex;

    List reportedPetsList = [];

    var reportedPetsDataQuery = await _fireBaseStore
        .collection('mascotas_vistas')
        .where('active', isEqualTo: true);

    if (specieFilter != '' && specieFilter != 'todas') {
      reportedPetsDataQuery =
          reportedPetsDataQuery.where('especie', isEqualTo: specie);
    }
    if (breedFilter != '' && specieFilter != 'todas') {
      reportedPetsDataQuery =
          reportedPetsDataQuery.where('raza', isEqualTo: breed);
    }
    if (colorFilter != '' && specieFilter != 'todos') {
      reportedPetsDataQuery =
          reportedPetsDataQuery.where('color', isEqualTo: color);
    }
    if (sizeFilter != '') {
      reportedPetsDataQuery =
          reportedPetsDataQuery.where('talla', isEqualTo: size);
    }
    if (sexFilter != '') {
      reportedPetsDataQuery =
          reportedPetsDataQuery.where('sexo', isEqualTo: sex);
    }
    var query = await reportedPetsDataQuery.get();

    var reportedPetsDocs = query.docs.map((doc) => doc.data()).toList();
    reportedPetsDocs.forEach((element) {
      String specie = element['especie'] ?? '-';
      String breed = element['raza'] ?? '-';
      String color = element['color'] ?? '-';
      String size = element['talla'] ?? '-';
      String user = element['usuario'] ?? '-';
      String userId = element['usuarioId'] ?? '-';
      List<dynamic> photos = element['fotos'] ?? [];
      String telephone = element['telefono'] ?? '-';
      String sex = element['sexo'] ?? '-';
      Timestamp timestamp = element['timestamp'] ?? Timestamp.now();
      double latitud = element['latitud'] ?? 0;
      double longitud = element['longitud'] ?? 0;
      reportedPetsList.add(ReportedPet(
          specie: specie,
          breed: breed,
          color: color,
          size: size,
          user: user,
          userId: userId,
          photos: photos,
          sex: sex,
          telephone: telephone,
          timestamp: timestamp,
          latitud: latitud,
          longitud: longitud));
    });
    return reportedPetsList;
  }

  ReportedPets._internal();
}

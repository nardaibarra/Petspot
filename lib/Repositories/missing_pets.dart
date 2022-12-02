import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:petspot/Repositories/user_auth.dart';
import 'package:petspot/classes/missingPet.dart';

class MissingPets {
  static final MissingPets _singleton = MissingPets._internal();
  final FirebaseFirestore _fireBaseStore = FirebaseFirestore.instance;

  factory MissingPets() {
    return _singleton;
  }
  UserAuth auth = UserAuth();

  Future<List<dynamic>> getAllMissingPetsInfo() async {
    List missingPetsList = [];
    var missingPetsDataQuery = await _fireBaseStore
        .collection('mascotas_perdidas')
        .where('active', isEqualTo: true)
        .get();
    var missingPetsDocs =
        missingPetsDataQuery.docs.map((doc) => doc.data()).toList();

    missingPetsDocs.forEach((element) {
      String name = element['nombre'] ?? '-';
      String specie = element['especie'] ?? '-';
      String breed = element['raza'] ?? '-';
      String color = element['color'] ?? '-';
      String size = element['talla'] ?? '-';
      String user = element['usuario'] ?? '-';
      String userId = element['usuarioId'] ?? '-';
      List<dynamic> photos = element['fotos'] ?? [];
      String details = element['detalles'] ?? '-';
      String telephone = element['telefono'] ?? '-';
      String sex = element['sexo'] ?? '-';
      Timestamp timestamp = element['timestamp'] ?? Timestamp.now();
      print(photos);
      print(name);
      missingPetsList.add(MissingPet(
          name: name,
          specie: specie,
          breed: breed,
          color: color,
          size: size,
          user: user,
          userId: userId,
          photos: photos,
          sex: sex,
          telephone: telephone,
          details: details,
          timestamp: timestamp));
    });
    return missingPetsList;
  }

  Future<List<dynamic>> getAllMissingPetsFilteredInfo(
      specie, breed, color, size, sex) async {
    var specieFilter = specie;
    var breedFilter = breed;
    var colorFilter = color;
    var sizeFilter = size;
    var sexFilter = sex;
    List missingPetsList = [];
    var missingPetsDataQuery = await _fireBaseStore
        .collection('mascotas_perdidas')
        .where('active', isEqualTo: true);
    print(specieFilter);
    if (specieFilter != '' && specieFilter != 'todas') {
      missingPetsDataQuery =
          missingPetsDataQuery.where('especie', isEqualTo: specie);
    }
    if (breedFilter != '' && specieFilter != 'todas') {
      missingPetsDataQuery =
          missingPetsDataQuery.where('raza', isEqualTo: breed);
    }
    if (colorFilter != '' && specieFilter != 'todos') {
      missingPetsDataQuery =
          missingPetsDataQuery.where('color', isEqualTo: color);
    }
    if (sizeFilter != '') {
      missingPetsDataQuery =
          missingPetsDataQuery.where('talla', isEqualTo: size);
    }
    if (sexFilter != '') {
      missingPetsDataQuery = missingPetsDataQuery.where('sexo', isEqualTo: sex);
    }
    var query = await missingPetsDataQuery.get();

    var missingPetsDocs = query.docs.map((doc) => doc.data()).toList();

    missingPetsDocs.forEach((element) {
      String name = element['nombre'] ?? '-';
      String specie = element['especie'] ?? '-';
      String breed = element['raza'] ?? '-';
      String color = element['color'] ?? '-';
      String size = element['talla'] ?? '-';
      String user = element['usuario'] ?? '-';
      String userId = element['usuarioId'] ?? '-';
      List<dynamic> photos = element['fotos'] ?? [];
      String details = element['detalles'] ?? '-';
      String telephone = element['telefono'] ?? '-';
      String sex = element['sexo'] ?? '-';
      Timestamp timestamp = element['timestamp'] ?? Timestamp.now();
      print(photos);
      print(name);
      missingPetsList.add(MissingPet(
          name: name,
          specie: specie,
          breed: breed,
          color: color,
          size: size,
          user: user,
          userId: userId,
          photos: photos,
          sex: sex,
          details: details,
          telephone: telephone,
          timestamp: timestamp));
    });
    return missingPetsList;
  }

  MissingPets._internal();
}

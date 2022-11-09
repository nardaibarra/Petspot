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
    var missingPetsDataQuery =
        await _fireBaseStore.collection('mascotas_perdidas').get();
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
      String photo1 = element['foto_1'] ?? '-';
      String photo2 = element['foto_2'] ?? '-';
      String photo3 = element['foto_3'] ?? '-';
      String telephone = element['telefono'] ?? '-';
      String sex = element['sexo'] ?? '-';
      Timestamp timestamp = element['timestamp'] ?? Timestamp.now();

      missingPetsList.add(MissingPet(
          name: name,
          specie: specie,
          breed: breed,
          color: color,
          size: size,
          user: user,
          userId: userId,
          photo1: photo1,
          photo2: photo2,
          photo3: photo3,
          sex: sex,
          telephone: telephone,
          timestamp: timestamp));
    });
    return missingPetsList;
  }

  MissingPets._internal();
}

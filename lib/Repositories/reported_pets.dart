import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:petspot/Repositories/user_auth.dart';
import 'package:petspot/classes/reportedPet.dart';

class ReportedPets {
  static final ReportedPets _singleton = ReportedPets._internal();
  final FirebaseFirestore _fireBaseStore = FirebaseFirestore.instance;

  factory ReportedPets() {
    return _singleton;
  }
  UserAuth auth = UserAuth();

  Future<List<dynamic>> getAllReportedPetsInfo() async {
    List ReportedPetsList = [];
    var ReportedPetsDataQuery = await _fireBaseStore
        .collection('mascotas_vistas')
        .where('active', isEqualTo: true)
        .get();
    var ReportedPetsDocs =
        ReportedPetsDataQuery.docs.map((doc) => doc.data()).toList();

    ReportedPetsDocs.forEach((element) {
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
      print(photos);
      print(name);
      ReportedPetsList.add(ReportedPet(
          specie: specie,
          breed: breed,
          color: color,
          size: size,
          user: user,
          userId: userId,
          photos: photos,
          sex: sex,
          telephone: telephone,
          timestamp: timestamp));
    });
    return ReportedPetsList;
  }

  ReportedPets._internal();
}

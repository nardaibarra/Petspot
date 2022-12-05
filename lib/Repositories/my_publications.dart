import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petspot/Repositories/user_auth.dart';
import 'package:petspot/classes/missingPublication.dart';

import 'package:petspot/classes/reportPublication.dart';
import 'package:collection/collection.dart';

class MyPublications {
  static final MyPublications _singleton = MyPublications._internal();
  final FirebaseFirestore _fireBaseStore = FirebaseFirestore.instance;

  factory MyPublications() {
    return _singleton;
  }
  UserAuth auth = UserAuth();
  Future<List<dynamic>> getAllMyMissingPublications(
      bool activeOrInactive) async {
    List myPublicationsList = [];
    var myPublicationsDataQuery = await _fireBaseStore
        .collection('mascotas_perdidas')
        .where('active', isEqualTo: activeOrInactive)
        .where('usuarioId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    var myPublicationsDocs =
        myPublicationsDataQuery.docs.map((doc) => doc.data()).toList();
    var ids = myPublicationsDataQuery.docs.map((doc) => doc.id).toList();
    print(ids);
    myPublicationsDocs.forEachIndexed((index, element) {
      String docId = ids[index];
      bool active = element['active'] ?? false;
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
      double latitud = element['latitud'] ?? 0;
      double longitud = element['longitud'] ?? 0;
      print(docId);
      myPublicationsList.add(MissingPublication(
          docId: docId,
          active: active,
          name: name,
          specie: specie,
          breed: breed,
          color: color,
          size: size,
          user: user,
          userId: userId,
          photos: photos,
          latitude: latitud,
          longitude: longitud,
          sex: sex,
          telephone: telephone,
          details: details,
          timestamp: timestamp));
    });
    print(myPublicationsList);

    return myPublicationsList;
  }

  Future<List<dynamic>> getAllMyReportingPublications(
      bool activeOrInactive) async {
    List myPublicationsList = [];
    var myPublicationsDataQuery = await _fireBaseStore
        .collection('mascotas_vistas')
        .where('active', isEqualTo: activeOrInactive)
        .where('usuarioId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    var myPublicationsDocs =
        myPublicationsDataQuery.docs.map((doc) => doc.data()).toList();
    var ids = myPublicationsDataQuery.docs.map((doc) => doc.id).toList();
    print(ids);
    myPublicationsDocs.forEachIndexed((index, element) {
      String docId = ids[index];
      String specie = element['especie'] ?? '-';
      String breed = element['raza'] ?? '-';
      String color = element['color'] ?? '-';
      bool active = element['active'] ?? false;
      String size = element['talla'] ?? '-';
      String user = element['usuario'] ?? '-';
      String userId = element['usuarioId'] ?? '-';
      List<dynamic> photos = element['fotos'] ?? [];
      String details = element['detalles'] ?? '-';
      String telephone = element['telefono'] ?? '-';
      String sex = element['sexo'] ?? '-';
      double latitud = element['latitud'] ?? 0;
      double longitud = element['longitud'] ?? 0;
      Timestamp timestamp = element['timestamp'] ?? Timestamp.now();
      myPublicationsList.add(ReportPublication(
          active: active,
          docId: docId,
          specie: specie,
          breed: breed,
          color: color,
          size: size,
          user: user,
          latitude: latitud,
          longitude: longitud,
          userId: userId,
          photos: photos,
          sex: sex,
          telephone: telephone,
          details: details,
          timestamp: timestamp));
    });
    return myPublicationsList;
  }

  Future<void> deactivatePost(String postType, String docId) async {
    try {
      _fireBaseStore.collection(postType).doc(docId).update({'active': false});
    } catch (e) {
      print('error');
    }
  }

  MyPublications._internal();
}

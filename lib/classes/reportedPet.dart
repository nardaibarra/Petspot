import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class ReportedPet {
  final String specie;
  final String breed;
  final String color;
  final String size;
  final String user;
  final String sex;
  final Timestamp timestamp;
  final String telephone;
  final String userId;
  final List<dynamic> photos;
  final double latitud;
  final double longitud;

  ReportedPet({
    required this.specie,
    required this.telephone,
    required this.breed,
    required this.color,
    required this.size,
    required this.sex,
    required this.timestamp,
    required this.user,
    required this.userId,
    required this.photos,
    required this.latitud,
    required this.longitud,
  });
}

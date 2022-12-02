import 'package:cloud_firestore/cloud_firestore.dart';

class MissingPet {
  final String name;
  final String specie;
  final String breed;
  final String color;
  final String size;
  final String user;
  final String sex;
  final Timestamp timestamp;
  final String telephone;
  final String userId;
  final String details;
  final List<dynamic> photos;

  MissingPet({
    required this.name,
    required this.specie,
    required this.telephone,
    required this.breed,
    required this.color,
    required this.size,
    required this.sex,
    required this.timestamp,
    required this.user,
    required this.userId,
    required this.details,
    required this.photos,
  });
}

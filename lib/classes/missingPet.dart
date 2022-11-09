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
  final String photo1;
  final String photo2;
  final String photo3;

  MissingPet(
      {required this.name,
      required this.specie,
      required this.telephone,
      required this.breed,
      required this.color,
      required this.size,
      required this.sex,
      required this.timestamp,
      required this.user,
      required this.userId,
      required this.photo1,
      required this.photo2,
      required this.photo3});
}

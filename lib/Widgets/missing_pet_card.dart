import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petspot/classes/missingPet.dart';

class MissingPetCard extends StatelessWidget {
  final MissingPet pet;
  MissingPetCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Column(
              children: [
                Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: NetworkImage(pet.photo1), fit: BoxFit.cover),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 110,
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${pet.name} - ${pet.specie}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  Text('Talla:  ${pet.size}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10)),
                                  Text('Color:  ${pet.color}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10)),
                                  Text('Sexo:  ${pet.sex}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10)),
                                  Text('Raza:  ${pet.breed}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10)),
                                  Text(
                                      'Se perdio hace ${(DateTime.now().difference(DateTime.parse(pet.timestamp.toDate().toString()))).inHours} horas a 10 km de ti',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10)),
                                ]))),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 95,
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Publicado por ${pet.user}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10)),
                                  IconButton(
                                    icon: Icon(FontAwesomeIcons.phone),
                                    color: Colors.black,
                                    onPressed: () async {
                                      FlutterPhoneDirectCaller.callNumber(
                                          pet.telephone);
                                    },
                                  ),
                                ]))),
                  ],
                )
              ],
            )));
  }
}

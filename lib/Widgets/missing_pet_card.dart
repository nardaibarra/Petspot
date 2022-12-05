import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:petspot/Screens/maps.dart';
import 'package:petspot/classes/missingPet.dart';
import 'package:provider/provider.dart';

import '../providers/maps_provider.dart';

class MissingPetCard extends StatefulWidget {
  final MissingPet pet;
  final Position position;
  MissingPetCard({super.key, required this.pet, required this.position});

  @override
  State<MissingPetCard> createState() => _MissingPetCardState();
}

class _MissingPetCardState extends State<MissingPetCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(children: [
          Container(
            height: 250,
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.8,
                padEnds: true,
                viewportFraction: 0.9,
              ),
              items: widget.pet.photos
                  .map((item) => Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(item), fit: BoxFit.cover),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${widget.pet.name} - ${widget.pet.specie}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      Text('Talla:  ${widget.pet.size}',
                          style: TextStyle(color: Colors.black, fontSize: 10)),
                      Text('Color:  ${widget.pet.color}',
                          style: TextStyle(color: Colors.black, fontSize: 10)),
                      Text('Sexo:  ${widget.pet.sex}',
                          style: TextStyle(color: Colors.black, fontSize: 10)),
                      Text('Raza:  ${widget.pet.breed}',
                          style: TextStyle(color: Colors.black, fontSize: 10)),
                      Text(
                          'Se perdió hace ${(DateTime.now().difference(DateTime.parse(widget.pet.timestamp.toDate().toString()))).inHours} horas a ${((Geolocator.distanceBetween(widget.pet.latitud, widget.pet.longitud, widget.position.latitude, widget.position.longitude)) / 1000).toStringAsFixed(1)} km de ti',
                          style: TextStyle(color: Colors.black, fontSize: 10)),
                    ])),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Publicado por ${widget.pet.user}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          detailsDialog(context, widget.pet.details);
                        },
                        child: Text('Ver detalles',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 10)),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          Provider.of<MapaProvider>(context, listen: false)
                              .saveLatitud(widget.pet.latitud);
                          Provider.of<MapaProvider>(context, listen: false)
                              .savelongitud(widget.pet.longitud);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => mapsPage()));
                        },
                        child: Text('Ver en mapa',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 10)),
                      ),
                      IconButton(
                        icon: Icon(FontAwesomeIcons.phone),
                        color: Colors.black,
                        onPressed: () async {
                          FlutterPhoneDirectCaller.callNumber(
                              widget.pet.telephone);
                        },
                      ),
                    ])),
          ],
        )
      ],
    );
  }

  detailsDialog(BuildContext context, String details) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.grey.shade600),
      title: Text("Detalles"),
      content: Text(
        details,
        style: TextStyle(color: Colors.grey.shade700),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

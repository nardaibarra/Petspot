import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:petspot/classes/reportedPet.dart';
import 'package:provider/provider.dart';

import '../Screens/maps.dart';
import '../providers/maps_provider.dart';

class ReportedPetCard extends StatefulWidget {
  final ReportedPet pet;
  final Position position;

  ReportedPetCard({super.key, required this.pet, required this.position});

  @override
  State<ReportedPetCard> createState() => _ReportedPetCardState();
}

class _ReportedPetCardState extends State<ReportedPetCard> {
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
                width: MediaQuery.of(context).size.width / 2.3,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${widget.pet.specie}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          Text('Talla:  ${widget.pet.size}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10)),
                          Text('Color:  ${widget.pet.color}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10)),
                          Text('Sexo:  ${widget.pet.sex}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10)),
                          Text('Raza:  ${widget.pet.breed}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10)),
                          Text(
                              'Se vio hace ${(DateTime.now().difference(DateTime.parse(widget.pet.timestamp.toDate().toString()))).inHours} horas a ${((Geolocator.distanceBetween(widget.pet.latitud, widget.pet.longitud, widget.position.latitude, widget.position.longitude)) / 1000).toStringAsFixed(1)} km de ti',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10)),
                        ]))),
            Container(
                width: MediaQuery.of(context).size.width / 2.3,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Publicado por ${widget.pet.user}',
                          textAlign: TextAlign.right,
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
}

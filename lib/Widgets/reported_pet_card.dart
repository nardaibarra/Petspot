import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petspot/classes/reportedPet.dart';

class ReportedPetCard extends StatefulWidget {
  final ReportedPet pet;

  ReportedPetCard({super.key, required this.pet});

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
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                height: 140,
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
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
                              'Se perdio hace ${(DateTime.now().difference(DateTime.parse(widget.pet.timestamp.toDate().toString()))).inHours} horas a 10 km de ti',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 10)),
                        ]))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 95,
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Publicado por ${widget.pet.user}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10)),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.phone),
                            color: Colors.black,
                            onPressed: () async {
                              FlutterPhoneDirectCaller.callNumber(
                                  widget.pet.telephone);
                            },
                          ),
                        ]))),
          ],
        )
      ],
    );
  }
}

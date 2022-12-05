import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:petspot/classes/missingPublication.dart';

class MissingPublicationCard extends StatefulWidget {
  final MissingPublication pet;
  final bool active;
  MissingPublicationCard({super.key, required this.pet, required this.active});

  @override
  State<MissingPublicationCard> createState() => _MissingPublicationCardState();
}

class _MissingPublicationCardState extends State<MissingPublicationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.all(10),
        child: Row(children: [
          Container(
            margin: EdgeInsets.all(4),
            height: 120,
            width: 120,
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.2,
                padEnds: true,
                viewportFraction: 1,
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
          Container(
            margin: EdgeInsets.all(10),
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
                      style: TextStyle(color: Colors.black, fontSize: 8)),
                  Text('Color:  ${widget.pet.color}',
                      style: TextStyle(color: Colors.black, fontSize: 8)),
                  Text('Sexo:  ${widget.pet.sex}',
                      style: TextStyle(color: Colors.black, fontSize: 8)),
                  Text('Raza:  ${widget.pet.breed}',
                      style: TextStyle(color: Colors.black, fontSize: 8)),
                  widget.active == true
                      ? TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {},
                          child: Text(
                            'desactivar',
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey.shade600),
                          ))
                      : Text('')
                ]),
          ),
        ]),
      ),
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

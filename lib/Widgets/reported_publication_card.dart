import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:petspot/classes/reportPublication.dart';

class ReportedPublicationCard extends StatefulWidget {
  final ReportPublication pet;
  final bool active;
  ReportedPublicationCard({super.key, required this.pet, required this.active});

  @override
  State<ReportedPublicationCard> createState() =>
      _ReportedPublicationCardState();
}

class _ReportedPublicationCardState extends State<ReportedPublicationCard> {
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
            margin: EdgeInsets.all(25),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Talla:  ${widget.pet.size}',
                      style: TextStyle(color: Colors.black, fontSize: 10)),
                  Text('Color:  ${widget.pet.color}',
                      style: TextStyle(color: Colors.black, fontSize: 10)),
                  Text('Sexo:  ${widget.pet.sex}',
                      style: TextStyle(color: Colors.black, fontSize: 10)),
                  Text('Raza:  ${widget.pet.breed}',
                      style: TextStyle(color: Colors.black, fontSize: 10)),
                  widget.active == false
                      ? TextButton(
                          onPressed: () {},
                          child: Text(
                            'desactivar',
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey.shade600),
                          ))
                      : Text("")
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

import 'dart:ffi';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petspot/Repositories/forms.dart';
import 'package:petspot/Repositories/image.dart';
import 'package:petspot/bloc/search_form/search_form_bloc.dart';

class SearchSecond extends StatefulWidget {
  const SearchSecond({super.key});

  @override
  State<SearchSecond> createState() => _SearchSecondState();
}

TextEditingController direction = TextEditingController();
TextEditingController description = TextEditingController();

enum Sex { male, female }

enum Size { small, medium, large }

var imageRepo = ImageRepo();
File? selectedImage;

class _SearchSecondState extends State<SearchSecond> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Wrap(spacing: 10, runSpacing: 8, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<SearchFormBloc>(context)
                      .add((PreviousSearchFormEvent()));
                },
                icon: FaIcon(FontAwesomeIcons.chevronLeft),
                color: Colors.grey.shade600,
              ),
              Text(
                'Paso 2/2',
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              )
            ],
          ),
          Text(
            'Se usara la ubicacion actual para la publicacion',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          TextFormField(
            controller: direction,
            cursorColor: Colors.grey.shade800,
            style: TextStyle(
                color: Colors.grey.shade600, decoration: TextDecoration.none),
            decoration: InputDecoration(
                hintText: 'Ubicación',
                filled: true,
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                ),
                fillColor: Colors.grey.shade100,
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(0, 0, 187, 212)),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(0, 0, 187, 212)),
                )),
          ),
          Text(
            'Agrega una descripción breve que puede ayudar a identificarlo',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 10 * MediaQuery.textScaleFactorOf(context),
            ),
          ),
          TextFormField(
            maxLines: 5,
            controller: description,
            cursorColor: Colors.grey.shade800,
            style: TextStyle(
                color: Colors.grey.shade600, decoration: TextDecoration.none),
            decoration: InputDecoration(
                filled: true,
                hintText: 'manchas, lunares, collar...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                ),
                fillColor: Colors.grey.shade100,
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(0, 0, 187, 212)),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(0, 0, 187, 212)),
                )),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Agrega fotos',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.width / 4,
              child: DottedBorder(
                radius: Radius.circular(20),
                child: OutlinedButton(
                  onPressed: (() async {
                    selectedImage = await imageRepo.getImage();
                    if (selectedImage != null) {
                      BlocProvider.of<SearchFormBloc>(context)
                          .add(AddImage1Succes(selectedImage!));
                    } else {}
                  }),
                  child: Align(
                    alignment: Alignment.center,
                    child: FaIcon(
                      FontAwesomeIcons.upload,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(),
                ),
              ),
            ),
          ]),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            width: MediaQuery.of(context).size.width,
            child: OutlinedButton(
                onPressed: (() {
                  BlocProvider.of<SearchFormBloc>(context).add(
                      (PostSearchFormEvent(description: description.text)));
                }),
                child: Text(
                  'Publicar',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Color.fromARGB(255, 246, 232, 110))),
          ),
        ]),
      ),
    );
  }
}

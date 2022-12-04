import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petspot/Repositories/forms.dart';
import 'package:petspot/bloc/report_form/report_form_bloc.dart';

import '../Repositories/image.dart';

class ReportSecond extends StatefulWidget {
  const ReportSecond({super.key});

  @override
  State<ReportSecond> createState() => _ReportSecondState();
}

TextEditingController name = TextEditingController();
var imageRepo = ImageRepo();
File? selectedImage;

enum Sex { male, female }

enum Size { small, medium, large }

class _ReportSecondState extends State<ReportSecond> {
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
                  BlocProvider.of<ReportFormBloc>(context)
                      .add((PreviousReportFormEvent()));
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
            '¿Por dónde lo viste?',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          TextFormField(
            controller: name,
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Agrega fotos',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            Text(
              'Máximo 3',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                child: DottedBorder(
                  radius: Radius.circular(20),
                  child: OutlinedButton(
                    onPressed: (() async {
                      selectedImage = await imageRepo.getImage();
                      if (selectedImage != null) {
                        BlocProvider.of<ReportFormBloc>(context)
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
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                child: DottedBorder(
                  radius: Radius.circular(20),
                  child: OutlinedButton(
                    onPressed: (() {}),
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
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                child: DottedBorder(
                  radius: Radius.circular(20),
                  child: OutlinedButton(
                    onPressed: (() {}),
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
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '¡Gracias por ayudar!',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 20 * MediaQuery.textScaleFactorOf(context),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            child: OutlinedButton(
                onPressed: (() {
                  BlocProvider.of<ReportFormBloc>(context)
                      .add((PostReportFormEvent()));
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

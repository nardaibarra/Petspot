import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petspot/Repositories/forms.dart';
import 'package:petspot/Screens/search_or_report.dart';
import 'package:petspot/bloc/report_form/report_form_bloc.dart';

class ReportFirst extends StatefulWidget {
  ReportFirst({super.key});

  @override
  State<ReportFirst> createState() => _ReportFirstState();
}

Future<List<String>>? _species;
Future<List<String>>? _breeds;
Future<List<String>>? _colors;
TextEditingController name = TextEditingController();

enum Sex { male, female, unknown }

enum Size { small, medium, large }

var forms = Forms();

class _ReportFirstState extends State<ReportFirst> {
  void initState() {
    super.initState();
    _species = forms.getSpecies('report');
  }

  Sex? _sex = Sex.male;
  Size? _size = Size.small;
  String? selectedSpecie = null;
  String? selectedBreed = null;
  String? selectedColor = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Wrap(spacing: 10, runSpacing: 5, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FindOrReport()));
                },
                icon: FaIcon(FontAwesomeIcons.chevronLeft),
                color: Colors.grey.shade600,
              ),
              Text(
                'Paso 1/2',
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              )
            ],
          ),
          ButtonTheme(
              alignedDropdown: true,
              child: FutureBuilder<List<String>>(
                  future: _species,
                  builder: (context, AsyncSnapshot<List<String>> snapshot) {
                    return DropdownButtonFormField<String>(
                      value: selectedSpecie,
                      dropdownColor: Colors.white,
                      menuMaxHeight: MediaQuery.of(context).size.height / 2,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Especie',
                          hintText: 'Seleccionar',
                          labelStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize:
                                  12 * MediaQuery.textScaleFactorOf(context)),
                          filled: true,
                          hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize:
                                12 * MediaQuery.textScaleFactorOf(context),
                          ),
                          fillColor: Colors.grey.shade100,
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(0, 0, 187, 212)),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(0, 0, 187, 212)),
                          )),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        decoration: TextDecoration.none,
                        fontSize: 15 * MediaQuery.textScaleFactorOf(context),
                      ),
                      items: (snapshot.data)
                          ?.map((specie) => DropdownMenuItem<String>(
                                value: specie,
                                child: Text(specie),
                              ))
                          .toList(),
                      onChanged: ((selectedItem) {
                        setState(() {
                          selectedBreed = null;
                          selectedColor = null;
                          selectedSpecie = selectedItem;
                          _breeds = forms.getBreeds(
                              selectedSpecie.toString(), 'report');
                          _colors = forms.getColors(selectedSpecie.toString());
                        });
                      }),
                      icon: Icon(
                        // Add this
                        Icons.arrow_drop_down, // Add this
                        color: Colors.grey.shade500, // Add this
                      ),
                    );
                  })),
          ButtonTheme(
              alignedDropdown: true,
              child: FutureBuilder<List<String>>(
                  future: _breeds,
                  builder: (context, AsyncSnapshot<List<String>> snapshot) {
                    if (!snapshot.hasData)
                      return CupertinoActivityIndicator(animating: true);

                    return DropdownButtonFormField<String>(
                      value: selectedBreed,
                      dropdownColor: Colors.white,
                      menuMaxHeight: MediaQuery.of(context).size.height / 2,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Raza',
                          hintText: 'Seleccionar',
                          labelStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize:
                                  12 * MediaQuery.textScaleFactorOf(context)),
                          filled: true,
                          hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize:
                                12 * MediaQuery.textScaleFactorOf(context),
                          ),
                          fillColor: Colors.grey.shade100,
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(0, 0, 187, 212)),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(0, 0, 187, 212)),
                          )),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        decoration: TextDecoration.none,
                        fontSize: 15 * MediaQuery.textScaleFactorOf(context),
                      ),
                      items: (snapshot.data)
                          ?.map((breed) => DropdownMenuItem<String>(
                                value: breed,
                                child: Text(breed),
                              ))
                          .toList(),
                      onChanged: ((selectedItem) {
                        setState(() {
                          selectedBreed = selectedItem;
                          print(selectedBreed);
                        });
                      }),
                      icon: Icon(
                        // Add this
                        Icons.arrow_drop_down, // Add this
                        color: Colors.grey.shade500, // Add this
                      ),
                    );
                  })),
          ButtonTheme(
              alignedDropdown: true,
              child: FutureBuilder<List<String>>(
                  future: _colors,
                  builder: (context, AsyncSnapshot<List<String>> snapshot) {
                    if (!snapshot.hasData)
                      return CupertinoActivityIndicator(animating: true);
                    else {
                      return DropdownButtonFormField<String>(
                        value: selectedColor,
                        dropdownColor: Colors.white,
                        menuMaxHeight: MediaQuery.of(context).size.height / 2,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Color',
                            hintText: 'Seleccionar',
                            labelStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize:
                                    12 * MediaQuery.textScaleFactorOf(context)),
                            filled: true,
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize:
                                  12 * MediaQuery.textScaleFactorOf(context),
                            ),
                            fillColor: Colors.grey.shade100,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(0, 0, 187, 212)),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(0, 0, 187, 212)),
                            )),
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          decoration: TextDecoration.none,
                          fontSize: 15 * MediaQuery.textScaleFactorOf(context),
                        ),
                        items: (snapshot.data)
                            ?.map((breed) => DropdownMenuItem<String>(
                                  value: breed,
                                  child: Text(breed),
                                ))
                            .toList(),
                        onChanged: ((selectedItem) {
                          setState(() {
                            selectedColor = selectedItem;
                          });
                        }),
                        icon: Icon(
                          // Add this
                          Icons.arrow_drop_down, // Add this
                          color: Colors.grey.shade500, // Add this
                        ),
                      );
                    }
                  })),
          Text(
            'sexo',
            style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12 * MediaQuery.textScaleFactorOf(context)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.44,
                  child: ListTile(
                    horizontalTitleGap: 0,
                    dense: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    tileColor: Colors.grey.shade100,
                    textColor: Colors.grey.shade500,
                    iconColor: Colors.grey.shade800,
                    title: const Text(
                      'macho',
                    ),
                    leading: FaIcon(FontAwesomeIcons.mars),
                    trailing: Radio<Sex>(
                      activeColor: Color.fromARGB(255, 246, 232, 110),
                      value: Sex.male,
                      groupValue: _sex,
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      onChanged: (Sex? value) {
                        setState(() {
                          _sex = value;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.44,
                  child: ListTile(
                    horizontalTitleGap: 0,
                    dense: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    tileColor: Colors.grey.shade100,
                    textColor: Colors.grey.shade500,
                    iconColor: Colors.grey.shade800,
                    title: const Text(
                      'hembra',
                    ),
                    leading: FaIcon(FontAwesomeIcons.venus),
                    trailing: Radio<Sex>(
                      activeColor: Color.fromARGB(255, 246, 232, 110),
                      value: Sex.female,
                      groupValue: _sex,
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      onChanged: (Sex? value) {
                        setState(() {
                          _sex = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.90,
            child: ListTile(
              horizontalTitleGap: 0,
              dense: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              tileColor: Colors.grey.shade100,
              textColor: Colors.grey.shade500,
              iconColor: Colors.grey.shade800,
              title: const Text(
                'No lo sé',
              ),
              leading: FaIcon(FontAwesomeIcons.question),
              trailing: Radio<Sex>(
                activeColor: Color.fromARGB(255, 246, 232, 110),
                value: Sex.unknown,
                groupValue: _sex,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                onChanged: (Sex? value) {
                  setState(() {
                    _sex = value;
                  });
                },
              ),
            ),
          ),
          Text(
            'talla',
            style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12 * MediaQuery.textScaleFactorOf(context)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.28,
                  child: ListTile(
                    horizontalTitleGap: 0,
                    dense: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    tileColor: Colors.grey.shade100,
                    textColor: Colors.grey.shade500,
                    iconColor: Colors.grey.shade800,
                    title: const Text(
                      'CH',
                    ),
                    trailing: Radio<Size>(
                      activeColor: Color.fromARGB(255, 246, 232, 110),
                      value: Size.small,
                      groupValue: _size,
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      onChanged: (Size? value) {
                        setState(() {
                          _size = value;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.28,
                  child: ListTile(
                    horizontalTitleGap: 0,
                    dense: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    tileColor: Colors.grey.shade100,
                    textColor: Colors.grey.shade500,
                    iconColor: Colors.grey.shade800,
                    title: const Text(
                      'M',
                    ),
                    trailing: Radio<Size>(
                      activeColor: Color.fromARGB(255, 246, 232, 110),
                      value: Size.medium,
                      groupValue: _size,
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      onChanged: (Size? value) {
                        setState(() {
                          _size = value;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.28,
                  child: ListTile(
                    horizontalTitleGap: 0,
                    dense: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    tileColor: Colors.grey.shade100,
                    textColor: Colors.grey.shade500,
                    iconColor: Colors.grey.shade800,
                    title: const Text(
                      'G',
                    ),
                    trailing: Radio<Size>(
                      activeColor: Color.fromARGB(255, 246, 232, 110),
                      value: Size.large,
                      groupValue: _size,
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      onChanged: (Size? value) {
                        setState(() {
                          _size = value;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            child: OutlinedButton(
                onPressed: (() {
                  BlocProvider.of<ReportFormBloc>(context)
                      .add((NextReportFormEvent()));
                }),
                child: Text(
                  'Continuar',
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

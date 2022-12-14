import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petspot/Repositories/forms.dart';
import 'package:petspot/Screens/search_or_report.dart';
import 'package:petspot/bloc/search_form/search_form_bloc.dart';

class SearchFirst extends StatefulWidget {
  SearchFirst({super.key});

  @override
  State<SearchFirst> createState() => _SearchFirstState();
}

Future<List<String>>? _species;
Future<List<String>>? _breeds;
Future<List<String>>? _colors;
TextEditingController name = TextEditingController();

enum Sex { macho, hembra, desconocido }

enum Size { chico, mediano, grande }

var forms = Forms();

class _SearchFirstState extends State<SearchFirst> {
  void initState() {
    super.initState();
    _species = forms.getSpecies('search');
  }

  Sex? _sex = Sex.macho;
  Size? _size = Size.chico;
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
          TextFormField(
            controller: name,
            cursorColor: Colors.grey.shade800,
            style: TextStyle(
                color: Colors.grey.shade600, decoration: TextDecoration.none),
            decoration: InputDecoration(
                hintText: 'nombre',
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
          ButtonTheme(
              alignedDropdown: true,
              child: FutureBuilder<List<String>>(
                  future: _species,
                  builder: (context, AsyncSnapshot<List<String>> snapshot) {
                    if (!snapshot.hasData)
                      return CupertinoActivityIndicator(animating: true);

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
                              selectedSpecie.toString(), 'search');
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
                      value: Sex.macho,
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
                      value: Sex.hembra,
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
                      value: Size.chico,
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
                      value: Size.mediano,
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
                      value: Size.grande,
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
                  try {
                    BlocProvider.of<SearchFormBloc>(context).add(
                        (NextSearchFormEvent(
                            name: name.text,
                            sex: _sex!.name,
                            size: _size!.name,
                            selectedBreed: selectedBreed!,
                            selectedColor: selectedColor!,
                            selectedSpecie: selectedSpecie!)));
                    name.text = '';
                  } catch (e) {}
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

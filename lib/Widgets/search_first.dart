import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petspot/bloc/search_form/search_form_bloc.dart';

class SearchFirst extends StatefulWidget {
  const SearchFirst({super.key});

  @override
  State<SearchFirst> createState() => _SearchFirstState();
}

TextEditingController name = TextEditingController();

enum Sex { male, female }

enum Size { small, medium, large }

class _SearchFirstState extends State<SearchFirst> {
  Sex? _sex = Sex.male;
  Size? _size = Size.small;
  @override
  Widget build(BuildContext context) {
    var items = ['Item 1', 'Item 2'];
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Wrap(spacing: 10, runSpacing: 8, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
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
            child: DropdownButtonFormField(
              dropdownColor: Colors.white,
              menuMaxHeight: MediaQuery.of(context).size.height / 2,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Especie',
                  hintText: 'Seleccionar',
                  labelStyle: TextStyle(color: Colors.grey.shade500),
                  filled: true,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 15 * MediaQuery.textScaleFactorOf(context),
                  ),
                  fillColor: Colors.grey.shade100,
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(0, 0, 187, 212)),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(0, 0, 187, 212)),
                  )),
              style: TextStyle(
                color: Colors.grey.shade600,
                decoration: TextDecoration.none,
                fontSize: 15 * MediaQuery.textScaleFactorOf(context),
              ),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: ((value) {}),
              icon: Icon(
                // Add this
                Icons.arrow_drop_down, // Add this
                color: Colors.grey.shade500, // Add this
              ),
            ),
          ),
          ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonFormField(
              dropdownColor: Colors.white,
              menuMaxHeight: MediaQuery.of(context).size.height / 2,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Raza',
                  hintText: 'Seleccionar',
                  labelStyle: TextStyle(color: Colors.grey.shade500),
                  filled: true,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 15 * MediaQuery.textScaleFactorOf(context),
                  ),
                  fillColor: Colors.grey.shade100,
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(0, 0, 187, 212)),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(0, 0, 187, 212)),
                  )),
              style: TextStyle(
                color: Colors.grey.shade600,
                decoration: TextDecoration.none,
                fontSize: 15 * MediaQuery.textScaleFactorOf(context),
              ),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: ((value) {}),
              icon: Icon(
                // Add this
                Icons.arrow_drop_down, // Add this
                color: Colors.grey.shade500, // Add this
              ),
            ),
          ),
          Text(
            'sexo',
            style: TextStyle(color: Colors.grey.shade600),
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
          Text(
            'talla',
            style: TextStyle(color: Colors.grey.shade600),
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
                  BlocProvider.of<SearchFormBloc>(context)
                      .add((NextSearchFormEvent()));
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petspot/Repositories/forms.dart';
import 'package:petspot/Widgets/action_button.dart';
import 'package:petspot/Widgets/navbar.dart';
import 'package:petspot/Widgets/reported_pet_card.dart';
import 'package:petspot/bloc/reported/reported_bloc.dart';
import 'package:petspot/providers/reported_filters.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String specieSelection = '';
String breedSelection = '';
String colorSelection = '';
String sizeSelection = '';
String sexSelection = '';

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 25, left: 20, bottom: 0),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  'Mascotas vistas cerca de ti',
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Filtra los resultados',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      filtersDialog(context);
                    },
                    child: FaIcon(FontAwesomeIcons.filter),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Color.fromARGB(
                          255, 246, 232, 110), // <-- Button color
                      foregroundColor: Colors.grey.shade800, // <-- Splash color
                    ),
                  ),
                )
              ]),
              BlocConsumer<ReportedBloc, ReportedState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is ReportedPetsSuccessState) {
                      return Container(
                          padding: EdgeInsets.only(bottom: 30),
                          height: MediaQuery.of(context).size.height - 200,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: state.listElements.length,
                            itemBuilder: (BuildContext context, index) {
                              return GestureDetector(
                                child: ReportedPetCard(
                                    pet: state.listElements[index],
                                    position: state.position),
                              );
                            },
                          ));
                    } else
                      return Text('');
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height,
              )
            ]),
      ),
      bottomNavigationBar: Navbar(context, screen: 'home'),
      floatingActionButton: ActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  filtersDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text(
        "Cancelar",
        style: TextStyle(color: Colors.grey.shade600),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "Aplicar",
        style: TextStyle(color: Colors.grey.shade600),
      ),
      onPressed: () {
        specieSelection = context.read<ReportedFilters>().getSpecie;
        breedSelection = context.read<ReportedFilters>().getBreed;
        colorSelection = context.read<ReportedFilters>().getColor;
        sizeSelection = context.read<ReportedFilters>().getSize;
        sexSelection = context.read<ReportedFilters>().getSex;
        BlocProvider.of<ReportedBloc>(context).add(FilterReportedPetsEvent(
            specie: specieSelection,
            breed: breedSelection,
            color: colorSelection,
            size: sizeSelection,
            sex: sexSelection));
        Navigator.of(context).pop();
        context.read<ReportedFilters>().changeSpecie('');
        context.read<ReportedFilters>().changeBreed('');
        context.read<ReportedFilters>().changeColor('');
        context.read<ReportedFilters>().changeSize('');
        context.read<ReportedFilters>().changeSex('');
      },
    );

    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.grey.shade600),
      title: Text("Filtros"),
      content: FiltersMenu(),
      actions: [
        cancelButton,
        continueButton,
      ],
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

class FiltersMenu extends StatefulWidget {
  const FiltersMenu({super.key});

  @override
  State<FiltersMenu> createState() => _FiltersMenuState();
}

Future<List<String>>? _species;
Future<List<String>>? _breeds;
Future<List<String>>? _colors;
List<String> sexlist = ['macho', 'hembra', 'ambos'];
List<String> sizelist = ['chico', 'mediano', 'grande', 'todos'];

var forms = Forms();

class _FiltersMenuState extends State<FiltersMenu> {
  void initState() {
    super.initState();
    _species = forms.getSpecies('filters');
  }

  String? selectedSpecie = null;
  String? selectedBreed = null;
  String? selectedColor = null;
  String? selectedSize = null;
  String? selectedSex = null;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.topRight,
        child: Container(
            margin: EdgeInsets.only(right: 3, top: 0),
            child: TextButton(
              child: Text(
                'Limpiar filtros',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
              onPressed: (() {
                setState(() {
                  selectedSpecie = null;
                  selectedBreed = null;
                  selectedColor = null;
                  selectedSex = null;
                  selectedSize = null;
                });
              }),
            )),
      ),
      Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FutureBuilder<List<String>>(
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
                              selectedSpecie.toString(), 'filters');
                          _colors = forms.getColors(selectedSpecie.toString());
                        });
                        context
                            .read<ReportedFilters>()
                            .changeSpecie(selectedItem!);
                      }),
                      icon: Icon(
                        // Add this
                        Icons.arrow_drop_down, // Add this
                        color: Colors.grey.shade500, // Add this
                      ),
                    );
                  }),
              FutureBuilder<List<String>>(
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
                        });
                        context
                            .read<ReportedFilters>()
                            .changeBreed(selectedItem!);
                      }),
                      icon: Icon(
                        // Add this
                        Icons.arrow_drop_down, // Add this
                        color: Colors.grey.shade500, // Add this
                      ),
                    );
                  }),
              FutureBuilder<List<String>>(
                  future: _colors,
                  builder: (context, AsyncSnapshot<List<String>> snapshot) {
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
                          ?.map((color) => DropdownMenuItem<String>(
                                value: color,
                                child: Text(color),
                              ))
                          .toList(),
                      onChanged: ((selectedItem) {
                        setState(() {
                          selectedColor = selectedItem;
                        });
                        context
                            .read<ReportedFilters>()
                            .changeColor(selectedItem!);
                      }),
                      icon: Icon(
                        // Add this
                        Icons.arrow_drop_down, // Add this
                        color: Colors.grey.shade500, // Add this
                      ),
                    );
                  }),
              DropdownButtonFormField<String>(
                value: selectedSex,
                dropdownColor: Colors.white,
                menuMaxHeight: MediaQuery.of(context).size.height / 2,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Sexo',
                    hintText: 'Seleccionar',
                    labelStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12 * MediaQuery.textScaleFactorOf(context)),
                    filled: true,
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 12 * MediaQuery.textScaleFactorOf(context),
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
                items: (sexlist)
                    .map((sex) => DropdownMenuItem<String>(
                          value: sex,
                          child: Text(sex),
                        ))
                    .toList(),
                onChanged: ((selectedItem) {
                  setState(() {
                    selectedSex = selectedItem;
                  });
                  context.read<ReportedFilters>().changeSex(selectedItem!);
                }),
                icon: Icon(
                  // Add this
                  Icons.arrow_drop_down, // Add this
                  color: Colors.grey.shade500, // Add this
                ),
              ),
              DropdownButtonFormField<String>(
                value: selectedSize,
                dropdownColor: Colors.white,
                menuMaxHeight: MediaQuery.of(context).size.height / 2,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Size',
                    hintText: 'Seleccionar',
                    labelStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12 * MediaQuery.textScaleFactorOf(context)),
                    filled: true,
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 12 * MediaQuery.textScaleFactorOf(context),
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
                items: (sizelist)
                    .map((size) => DropdownMenuItem<String>(
                          value: size,
                          child: Text(size),
                        ))
                    .toList(),
                onChanged: ((selectedItem) {
                  setState(() {
                    selectedSize = selectedItem;
                  });
                  context.read<ReportedFilters>().changeSize(selectedItem!);
                }),
                icon: Icon(
                  // Add this
                  Icons.arrow_drop_down, // Add this
                  color: Colors.grey.shade500, // Add this
                ),
              )
            ]),
      ),
    ]);
  }
}

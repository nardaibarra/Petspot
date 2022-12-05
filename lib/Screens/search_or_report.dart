import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petspot/Screens/search_form.dart';
import 'package:petspot/Screens/report_form.dart';
import 'package:petspot/Widgets/action_button.dart';
import 'package:petspot/Widgets/navbar.dart';
import 'package:petspot/bloc/search_form/search_form_bloc.dart';

class FindOrReport extends StatelessWidget {
  const FindOrReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, left: 20, bottom: 10),
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                '¿Qué deseas hacer el día de hoy?',
                style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Selecciona una opción',
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              ),
            ),
            Center(
                child: MaterialButton(
              padding: EdgeInsets.all(8.0),
              textColor: Colors.grey.shade900,
              elevation: 8.0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      scale: 0.7,
                      alignment: Alignment.bottomLeft,
                      image: AssetImage('assets/images/girl_searching.png'),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Buscar a mi mascota",
                      ),
                    ),
                  ),
                ),
              ),
              // ),
              onPressed: () {
                BlocProvider.of<SearchFormBloc>(context)
                    .add(NewSearchFormEvent());
                navigateToFindForm(context);
              },
            )),
            Center(
                child: MaterialButton(
              padding: EdgeInsets.all(8.0),
              textColor: Colors.grey.shade900,
              elevation: 8.0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      scale: 0.7,
                      alignment: Alignment.bottomRight,
                      image: AssetImage('assets/images/boy_announcing.png'),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Reportar una mascota",
                      ),
                    ),
                  ),
                ),
              ),
              // ),
              onPressed: () {
                navigateToReportForm(context);
              },
            ))
          ]),
      bottomNavigationBar: Navbar(context, screen: ' '),
      floatingActionButton: ActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

navigateToFindForm(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => SearchPetForm()));
}

navigateToReportForm(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ReportPetForm()));
}

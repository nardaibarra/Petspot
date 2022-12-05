import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petspot/Repositories/my_publications.dart';
import 'package:petspot/Widgets/action_button.dart';
import 'package:petspot/Widgets/missing_publication_card.dart';
import 'package:petspot/Widgets/navbar.dart';
import 'package:petspot/Widgets/reported_pet_card.dart';
import 'package:petspot/Widgets/reported_publication_card.dart';
import 'package:petspot/bloc/my_publications/my_publications_bloc.dart';
import 'package:petspot/bloc/reported/reported_bloc.dart';
import 'package:petspot/classes/missingPublication.dart';

class MyPets extends StatefulWidget {
  const MyPets({super.key});

  @override
  State<MyPets> createState() => _MyPetsState();
}

String screen = 'myPets';

class _MyPetsState extends State<MyPets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 30, left: 20, bottom: 0),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  'Publicaciones',
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(children: [
                  TextButton(
                      onPressed: () {
                        BlocProvider.of<MyPublicationsBloc>(context)
                            .add(GetMyPetsEvent());
                        setState(() {
                          screen = 'MyPets';
                        });
                      },
                      child: Text('Mis mascotas',
                          style: TextStyle(
                            color: screen == 'myPets'
                                ? Color.fromARGB(255, 0, 0, 0)
                                : Colors.grey.shade500,
                          ))),
                  TextButton(
                      onPressed: () {
                        BlocProvider.of<MyPublicationsBloc>(context)
                            .add(GetMyRerportsEvent());
                        setState(() {
                          screen = 'MyReports';
                        });
                      },
                      child: Text('Mis reportes',
                          style: TextStyle(
                            color: screen == 'myReports'
                                ? Color.fromARGB(255, 0, 0, 0)
                                : Colors.grey.shade500,
                          ))),
                ]),
              ),
              BlocConsumer<MyPublicationsBloc, MyPublicationsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is MyReportsSuccesfulState) {
                      return SingleChildScrollView(
                        child: Column(children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              padding: EdgeInsets.all(2),
                              margin: EdgeInsets.all(2),
                              child: Text(
                                'Activos',
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(bottom: 30),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.activeListElements.length,
                                itemBuilder: (BuildContext context, index) {
                                  return GestureDetector(
                                    child: ReportedPublicationCard(
                                      pet: state.activeListElements[index],
                                      active: true,
                                    ),
                                  );
                                },
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(5),
                              child: Text(
                                'Inactivos',
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(bottom: 20),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.inactiveListElements.length,
                                itemBuilder: (BuildContext context, index) {
                                  return GestureDetector(
                                    child: MissingPublicationCard(
                                      pet: state.inactiveListElements[index] ??
                                          '',
                                      active: false,
                                    ),
                                  );
                                },
                              )),
                        ]),
                      );
                    } else if (state is MyPetsSuccesfulState) {
                      return SingleChildScrollView(
                        child: Column(children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              padding: EdgeInsets.all(2),
                              margin: EdgeInsets.all(2),
                              child: Text(
                                'Activos',
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(bottom: 20),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.activeListElements.length,
                                itemBuilder: (BuildContext context, index) {
                                  return GestureDetector(
                                    child: MissingPublicationCard(
                                      pet: state.activeListElements[index],
                                      active: true,
                                    ),
                                  );
                                },
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(5),
                              child: Text(
                                'Inactivos',
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(bottom: 30),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.inactiveListElements.length,
                                itemBuilder: (BuildContext context, index) {
                                  return GestureDetector(
                                    child: MissingPublicationCard(
                                      pet: state.inactiveListElements[index] ??
                                          '',
                                      active: false,
                                    ),
                                  );
                                },
                              )),
                        ]),
                      );
                    } else {
                      return Text('');
                    }
                  })
            ]),
      ),
      bottomNavigationBar: Navbar(context, screen: 'my_pets'),
      floatingActionButton: ActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

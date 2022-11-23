import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petspot/Widgets/action_button.dart';
import 'package:petspot/Widgets/navbar.dart';
import 'package:petspot/Widgets/reported_pet_card.dart';
import 'package:petspot/bloc/reported/reported_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 30, left: 20, bottom: 10),
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
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Filtra los resultados',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                ),
              ]),
              BlocConsumer<ReportedBloc, ReportedState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is ReportedPetsSuccessState) {
                      return Container(
                          padding: EdgeInsets.only(bottom: 30),
                          height: MediaQuery.of(context).size.height - 210,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: state.listElements.length,
                            itemBuilder: (BuildContext context, index) {
                              return GestureDetector(
                                child: ReportedPetCard(
                                    pet: state.listElements[index]),
                              );
                            },
                          ));
                    } else
                      return Text('');
                  }),
            ]),
      ),
      bottomNavigationBar: Navbar(context, screen: 'home'),
      floatingActionButton: ActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

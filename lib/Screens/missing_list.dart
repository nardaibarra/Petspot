import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petspot/Widgets/action_button.dart';
import 'package:petspot/Widgets/missing_pet_card.dart';
import 'package:petspot/Widgets/navbar.dart';
import 'package:petspot/bloc/missing/missing_bloc.dart';

class MissingList extends StatelessWidget {
  const MissingList({super.key});

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
                'Mascotas perdidas cerca de ti',
                style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
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
            BlocConsumer<MissingBloc, MissingState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is MissingPetsSuccessState) {
                    return Container(
                        height: MediaQuery.of(context).size.height - 210,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.listElements.length,
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                              child: MissingPetCard(
                                  pet: state.listElements[index]),
                            );
                          },
                        ));
                  } else
                    return Text('');
                }),
          ]),
      bottomNavigationBar: Navbar(context, screen: 'missing_list'),
      floatingActionButton: ActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

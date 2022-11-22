import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petspot/Widgets/action_button.dart';
import 'package:petspot/Widgets/navbar.dart';
import 'package:petspot/Widgets/search_first.dart';
import 'package:petspot/Widgets/search_second.dart';
import 'package:petspot/bloc/search_form/search_form_bloc.dart';

class SearchPetForm extends StatefulWidget {
  const SearchPetForm({super.key});

  @override
  State<SearchPetForm> createState() => _SearchPetFormState();
}

class _SearchPetFormState extends State<SearchPetForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, left: 20, bottom: 10),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Reportar a mi mascota',
                style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            BlocConsumer<SearchFormBloc, SearchFormState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is SearchFormFirstStepState) {
                  return SearchFirst();
                } else if (state is SearchFormSecondStepState) {
                  return SearchSecond();
                } else
                  return SearchFirst();
              },
            ),
          ]),
      bottomNavigationBar: Navbar(context, screen: ' '),
      floatingActionButton: ActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

_searchSecondStep(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 20),
    child: Text(
      'Paso 2/2',
      style: TextStyle(
          color: Colors.grey.shade500,
          fontWeight: FontWeight.normal,
          fontSize: 15),
    ),
  );
}

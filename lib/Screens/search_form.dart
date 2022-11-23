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
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 25, left: 20, bottom: 5),
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
                  } else if (state is PreviousSearchFormEvent) {
                    return SearchFirst();
                  } else
                    return SearchFirst();
                },
              ),
            ]),
      ),
      bottomNavigationBar: Navbar(context, screen: ' '),
      floatingActionButton: ActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

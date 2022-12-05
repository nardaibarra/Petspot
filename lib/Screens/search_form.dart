import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petspot/Screens/home.dart';
import 'package:petspot/Screens/missing_list.dart';
import 'package:petspot/Widgets/action_button.dart';
import 'package:petspot/Widgets/navbar.dart';
import 'package:petspot/Widgets/search_first.dart';
import 'package:petspot/Widgets/search_second.dart';
import 'package:petspot/Widgets/search_second_1images.dart';
import 'package:petspot/Widgets/search_second_2image.dart';
import 'package:petspot/Widgets/search_second_3image.dart';
import 'package:petspot/bloc/reported/reported_bloc.dart';
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
                listener: (context, state) {
                  if (state is SearchFormSuccesfulPostState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('cargado')),
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MissingList()));
                  } else if (state is SearchFormErrorPostState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('error al cargar')),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is SearchFormAnonymousState) {
                    return Column(children: [
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Haz login para poder publicar a tu mascota.',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ]);
                  }
                  if (state is SearchFormFirstStepState) {
                    return SearchFirst();
                  } else if (state is SearchFormSecondStepState) {
                    return SearchSecond();
                  } else if (state is FirstImageLoadingSucces) {
                    return SearchSecondImage(
                      Images: state.images,
                    );
                  } else if (state is secondImageLoadingSucces) {
                    return SearchSecondImage2(
                      Images: state.images,
                    );
                  } else if (state is thirdImageLoadingSucces) {
                    return SearchSecondImage3(
                      Images: state.images,
                    );
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

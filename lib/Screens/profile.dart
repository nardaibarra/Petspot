import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petspot/Screens/login.dart';
import 'package:petspot/Widgets/action_button.dart';
import 'package:petspot/Widgets/navbar.dart';
import 'package:petspot/bloc/auth/auth_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, left: 20, bottom: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Perfil',
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: IconButton(
                          color: Colors.grey.shade800,
                          onPressed: () {
                            Navigator.of(context)
                                .popUntil(ModalRoute.withName('/'));
                            BlocProvider.of<AuthBloc>(context)
                                .add(LogoutEvent());
                          },
                          icon: FaIcon(FontAwesomeIcons.rightFromBracket)),
                    )
                  ]),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 20),
            //   child: Text(
            //     'Selecciona una opción',
            //     style: TextStyle(
            //         color: Colors.grey.shade500,
            //         fontWeight: FontWeight.normal,
            //         fontSize: 15),
            //   ),
            // ),
          ]),
      bottomNavigationBar: Navbar(context, screen: 'profile'),
      floatingActionButton: ActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

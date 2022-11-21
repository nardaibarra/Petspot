import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:petspot/Repositories/user_details.dart';
import 'package:petspot/Widgets/action_button.dart';
import 'package:petspot/Widgets/navbar.dart';
import 'package:petspot/bloc/auth/auth_bloc.dart';
import 'package:petspot/bloc/user/user_bloc.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

TextEditingController telephone = TextEditingController();

class _ProfileState extends State<Profile> {
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
                    ),
                  ]),
            ),
            BlocConsumer<UserBloc, UserState>(
              builder: (context, state) {
                if (state is SuccessUserInfoState) {
                  var userRepo = UserDetails();
                  return Container(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(state.currentUser.photo),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'nombre',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                            _customTextForm(context, state.currentUser.name),
                            Text(
                              'correo',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                            _customTextForm(context, state.currentUser.email),
                            Text(
                              'telefono',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: TextFormField(
                                  controller: telephone,
                                  cursorColor: Colors.grey.shade800,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      decoration: TextDecoration.none),
                                  decoration: InputDecoration(
                                      filled: true,
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade500),
                                      fillColor: Colors.grey.shade100,
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  0, 0, 187, 212)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromARGB(0, 0, 187, 212)),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: FaIcon(FontAwesomeIcons.check),
                                        onPressed: () async {
                                          String newTel =
                                              await userRepo.editUserTelephone(
                                                  telephone.text);
                                          telephone.text = newTel;
                                          FocusScope.of(context).unfocus();
                                        },
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ));
                } else if (state is LoadingProfileState) {
                  print(state);
                  return Center(
                    child: LoadingAnimationWidget.twistingDots(
                      leftDotColor: Color.fromARGB(255, 246, 232, 110),
                      rightDotColor: Color.fromARGB(255, 246, 232, 110),
                      size: 200,
                    ),
                  );
                } else
                  print(state);
                return Container();
              },
              listener: (context, state) {
                if (state is SuccessUserInfoState) {
                  telephone.text = state.currentUser.telephone;
                }
              },
            )
          ]),
      bottomNavigationBar: Navbar(context, screen: 'profile'),
      floatingActionButton: ActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

_customTextForm(BuildContext context, value) {
  return Container(
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        initialValue: value,
        readOnly: true,
        cursorColor: Colors.grey.shade800,
        style: TextStyle(
            color: Colors.grey.shade600, decoration: TextDecoration.none),
        decoration: InputDecoration(
          filled: true,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          fillColor: Colors.grey.shade100,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(0, 0, 187, 212)),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(0, 0, 187, 212)),
          ),
        ),
      ),
    ),
  );
}

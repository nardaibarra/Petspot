import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petspot/Screens/home.dart';
import 'package:petspot/Screens/missing_list.dart';
import 'package:petspot/Screens/my_pets.dart';
import 'package:petspot/Screens/profile.dart';
import 'package:petspot/bloc/user/user_bloc.dart';

class Navbar extends StatelessWidget {
  final String screen;
  Navbar(BuildContext context, {super.key, required this.screen});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: Colors.white,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: FaIcon(FontAwesomeIcons.bullhorn),
                onPressed: () {
                  navigateToHome(context);
                },
                color: screen == 'home'
                    ? Color.fromARGB(255, 246, 232, 110)
                    : Colors.grey,
              ),
              Spacer(
                flex: 1,
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                onPressed: () {
                  navigateToMissing(context);
                },
                color: screen == 'missing_list'
                    ? Color.fromARGB(255, 246, 232, 110)
                    : Colors.grey,
              ),
              Spacer(
                flex: 3,
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.dog),
                onPressed: () {
                  navigateToMyPets(context);
                },
                color: screen == 'my_pets'
                    ? Color.fromARGB(255, 246, 232, 110)
                    : Colors.grey,
              ),
              Spacer(
                flex: 1,
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.user),
                onPressed: () {
                  navigateToProfile(context);
                },
                color: screen == 'profile'
                    ? Color.fromARGB(255, 246, 232, 110)
                    : Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }

  navigateToHome(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Home()));
  }

  navigateToMissing(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MissingList()));
  }

  navigateToMyPets(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyPets()));
  }

  navigateToProfile(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(GetUserInfoEevent());
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Profile()));
  }
}

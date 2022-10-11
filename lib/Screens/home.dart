import 'package:flutter/material.dart';
import 'package:petspot/Widgets/action_button.dart';
import 'package:petspot/Widgets/navbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                'Mascotas vistas cerca de ti',
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
          ]),
      bottomNavigationBar: Navbar(context, screen: 'home'),
      floatingActionButton: ActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

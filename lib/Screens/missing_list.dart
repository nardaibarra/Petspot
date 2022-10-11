import 'package:flutter/material.dart';
import 'package:petspot/Widgets/action_button.dart';
import 'package:petspot/Widgets/navbar.dart';

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
          ]),
      bottomNavigationBar: Navbar(context, screen: 'missing_list'),
      floatingActionButton: ActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

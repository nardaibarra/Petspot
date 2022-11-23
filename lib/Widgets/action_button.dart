import 'package:flutter/material.dart';
import 'package:petspot/Screens/search_or_report.dart';

class ActionBtn extends StatelessWidget {
  const ActionBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.17,
      width: MediaQuery.of(context).size.width * 0.17,
      child: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          navigateToFindOrReport(context);
        },
        backgroundColor: Color.fromARGB(255, 246, 232, 110),
      ),
    );
  }

  navigateToFindOrReport(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const FindOrReport()));
  }
}

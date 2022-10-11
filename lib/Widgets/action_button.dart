import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petspot/Screens/find_or_report.dart';
import 'package:petspot/bloc/pets_bloc.dart';

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
    Navigator.of(context).push(MaterialPageRoute(
      builder: (nextContext) => BlocProvider.value(
          value: BlocProvider.of<PetsBloc>(context), child: FindOrReport()),
      // settings: RouteSettings(arguments: [state.selectedBook])
    ));
  }
}

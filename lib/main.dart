import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petspot/Screens/home.dart';
import 'package:petspot/bloc/pets_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PetsBloc(),
        ),
        // BlocProvider(
        //   create: (context) => TodosBloc(),
        // ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'Poppins',
            colorScheme: ColorScheme.dark(),
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.grey.shade200,
            primaryColor: Color.fromARGB(255, 187, 189, 188)),
        title: 'Find Track App',
        home: Home());
  }
}

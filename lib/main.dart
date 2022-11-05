import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petspot/Screens/home.dart';
import 'package:petspot/Screens/login.dart';
import 'package:petspot/bloc/auth/auth_bloc.dart';
import 'package:petspot/bloc/pets_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(VerifyAuthenticationEvent()),
        ),
        BlocProvider(
          create: (context) => PetsBloc(),
        ),
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
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthenticatedState)
              return Home();
            else if (state is UnauthenticatedState)
              return Login();
            else if (state is SuccessAuthSigninState)
              return Home();
            else if (state is SuccessAuthSignOutState)
              return Login();
            else
              return Login();
          },
        ));
  }
}

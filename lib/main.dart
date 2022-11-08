import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petspot/Screens/home.dart';
import 'package:petspot/Screens/login.dart';
import 'package:petspot/bloc/auth/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(VerifyAuthenticationEvent()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {'/login': ((context) => Login())},
        theme: ThemeData(
            fontFamily: 'Poppins',
            colorScheme: ColorScheme.dark(),
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.grey.shade200,
            primaryColor: Color.fromARGB(255, 187, 189, 188)),
        title: 'Find Track App',
        home: BlocConsumer<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthenticatedState || state is SuccessLoginState) {
              print(state);
              return Home();
            } else if (state is UnauthenticatedState ||
                state is SuccessLogoutState) {
              print(state);
              return Login();
            } else {
              print(state);
              return Login();
            }
          },
          listener: (context, state) {},
        ));
  }
}

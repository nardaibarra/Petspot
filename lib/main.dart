import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petspot/Screens/home.dart';
import 'package:petspot/Screens/login.dart';
import 'package:petspot/bloc/auth/auth_bloc.dart';
import 'package:petspot/bloc/missing/missing_bloc.dart';
import 'package:petspot/bloc/my_publications/my_publications_bloc.dart';
import 'package:petspot/bloc/report_form/report_form_bloc.dart';
import 'package:petspot/bloc/reported/reported_bloc.dart';
import 'package:petspot/bloc/search_form/search_form_bloc.dart';
import 'package:petspot/bloc/user/user_bloc.dart';
import 'package:petspot/providers/maps_provider.dart';
import 'package:petspot/providers/missing_filters.dart';
import 'package:petspot/providers/reported_filters.dart';
import 'package:provider/provider.dart';

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
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => MissingBloc()..add(GetAllMissingPetsEvent()),
        ),
        BlocProvider(
          create: (context) => ReportedBloc()..add(GetAllReportedPetsEvent()),
        ),
        BlocProvider(
          create: (context) => SearchFormBloc(),
        ),
        BlocProvider(
          create: (context) => ReportFormBloc(),
        ),
        BlocProvider(
          create: (context) => MyPublicationsBloc(),
        )
      ],
      child: MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => MapaProvider()),
        ChangeNotifierProvider(create: (_) => MissingFilters()),
        ChangeNotifierProvider(create: (_) => ReportedFilters()),
      ], child: MyApp()),
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

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petspot/bloc/auth/auth_bloc.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 232, 110),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 30, left: 20),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
                child: Image.asset('assets/images/logo.png'),
                height: MediaQuery.of(context).size.height * 0.2,
                alignment: Alignment.bottomLeft,
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 20, bottom: 40),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: OutlinedButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context)
                          .add(GoogleLoginEvent());
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/images/google_logo.png"),
                          height: 30.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Iniciar sesión con Google',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    // style: OutlinedButton.styleFrom(
                    //   shape: const RoundedRectangleBorder(
                    //       borderRadius:
                    //           BorderRadius.all(Radius.circular(30))),
                    //   primary: Colors.grey.shade900,
                    //   side: BorderSide(color: Colors.grey.shade500, width: 1),
                    // )
                  ),
                ),
              ),
              const Divider(
                height: 50,
                thickness: 1,
                indent: 30,
                endIndent: 30,
                color: Colors.grey,
              ),
              Align(
                child: Text(
                  'ó',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey.shade900, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                child: Text(
                  'Iniciar sesión modo anónimo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey.shade900, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'Al acceder se aceptan todos los T&C',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey.shade900, fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0,
      ),
    );
  }
}

class InputText extends StatelessWidget {
  InputText({
    Key? key,
    required inputController,
    required hintText,
  })  : _inputController = inputController,
        _hintText = hintText,
        super(key: key);

  var _inputController;
  var _hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        cursorColor: Colors.grey.shade800,
        controller: _inputController,
        style: TextStyle(
            color: Colors.grey.shade800, decoration: TextDecoration.none),
        decoration: InputDecoration(
          filled: true,
          hintText: _hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          fillColor: Colors.white,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(0, 0, 187, 212)),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(0, 0, 187, 212)),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var _inputController;
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
                padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              InputText(inputController: _inputController, hintText: 'Correo'),
              InputText(
                  inputController: _inputController, hintText: 'Contraseña'),
              Container(
                padding: EdgeInsets.only(right: 20),
                margin: EdgeInsets.only(bottom: 20),
                alignment: Alignment.topRight,
                child: Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: OutlinedButton(
                      onPressed: () {},
                      child: Text('Continuar'),
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        primary: Colors.grey.shade900,
                        side: BorderSide(color: Colors.grey.shade500, width: 1),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'Crear una nueva cuenta',
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

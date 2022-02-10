// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación',
      initialRoute: "/",
      routes: {
        '/': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen(),
      },
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late String user, password;
  TextEditingController controladorUser = TextEditingController();
  TextEditingController controladorPasswd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 200.0,
              child: TextField(
                controller: controladorUser,
                autofocus: true,
                keyboardType: TextInputType.text, // icono del botón
                autocorrect: true,
                textAlign: TextAlign.left,
                maxLength: 20,
                obscureText: false, // passowrd
                style: TextStyle(color: Colors.red),

                decoration: InputDecoration(
                  hintText: "Usuario",
                  hintStyle: TextStyle(color: Colors.green),
                  helperText: "Introducir usuario",
                ),
              ),
            ),
            Container(
              width: 200.0,
              child: TextField(
                controller: controladorPasswd,
                keyboardType: TextInputType.text, // icono del botón
                autocorrect: true,
                textAlign: TextAlign.left,
                maxLength: 20,
                obscureText: true, // passowrd
                style: TextStyle(color: Colors.red),

                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.green),
                  helperText: "Introducir password",
                ),
              ),
            ),
            Container(
              width: 200,
              height: 40.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (controladorUser.text == "usuario" &&
                    controladorPasswd.text == "clave") {
                  Navigator.pushNamed(context, '/second', arguments: {
                    "usuario": controladorUser.text,
                    "password": controladorPasswd.text
                  });
                }
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    Map? parametros = ModalRoute.of(context)?.settings.arguments as Map?;

    String usuario = parametros!["usuario"];

    return Scaffold(
      appBar: AppBar(
        title: const Text('OK'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:30.0),
        child: Center(
          child: Column(
            children: [
              Text("$usuario login correcto"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text("Salir"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

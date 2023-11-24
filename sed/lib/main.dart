import 'package:flutter/material.dart';
import 'login/login.dart'; // Importe a sua nova página
import 'listagem/listagem.dart'; // Importe a sua nova página
import 'listagem_escolas/listagem_escolas.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: lista_escolas(), // Use sua nova página aqui
    );
  }
}

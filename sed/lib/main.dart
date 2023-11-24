import 'package:flutter/material.dart';
import 'package:sed/criar_entrega/criar_entrega.dart';
import 'package:sed/home/home.dart';
import 'login/login.dart'; // Importe a sua nova página
import 'listagem/listagem.dart'; // Importe a sua nova página
import 'listagem_escolas/listagem_escolas.dart';
import 'lista_compras/lista_compras.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) =>  login_escola(),
        '/home': (context) =>  const Home(),
        '/listagem': (context) =>   listagem(),
        '/cadastarEntrega': (context) =>   CadastroEntregaScreen(),
        '/listagemEscolas': (context) =>   lista_escolas(),
      },
    );
  }
}

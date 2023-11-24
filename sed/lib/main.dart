import 'package:flutter/material.dart';
import 'package:sed/criar_entrega/criar_entrega.dart';
import 'package:sed/home/home.dart';
import 'login/login.dart';
import 'listagem/listagem.dart';
import 'listagem_escolas/listagem_escolas.dart';
import 'lista_compras/lista_compras.dart';
import 'entrega_escola/entrega_escola.dart';
import 'confirmar_entrega/confirmar_entrega.dart';
import 'confirmar_codigo/confirmar_codigo.dart';

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
        '/login': (context) => login_escola(),
        '/home': (context) => const Home(),
        '/listagem': (context) => listagem(),
        '/cadastarEntrega': (context) => CadastroEntregaScreen(),
        '/listagemEscolas': (context) => lista_escolas(),
        '/entregaEscola': (context) => entregaEscola(),
        '/confirmarEntrega': (context) =>
            ConfirmarEntrega(), // Adiciona esta linha
        '/confirmarCodigo': (context) => confirmarCodigo(),
      },
    );
  }
}

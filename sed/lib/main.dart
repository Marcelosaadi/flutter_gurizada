import 'package:flutter/material.dart';
import 'login/login.dart'; // Importe a sua nova página

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
      home: login_escola(), // Use sua nova página aqui
    );
  }
}

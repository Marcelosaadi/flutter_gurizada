import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  final String titulo;
  final String contagem;

  const Titulo({Key? key, required this.titulo, required this.contagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(titulo, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(contagem, style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Escolas extends StatelessWidget {
  final String regiao;
  final String nome;
  final String endereco;
  final String status;
  final String previsao;

  const Escolas({
    Key? key,
    required this.regiao,
    required this.nome,
    required this.endereco,
    required this.status,
    required this.previsao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(nome, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(regiao),
          Text(endereco),
          Text(status),
          Text(previsao),
        ],
      ),
    );
  }
}

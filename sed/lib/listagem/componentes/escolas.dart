import 'package:flutter/material.dart';


 Container escolaCard(String nome, String regiao, String endereco, String status, String previsao, String quantidade_total, String item) {
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
          Text('Quantidade para ser entregue: $quantidade_total $item')
        ],
      ),
    );
  }


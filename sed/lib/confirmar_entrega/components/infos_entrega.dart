import 'package:flutter/material.dart';

class PedidoCard extends StatelessWidget {
  final String status;
  final String previsaoEntrega;
  final String conteudo;
  final int quantidade;

  const PedidoCard({
    Key? key,
    required this.status,
    required this.previsaoEntrega,
    required this.conteudo,
    required this.quantidade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Sombra do card
      margin: const EdgeInsets.all(16), // Margem ao redor do card
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Status: $status',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Previsão de Entrega: $previsaoEntrega'),
            SizedBox(height: 8),
            Text('Conteúdo: $conteudo'),
            SizedBox(height: 8),
            Text('Quantidade: $quantidade'),
          ],
        ),
      ),
    );
  }
}

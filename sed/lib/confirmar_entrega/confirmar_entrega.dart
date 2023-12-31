import 'package:flutter/material.dart';
import 'package:sed/confirmar_codigo/confirmar_codigo.dart';
import '/home/components/sedName.dart';
import './components/infos_entrega.dart';

class ConfirmarEntrega extends StatelessWidget {
  final String quantidade;
  final String item;
  const ConfirmarEntrega({required this.quantidade,required this.item  ,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Adicionando o Header
          Align(
            alignment: Alignment.center,
            child: sedName(),
          ),

          // Adicionando o PedidoCard centralizado
          Center(
            child: PedidoCard(
              status: 'Em andamento',
              previsaoEntrega: '29 de fevereiro de 2024',
              conteudo: item,
              quantidade: quantidade,
            ),
          ),

          // Adicionando os botões
          SizedBox(height: 16),
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para visualização de código
                  _showCodigoPopup(context);
                },
                child: Text('Código'),
              ),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConfirmarCodigo(),
            ),
          );
                },
                child: Text('Confirmação'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCodigoPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Código de Recebimento:"),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("12345"), // Seu número de 5 dígitos aqui
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import '/home/components/sedName.dart'; // Substitua pelo caminho real do seu header
import './components/card_confirmações.dart'; // Substitua pelo caminho real do seu InputCard

class confirmarCodigo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sua Página'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Adicione o header centralizado
              Center(child: sedName()),

              // Adicione o InputCard centralizado
              Center(child: InputCard()),

              // Adicione o botão de confirmação com a mesma largura
              FractionallySizedBox(
                widthFactor: 0.93, // Ajuste este valor conforme necessário
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica para confirmação
                    print('Botão Confirmação Pressionado');
                  },
                  child: Text('Confirmação'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

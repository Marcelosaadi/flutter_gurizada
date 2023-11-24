import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Adicione aqui o seu header centralizado
            Text(
              'Digite seu ID e Código',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16), // Espaço entre o header e os campos de input
            // Campos de input centralizados
            TextField(
              decoration: InputDecoration(
                labelText: 'ID',
              ),
            ),
            SizedBox(height: 16), // Espaço entre os campos de input
            TextField(
              decoration: InputDecoration(
                labelText: 'Código de 5 dígitos',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

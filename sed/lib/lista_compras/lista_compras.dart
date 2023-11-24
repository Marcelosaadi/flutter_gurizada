import 'package:flutter/material.dart';
import 'package:sed/lista_compras/componentes/item.dart'; // Atualize com o caminho correto

class lista_compras extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              hint: Text('Item'),
              items: <String>['Tablet', 'Notebook', 'Desktop'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButtonFormField<String>(
              hint: Text('Fornecedor'),
              items: <String>['DELL', 'HP', 'ACER'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4, // Substitua com a quantidade de itens
              itemBuilder: (context, index) {
                // Os dados podem vir de uma lista ou de um serviço/função
                return Item(
                  nome_item: 'Tablet',
                  quantidade: 5000,
                  fornecedor: 'DELL',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'componentes/titulo.dart';
import 'componentes/escolas.dart';

class listagem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: ListView(
        children: [
          Titulo(
            titulo: 'Dell',
            contagem: '50/100',
          ),
          Escolas(
            regiao: 'São Paulo / Metropolitana',
            nome: 'Escola Estadual de Ensino Médio',
            endereco: 'Rua dos Estudantes, 123',
            status: 'Em trânsito',
            previsao: 'Previsão de entrega 22/03/2023',
          ),
          Escolas(
            regiao: 'São Paulo / Metropolitana',
            nome: 'Colégio Técnico Industrial',
            endereco: 'Avenida Tecnológica, 456',
            status: 'Em trânsito',
            previsao: 'Previsão de entrega 25/03/2023',
          ),
        ],
      ),
    );
  }
}

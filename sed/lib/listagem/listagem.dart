import 'package:flutter/material.dart';
import 'componentes/titulo.dart';
import 'componentes/escolas.dart';
import 'package:sed/service/registar_compra.serice.dart';

class Fornecedor {
  final String item;
  final String cie;
  final String quantidadeTotal;
  final String quantidadeEntrgue;


  Fornecedor(
      {required this.item,
      required this.cie,
      required this.quantidadeTotal,
      required this.quantidadeEntrgue,
});
}

class listagem extends StatelessWidget {
  final String name;
  const listagem({required this.name, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
            future: getCardFornecedorName(name),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                var jsonData = snapshot.data;
                print(jsonData);
                List<Fornecedor> fornecedoor = [];

                for (int i = jsonData!.length - 1; i >= 0; i--) {
                    var post = jsonData[i];
                    if (post != null) {
                      String item = post["item"];
                      String cie = post["cie"];
                      String quantidadeTotal = post["quantidade_total"];
                      String quantidadeEntrgue = post["quantidade_entregue"];
                      

                      fornecedoor.add(Fornecedor(
                          item: item,
                          cie: cie,
                          quantidadeTotal: quantidadeTotal,
                          quantidadeEntrgue: quantidadeEntrgue,
                      ));
                    }
                  }
                  return    ListView(
                      children: [
                         Titulo(titulo: name,
                        ),
                        for (var card in fornecedoor)
                        escolaCard(card.cie, 'São Paulo / Metropolitana', 'Rua dos Estudantes, 123', 'Em trânsito', 'Previsão de entrega 22/03/2023',card.quantidadeTotal, card.item),
                      ],
                    );
              }
              return const CircularProgressIndicator();
            }, 
          ),
    );
  }
}

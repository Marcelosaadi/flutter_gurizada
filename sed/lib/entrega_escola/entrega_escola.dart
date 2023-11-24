import 'package:flutter/material.dart';
import 'package:sed/entrega_escola/components/cardCie.dart';
import 'package:sed/service/registar_compra.serice.dart';
import '/home/components/sedName.dart';


class Fornecedor {
  final String item;
  final String cie;
  final String quantidadeTotal;
  final String quantidadeEntrgue;

  Fornecedor({
    required this.item,
    required this.cie,
    required this.quantidadeTotal,
    required this.quantidadeEntrgue,
  });
}

class entregaEscola extends StatelessWidget {
  final String name;
  const entregaEscola({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getCardDiretoriaName(name),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var jsonData = snapshot.data;
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
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: sedName(),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 60),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Entregas da sua escola:',
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
            for (var card in fornecedoor)
              cardCie(
                card.cie,
                card.quantidadeEntrgue,
                card.quantidadeTotal,
                context,
                card.item,
              ),
              const SizedBox(height: 20),
          ],
        ),
      );
  }return const CircularProgressIndicator();
  }
  ));
  }
  }
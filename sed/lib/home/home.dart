import 'package:flutter/material.dart';
import 'package:sed/home/components/cardEscola.dart';
import 'package:sed/home/components/cardFornecedor.dart';
import 'package:sed/service/registar_compra.serice.dart';
import './components/sedName.dart'; 

class Fornecedor {
  final String item;
  final String fornecedor;
  final String quantidadeTotal;
  final String quantidadeEntrgue;


  Fornecedor(
      {required this.item,
      required this.fornecedor,
      required this.quantidadeTotal,
      required this.quantidadeEntrgue,
});
}

class Diretoria {
  final String diretoria;
  final String quantidadeTotal;
  final String quantidadeEntrgue;


  Diretoria(
      {required this.diretoria,
      required this.quantidadeTotal,
      required this.quantidadeEntrgue,
});
}


class Home extends StatelessWidget { 
  const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Alinha os filhos horizontalmente ao centro
        children: [
          const Padding(
            padding:  EdgeInsets.only(top: 60.0),
            child: sedName(), // O seu widget customizado centralizado
          ),
          const SizedBox(height: 20), // Espaço depois do sedName
          const Padding(
            padding:  EdgeInsets.only(left: 60), // Alinha o texto à esquerda com padding
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Fornecedoras',
                style: TextStyle(
                  fontSize: 28
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: getCardFornecedor(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                var jsonData = snapshot.data;
                List<Fornecedor> fornecedoor = [];

                for (int i = jsonData!.length - 1; i >= 0; i--) {
                    var post = jsonData[i];
                    if (post != null) {
                      String item = post["item"];
                      String fornecedor = post["fornecedor"];
                      String quantidadeTotal = post["quantidade_total"];
                      String quantidadeEntrgue = post["quantidade_entregue"];
                      

                      fornecedoor.add(Fornecedor(
                          item: item,
                          fornecedor: fornecedor,
                          quantidadeTotal: quantidadeTotal,
                          quantidadeEntrgue: quantidadeEntrgue,
                      ));
                    }
                  }
                  return Column(
                    children: [
                      for (var card in fornecedoor)
                     fornecedorCard(
                      card.fornecedor, 
                      card.quantidadeEntrgue, 
                      card.quantidadeTotal,
                      context,
                      card.item
                      )
                    ],
                  );
              }
              return const CircularProgressIndicator();
            }, 
          ),
          const SizedBox(height: 20), 
          const Padding(
            padding:  EdgeInsets.only(left: 60),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Diretorias',
                style: TextStyle(
                  fontSize: 28
                ),
              ),
            ),
          ),
                    FutureBuilder(
            future: getCardDiretoria(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                var jsonData = snapshot.data;
                List<Diretoria> diretoriaa = [];

                for (int i = jsonData!.length - 1; i >= 0; i--) {
                    var post = jsonData[i];
                    if (post != null) {
                      String diretoria = post["diretoria"];
                      String quantidadeTotal = post["quantidade_total"];
                      String quantidadeEntrgue = post["quantidade_entregue"];
                      

                      diretoriaa.add(Diretoria(
                          diretoria: diretoria,
                          quantidadeTotal: quantidadeTotal,
                          quantidadeEntrgue: quantidadeEntrgue,
                      ));
                    }
                  }
                  return Column(
                    children: [
                      for (var card in diretoriaa)
                     escolaCard(
                      card.diretoria, 
                      card.quantidadeEntrgue, 
                      card.quantidadeTotal,
                      
                      )
                    ],
                  );
              }
              return const CircularProgressIndicator();
            }, 
          ),
          const SizedBox(height: 20),
          ElevatedButton( 
              onPressed: () {      
                Navigator.of(context).pushReplacementNamed("/cadastarEntrega");           
              },
              child: Text('Registrar compra',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(19, 81, 180, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
            ),
        ],
      ),
    ));
  }
}

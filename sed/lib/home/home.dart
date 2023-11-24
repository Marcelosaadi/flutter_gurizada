import 'package:flutter/material.dart';
import 'package:sed/home/components/cardEscola.dart';
import 'package:sed/home/components/cardFornecedor.dart';
import './components/sedName.dart'; 


class Home extends StatelessWidget { 
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
          fornecedorCard("mateus","200","200"),
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
          escolaCard("Escola 1","50","200"),
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
    );
  }
}

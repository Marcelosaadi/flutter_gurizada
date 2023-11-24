import 'package:flutter/material.dart';
import 'package:sed/home/components/cardFornecedor.dart';
import '/home/components/sedName.dart';

class entregaEscola extends StatelessWidget {
  const entregaEscola({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
            fornecedorCard("Dell", '200', '200', 'Notebooks'),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 60),
              child: Align(
                alignment: Alignment.centerLeft,
              ),
            ),
            fornecedorCard("Marcenaria do claudião", "190", "200", 'Mesas'),
            const SizedBox(height: 20),
            fornecedorCard(
                "Ventisol Industria e Comércio", '300', '300', 'Ventiladores'),
          ],
        ),
      ),
    );
  }
}

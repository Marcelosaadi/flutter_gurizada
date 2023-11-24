import 'package:flutter/material.dart';
import 'package:sed/home/components/sedName.dart';
import 'package:sed/service/registar_compra.serice.dart'; // Substitua pelo caminho real do seu header

class ConfirmarCodigo extends StatefulWidget {
  @override
  _ConfirmarCodigoState createState() => _ConfirmarCodigoState();
}

class _ConfirmarCodigoState extends State<ConfirmarCodigo> {
  String id = '';
  String codigo = ''; // Adicione um campo para o código

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              sedName(), // Removido o const daqui, se sedName não for um const Widget
              Card(
                elevation: 5,
                margin: EdgeInsets.all(16),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Digite seu ID e Código',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16), // Espaço entre o texto e os campos de input
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            id = value; // Atualiza o ID no estado
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'ID',
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            codigo = value; // Atualiza o código no estado
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Código de 5 dígitos',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.93,
                child: ElevatedButton(
                  onPressed: () {
                    if(codigo == '12345')
                     confirmarEntrega(id).then((value){
                      Navigator.of(context).pushReplacementNamed("/home");
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Entrega registrada com sucesso!'),
                                duration: Duration(seconds: 3),
                              ),
                            );
                    });
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

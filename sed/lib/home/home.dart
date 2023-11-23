import 'package:flutter/material.dart';
import './components/titulo_SED.dart';








class home_escola extends StatelessWidget {
    String email="";
    String senha="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fundo branco da tela
      body: Padding(
        padding:const EdgeInsets.only(left:100,right:100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText( // Texto 'SED' com cores diferentes
              text: TextSpan(
                style: TextStyle(fontSize: 60.0),
                children: [
                            TextSpan(
                              text: 'S',
                              style: TextStyle(color: Color.fromRGBO(38, 112, 232, 1)),
                            ),
                            TextSpan(
                              text: 'E',
                              style: TextStyle(color: Color.fromRGBO(37, 211, 102, 1)),
                            ),
                            TextSpan(
                              text: 'D',
                              style: TextStyle(color: Color.fromRGBO(242, 227, 23, 1)),
                            ),
                          ],
              ),
            ),
            SizedBox(height: 40.0),
            // Container para o campo de email com sombra
            Container(
              height:80,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                  onChanged:(text){
                    email=text;
                  },
                decoration: InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.symmetric(vertical: 40,horizontal: 150),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 60),
            // Container para o campo de senha com sombra
            Container(
              height:80,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                  onChanged:(text){
                    senha=text;
                  },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  contentPadding: EdgeInsets.symmetric(vertical: 40,horizontal: 150),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton( // Botão Acessar
              onPressed: () {
                    if (email=='adm' && senha=='123'){
                        //muda para home
                    }      // Mostra o SnackBar
                 
              },
              child: Text('Acessar',
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
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

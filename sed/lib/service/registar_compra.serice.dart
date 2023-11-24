import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main () {
  // createCompra("item", "diretoria", 1, "fornecedor", "cie", 1);
  // getCardFornecedor();
  // getCardFornecedorName('Weblabor São Paulo Materiais Didáticos');
  // getCardDiretoriaName('Centro Sul');
  // confirmarEntrega("13");

}

const String baseUrl = "http://192.168.15.6:3000/seduc";

Future<void> createCompra(
  String item, String diretoria, int quantidade, String fornecedor, String cie, int prazo) async {
  try {
    var url = Uri.parse(baseUrl);
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
    "item": item,
    "diretoria": diretoria,
    "quantidade": quantidade,
    "fornecedor": fornecedor,
    "cie": cie,
    "prazo": prazo,
    });

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Post enviado com sucesso!");
    } else {
      throw Exception(
          "Failed to send post. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to send post: $e");
  }
  }


Future<List<dynamic>> getCardFornecedor() async {
  try {
    var response = await http.get(Uri.parse("$baseUrl/itens"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      //  print(jsonData);
      return List<dynamic>.from(jsonData);
    } else {
      throw Exception(
          "Failed to load posts. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to load posts: $e");
  }
}

Future<List<dynamic>> getCardDiretoria() async {
  try {
    var response = await http.get(Uri.parse("$baseUrl/diretoria"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      //  print(jsonData);
      return List<dynamic>.from(jsonData);
    } else {
      throw Exception(
          "Failed to load posts. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to load posts: $e");
  }
}

Future<List<dynamic>> getCardFornecedorName(String name) async {
  try {
    var response = await http.get(Uri.parse("$baseUrl/fornecedor/escola/$name"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      //  print(jsonData);
      return List<dynamic>.from(jsonData);
    } else {
      throw Exception(
          "Failed to load posts. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to load posts: $e");
  }
}

Future<List<dynamic>> getCardDiretoriaName(String name) async {
  try {
    var response = await http.get(Uri.parse("$baseUrl/cie/diretoria/$name"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      //  print(jsonData);
      return List<dynamic>.from(jsonData);
    } else {
      throw Exception(
          "Failed to load posts. Status code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Failed to load posts: $e");
  }
}
  
Future<void> confirmarEntrega(String id) async {
 await http.patch(Uri.parse("$baseUrl/entrega/$id"));
}


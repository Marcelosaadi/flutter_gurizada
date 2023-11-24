import 'package:flutter/material.dart';

Padding fornecedorCard(String nome, String quantidade, String total) {
  double progress = int.parse(quantidade) / int.parse(total);
  Color progressBarColor = progress >= 1 ? Colors.green : Colors.red;
  
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              nome.toUpperCase(), // Nome em maiúsculas
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '$quantidade Tablets',
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 4.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(progressBarColor),
                minHeight: 20,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              '$quantidade/$total',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    ),
  );
}

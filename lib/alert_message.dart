import 'package:flutter/material.dart';

class AlertMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Adicione valores de peso e altura \npara calcular o IMC',
      style: TextStyle(
        fontSize: 20,
        fontStyle: FontStyle.italic,
        color: Colors.purple,
      ),
      textAlign: TextAlign.center,
    );
  }
}

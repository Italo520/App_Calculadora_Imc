import 'package:flutter/material.dart';

class BotaoCalcularImc extends StatelessWidget {
  BotaoCalcularImc({required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          minimumSize: const Size(200, 60),
        ),
        child: Text('Calcular', style: TextStyle(fontSize: 21)),
      ),
    );
  }
}

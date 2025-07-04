// ignore_for_file: sized_box_for_whitespace

import 'package:calculadora_imc/alert_message.dart';
import 'package:calculadora_imc/botao_calcular_IMC.dart';
import 'package:calculadora_imc/info_IMC.dart';
import 'package:flutter/material.dart';

class CalculadoraDeImc extends StatefulWidget {
  const CalculadoraDeImc({super.key});

  @override
  State<CalculadoraDeImc> createState() => _CalculadoraDeImcState();
}

class _CalculadoraDeImcState extends State<CalculadoraDeImc> {
  late TextEditingController pesoController;
  late TextEditingController alturaController;

  double valorPeso = 0.0;
  double valorAltura = 0.5;
  double? imc;
  String? classificacao;
  Color? corResultado;

  @override
  void initState() {
    pesoController = TextEditingController(text: valorPeso.toString());
    alturaController = TextEditingController(text: valorAltura.toString());
    super.initState();
  }

  @override
  void dispose() {
    pesoController.dispose();
    alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imc == null
                ? AlertMessage()
                : InfoImc(
                    corResultado: corResultado,
                    imc: imc,
                    classificacao: classificacao,
                  ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Seu Peso'),
                      SizedBox(height: 10),
                      Container(
                        width: 95,
                        child: TextField(
                          enabled: false,
                          controller: pesoController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            suffixText: 'kg',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          activeTickMarkColor: Colors.purple,
                          trackHeight: 1.5,
                        ),
                        child: Slider(
                          value: valorPeso,
                          activeColor: Colors.purple,
                          onChanged: (peso) {
                            setState(() {
                              valorPeso = peso;
                              pesoController.text = valorPeso.toStringAsFixed(
                                2,
                              );
                            });
                          },
                          min: 0,
                          max: 250,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 22),
                Expanded(
                  child: Column(
                    children: [
                      Text('Sua Altura'),
                      SizedBox(height: 10),
                      Container(
                        width: 75,
                        child: TextField(
                          enabled: false,
                          controller: alturaController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            suffixText: 'm',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          activeTickMarkColor: Colors.purple,
                          trackHeight: 1.5,
                        ),
                        child: Slider(
                          value: valorAltura,
                          activeColor: Colors.purple,
                          onChanged: (altura) {
                            setState(() {
                              valorAltura = altura;
                              alturaController.text = valorAltura
                                  .toStringAsFixed(2);
                            });
                          },
                          min: 0.5,
                          max: 2.50,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 22),
            BotaoCalcularImc(
              onPressed: () {
                try {
                  double peso = double.parse(pesoController.text);
                  double altura = double.parse(alturaController.text);
                  setState(() {
                    imc = peso / (altura * altura);
                    classificacao = getClassificacaoIMC(imc!);
                    corResultado = getCorIMC(imc!);
                  });
                } on Exception {
                  setState(() {
                    imc = null;
                    classificacao = null;
                    corResultado = null;
                    pesoController.text = '';
                    alturaController.text = '';
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  String? getClassificacaoIMC(double imc) {
    if (imc <= 18.5) {
      return 'Abaixo do Peso';
    } else if (imc <= 24.9) {
      return 'Peso Normal';
    } else if (imc <= 29.9) {
      return 'Sobrepeso';
    } else if (imc <= 34.9) {
      return 'Obesidade Grau I';
    } else if (imc <= 39.9) {
      return 'Obesidade Grau II';
    } else if (imc >= 40.0) {
      return 'Obesidade Grau III';
    } else {
      return null;
    }
  }

  Color getCorIMC(double imc) {
    if (imc <= 18.5) {
      return Colors.blue;
    } else if (imc <= 24.9) {
      return Colors.green;
    } else if (imc <= 29.9) {
      return Color(0xFFF4BE8E);
    } else if (imc <= 34.9) {
      return Color(0xFFEE9809);
    } else if (imc <= 39.9) {
      return Color(0xFFE44F38);
    } else if (imc >= 40.0) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }
}

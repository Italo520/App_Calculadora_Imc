import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: CalculadoraDeImc(),
    );
  }
}

class CalculadoraDeImc extends StatefulWidget {
  const CalculadoraDeImc({super.key});

  @override
  State<CalculadoraDeImc> createState() => _CalculadoraDeImcState();
}

class _CalculadoraDeImcState extends State<CalculadoraDeImc> {
  TextEditingController pesoController = TextEditingController(text: '');
  TextEditingController alturaController = TextEditingController(text: '');

  double imc;
  String classificacao;
  Color corResultado;

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
                ? Text(
                    'Adicione valores de peso e altura \npara calcular o IMC',
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.purple,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      border: Border.all(width: 10, color: Colors.green),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '24:22',
                          style: TextStyle(fontSize: 42, color: Colors.green),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Peso Normal',
                          style: TextStyle(fontSize: 20, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Seu Peso'),
                    SizedBox(height: 10),
                    Container(
                      width: 75,
                      child: TextField(
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
                  ],
                ),
                SizedBox(width: 22),
                Column(
                  children: [
                    Text('Sua Altura'),
                    SizedBox(height: 10),
                    Container(
                      width: 75,
                      child: TextField(
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
                  ],
                ),
              ],
            ),
            SizedBox(height: 22),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 60),
              ),
              child: Text('Calcular', style: TextStyle(fontSize: 21)),
            ),
          ],
        ),
      ),
    );
  }
}

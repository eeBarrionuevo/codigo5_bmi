import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = 160;
  double weight = 50;
  double bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Calcular IMC"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Altura:"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  // height.toInt().toString(),
                  height.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  "cm",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            Slider(
              value: height,
              min: 120,
              max: 250,
              onChanged: (double value) {
                height = value;
                setState(() {});
              },
            ),
            const Text("Peso:"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  // height.toInt().toString(),
                  weight.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  "kg",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            Slider(
              value: weight,
              min: 30,
              max: 120,
              onChanged: (double value) {
                weight = value;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 12.0,
            ),
            SizedBox(
              height: 50.0,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  bmi = weight / pow((height * 0.01), 2);
                  setState(() {});
                },
                child: Text("Calcular"),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: Card(
                child: Column(
                  children: [
                    Text(
                      bmi.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Normal",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.indigo,
                      ),
                    ),
                    Text(
                      "Debes de comer más saludable de comer más saludable de comer más saludable asdasd asdasd asdsasd sadasdasd",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        "assets/images/image1.png",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

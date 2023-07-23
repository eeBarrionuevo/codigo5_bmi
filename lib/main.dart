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

  // double bmi = 0;
  // String result = "";
  // String recommendation = "";
  // String image = "image1";

  // void calculate() {
  //   bmi = weight / pow((height * 0.01), 2);
  //   // 18.49 Bajo peso
  //   // 18.5 y 24.9 // Normal
  //   // 25 Sobrepeso

  //   if (bmi < 18.5) {
  //     //Bajo peso
  //     result = "Bajo peso";
  //     recommendation = "Debes de comer sano y hacer ejercicio.";
  //     image = "image1";
  //   } else if (bmi < 25) {
  //     //bmi >= 18.5 && bmi < 25
  //     //Normal
  //     result = "Normal";
  //     recommendation =
  //         "Todo va bien, no olvides de comer sano y seguir haciendo ejercicios.";

  //     image = "image2";
  //   } else {
  //     //Sobrepeso
  //     result = "Sobrepeso";
  //     recommendation =
  //         "Debes de comer más sano y realizar ejercicio constantemente.";
  //     image = "image3";
  //   }
  //   setState(() {});
  // }

  double calculateBMI() {
    return weight / pow((height * 0.01), 2);
  }

  String getResult() {
    //Bajo peso, Normal, Sobrepeso
    double bmi = calculateBMI();
    String result = "";

    if (bmi < 18.5) {
      // return "Bajo peso";
      result = "Bajo peso";
    } else if (bmi < 25) {
      // return "Normal";
      result = "Normal";
    } else {
      // return "Sobrepeso";
      result = "Sobrepeso";
    }

    return result;
  }

  String getRecommendation() {
    double bmi = calculateBMI();
    String recommendation = "";

    if (bmi < 18.5) {
      // return "Bajo peso";
      recommendation = "Debes de comer más sano y hacer ejercicio.";
    } else if (bmi < 25) {
      // return "Normal";
      recommendation = "Todo va muy bien, sigue de esa forma.";
    } else {
      // return "Sobrepeso";
      recommendation =
          "Debes de comer más sano y tienes que realizar más ejercicios";
    }

    return recommendation;
  }

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
                  // calculate();
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
                      calculateBMI().toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      getResult(),
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.indigo,
                      ),
                    ),
                    Text(
                      getRecommendation(),
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

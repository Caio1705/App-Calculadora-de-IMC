import 'package:flutter_imc_calculator/constants/app_constants.dart';
import 'package:flutter_imc_calculator/widgets/right_bar.dart' as right;
import 'package:flutter_imc_calculator/widgets/left_bar.dart' as left;
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double _a;
    double _p;

    return Scaffold(
      backgroundColor: mainHexColor,

      //---------------------------- appBar -------------------------------------
      appBar: AppBar(
        title: Text(
          "Calculador de IMC",
          style: TextStyle(
            color: accentHexColor,
            fontSize: 22.5,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),

      // ---------------------------- body -------------------------------------
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),

            // ---------------------------- Linha de Widgets -------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ---------------------------- Left Text Field -------------------------------------
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: ControladorAltura,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: accentHexColor,
                        ),
                      ),
                      hintText: "Altura",
                      hintStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),

                // ---------------------------- Right Text Field -------------------------------------
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: ControladorPeso,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: accentHexColor,
                        ),
                      ),
                      hintText: "Massa",
                      hintStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // ---------------------------- Gesture Detector -------------------------------------
            GestureDetector(
              onTap: () {
                _a = double.parse(ControladorAltura.text);
                _p = double.parse(ControladorPeso.text);
                setState(() {
                  ResultadoIMC = (_p / (_a * _a));
                  if (ResultadoIMC <= 18.5) {
                    ResultadoTexto = "Abaixo do Peso";
                  } else if (ResultadoIMC > 18.5 && ResultadoIMC <= 24.9) {
                    ResultadoTexto = "Peso Ideal";
                  } else if (ResultadoIMC > 24.9 && ResultadoIMC <= 29.9) {
                    ResultadoTexto = "Levemente acima do peso";
                  } else if (ResultadoIMC > 29.9 && ResultadoIMC <= 34.9) {
                    ResultadoTexto = "Obesidade grau I";
                  } else if (ResultadoIMC > 34.9 && ResultadoIMC <= 39.9) {
                    ResultadoTexto = "Obesidade grau II (severa)";
                  } else if (ResultadoIMC > 39.9) {
                    ResultadoTexto = "Obesidade grau III (mórbida)";
                  }
                });
              },
              child: Text(
                "Calcular",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor,
                ),
              ),
            ),

            // ---------------------------- Resultado IMC valor -------------------------------------
            const SizedBox(height: 50),
            Text(
              ResultadoIMC.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 90,
                color: accentHexColor,
              ),
            ),

            // ---------------------------- Resultado IMC texto -------------------------------------
            const SizedBox(height: 30),
            Text(
              ResultadoTexto,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: accentHexColor,
              ),
            ),

            // ---------------------------- Beauty Widgets -------------------------------------
            const SizedBox(height: 10),
            const right.RightBar(barWidth: 40),
            const SizedBox(height: 20),
            const right.RightBar(barWidth: 70),
            const SizedBox(height: 20),
            const right.RightBar(barWidth: 40),
            const SizedBox(height: 20),
            const left.LeftBar(barWidth: 70),
            const SizedBox(height: 50),
            const left.LeftBar(barWidth: 70)
          ],
        ),
      ),
    );
  }
}

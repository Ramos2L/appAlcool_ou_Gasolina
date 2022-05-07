import 'package:app_alcool_ou_gasolina/controller/homecontroller.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controllerHome = HomeController();

  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Álcool ou Gasolina"),
        backgroundColor: const Color.fromARGB(255, 0, 3, 189),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image(image: AssetImage("assets/images/gas.png")),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Text(
                "Saiba qual a melhor opção para o abastecimento do seu carro",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Preço Álcool",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 3, 189), width: 2.0),
                  ),
                  floatingLabelStyle:
                      TextStyle(color: Color.fromARGB(255, 0, 3, 189)),
                ),
                controller: _controllerAlcool,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Preço Gasolina",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 3, 189), width: 2.0),
                  ),
                  floatingLabelStyle:
                      TextStyle(color: Color.fromARGB(255, 0, 3, 189)),
                ),
                controller: _controllerGasolina,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _textoResultado = controllerHome.calcular(
                      _controllerAlcool.text, _controllerGasolina.text);
                });
                FocusScopeNode currentFocus = FocusScope.of(context);
                currentFocus.unfocus();
              },
              child: const Text("Calcular"),
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 0, 3, 189),
                  padding: const EdgeInsets.all(20)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                _textoResultado,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

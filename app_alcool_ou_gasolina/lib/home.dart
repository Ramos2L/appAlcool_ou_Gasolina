import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular () {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if ( precoAlcool == null || precoGasolina == null ){
      
      showAlertDialog(context, 'Entrada inválida', 'Digite números maiores que 0 e utilizando (.)');
      
    } else {
      
      if ( (precoAlcool / precoGasolina) >= 0.7 ){
        setState(() {
          _textoResultado = ("Abasteça com Gasolina");  
        });
      } else {
        setState(() {
          _textoResultado = ("Abasteça com Álcool");  
        });
      }

      _limparCampos();
      FocusScopeNode currentFocus = FocusScope.of(context);
      currentFocus.unfocus();

    }
  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

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
          children: <Widget> [
            const Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image(image: AssetImage("assets/images/gas.png")),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Text(
                "Saiba qual a melhor opção para o abastecimento do seu carro",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Preço Álcool",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 0, 3, 189), width: 2.0),
                  ),
                  floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 0, 3, 189)),
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
                    borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 0, 3, 189), width: 2.0),
                  ),
                  floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 0, 3, 189)),
                ),
                controller: _controllerGasolina,
              ),
            ),
            ElevatedButton(
              onPressed: _calcular, 
              child: const Text("Calcular"),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 0, 3, 189),
                padding: const EdgeInsets.all(20)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                _textoResultado,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  showAlertDialog(BuildContext context, String titulo, String conteudo){
    Widget okButton = TextButton(
      onPressed: (){
        Navigator.of(context).pop();
      }, 
      child: const Text("Ok")
    );

    AlertDialog alerta = AlertDialog(
      title: Text(titulo),
      content: Text(conteudo),
      actions: [
        okButton
      ],
    );

    showDialog(
      context: context, 
      builder: (BuildContext context){
        return alerta;
      }
    );
  }
}

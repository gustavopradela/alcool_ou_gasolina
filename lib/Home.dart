import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _resultado = "";
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _resultado = "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    } else {
       if (precoAlcool/precoGasolina >= 0.7) {
         setState(() {
           _resultado = "Melhor abastecer com Gasolina";
         });
       } else {
         setState(() {
           _resultado = "Melhor abastecer com Álcool";
         });
       }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "images/logo.png",
                ),
                Padding(
                  padding: EdgeInsets.only(bottom:32),
                  child: Text(
                    "Saiba qual a melhor opção para abastecer o seu carro",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: _controllerAlcool,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Preço do Álcool",
                        hintText: "Preço do Álcool ex 1.59"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: _controllerGasolina,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Preço da Gasolina",
                        hintText: "Preço da Gasolina ex: 3.15"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.only(
                            bottom: 12, top: 12),
                        color: Colors.blue,
                        child: Text(
                          "Calcular",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        onPressed: _calcular,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                      _resultado,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

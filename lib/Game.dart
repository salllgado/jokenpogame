import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  var defaultImage = AssetImage("images/padrao.png");
  
  void getRandom(String userChoise) {
    var alertTitle = "Resutado";
    var alertMessage = "Você ganhou";

    var option = ["pedra", "papel", "tesoura"];
    var pcOption = option[Random().nextInt(3)];

    setState(() {
      this.defaultImage = AssetImage("images/$pcOption.png");
    });

    if (userChoise == "pedra" && pcOption == "tesoura") {
      alertMessage = "Você Ganhou";
    } else if (userChoise == "papel" && pcOption == "pedra") {
      alertMessage = "Você Ganhou";
    } else if (userChoise == "tesoura" && pcOption == "papel") {
      alertMessage = "Você Ganhou";
    } else if (userChoise == "papel" && pcOption == "tesoura") {
      alertMessage = "Você Perdeu";
    } else if (userChoise == "tesoura" && pcOption == "pedra") {
      alertMessage = "Você Perdeu";
    } else if (userChoise == "pedra" && pcOption == "papel") {
      alertMessage = "Você Perdeu";
    } else if (userChoise == "pedra" && pcOption == "pedra") {
      alertMessage = "Empate";
    } else if (userChoise == "papel" && pcOption == "papel") {
      alertMessage = "Empate";
    } else if (userChoise == "tesoura" && pcOption == "tesoura") {
      alertMessage = "Empate";
    }

    showDialog(
      context:  context,
      builder:  (BuildContext context) {
        return AlertDialog(
          title: Text(alertTitle),
          content: Text(alertMessage),
          actions: <Widget>[
            FlatButton(
              child: Text("Recomeçar"),
              onPressed: () {
                this.restart();
              },
            )
          ],
        );
      },
    );
  }

  void restart() {
    setState(() {
      this.defaultImage = AssetImage("images/padrao.png");
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo the game"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Escolha do app",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(
            image: this.defaultImage,
            width: 110,
            height: 110
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Escolha uma opção abaixo:",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () => getRandom("pedra"),
                  child: Image.asset(
                    "images/pedra.png",
                    height: 80,
                    width: 80,
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () => getRandom("papel"),
                    child: Image.asset(
                      "images/papel.png",
                      height: 80,
                      width: 80,
                    ),
                  ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () => getRandom("tesoura"),
                  child: Image.asset(
                    "images/tesoura.png",
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

/// Classe responsável pelas ações do jogo.
class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";

  /// Método para definir a escolha do usuário.
  /// O parâmetro [escolhaUsuario] é responsável pelo opção escolhida do usuário.
  void _optionSelecionada(String escolhaUsuario) {

    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do usuário: " + escolhaUsuario);

    /// Exibição da imagem escolhida pelo App.
    switch(escolhaApp){
      case "pedra" :
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.png");
        });
        break;

      case "papel" :
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.png");
        });
        break;

      case "tesoura" :
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;
    }

    /// Validação do vencedor.
    /// Usuário vencedor.
    if(
        (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ) {
      setState(() {
        this._mensagem = "Parabéns!!! Você venceu :)";
      });
    /// App vencedor
    }else if(
        (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")
    ){
      setState(() {
        this._mensagem = "Você perdeu :(";
      });
    }else {
      setState(() {
        this._mensagem = "Empatamos ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPô"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _optionSelecionada("pedra"),
                child: Image.asset("imagens/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _optionSelecionada("papel"),
                child: Image.asset("imagens/papel.png", height: 100,),
              ),
              GestureDetector(onTap: () => _optionSelecionada("tesoura"),
                child: Image.asset("imagens/tesoura.png", height: 100,),),
            ],
          )
        ],
      ),
    );
  }
}

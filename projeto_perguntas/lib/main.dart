import 'package:flutter/material.dart';
import './questionário.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontosTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'ponto': 3},
        {'texto': 'Vermelho', 'ponto': 2},
        {'texto': 'Verde', 'ponto': 1},
        {'texto': 'Branco', 'ponto': 0},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'ponto': 5},
        {'texto': 'Cobra', 'ponto': 8},
        {'texto': 'Elefante', 'ponto': 9},
        {'texto': 'Leão', 'ponto': 10},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Maria', 'ponto': 5},
        {'texto': 'João', 'ponto': 10},
        {'texto': 'Leo', 'ponto': 3},
        {'texto': 'Pedro', 'ponto': 7},
      ],
    },
  ];

  void _responder(int ponto) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontosTotal += ponto;
      });
    }
    print(_pontosTotal);
  }

  void _reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontosTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas', style: TextStyle(fontSize: 22)),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(pontuacao: _pontosTotal, reiniciar: _reiniciar),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PerguntaAppState();
  }
}

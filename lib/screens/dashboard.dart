// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:progdispmobdsm4/screens/livros/lista_livros.dart';

const _tituloAppBar = 'Dashboard';

class Dashboard extends StatefulWidget {
  final List<Dashboard> _Dashboard = [];

  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
        backgroundColor: Colors.orange,
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: SafeArea(
          child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => (Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ListaLivros();
                },
              ),
            )),
            child: Container(
              constraints: BoxConstraints.expand(
                width: 160.0,
                height: 115.0,
              ),
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              color: Colors.orange, // Centraliza o conteúdo dentro do Container
              child: Column(
                // Alinha o conteúdo à esquerda
                children: <Widget>[
                  Icon(Icons.contact_phone),
                  Padding(
                    padding: const EdgeInsets.only(
                        top:
                            8.0), // Ajuste opcional para espaçamento entre o ícone e o texto
                    child: Text("Livros"),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

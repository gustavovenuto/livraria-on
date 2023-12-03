// ignore_for_file: empty_constructor_bodies, dead_code

import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;
  final bool? kbNumeric;

  Editor(
      {this.controlador, this.rotulo, this.dica, this.icone, this.kbNumeric});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
          controller: controlador,
          style: TextStyle(fontSize: 24.0),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            icon: icone != null ? Icon(icone) : null,
            labelText: rotulo,
            hintText: dica,
          ),
          keyboardType: TextInputType.emailAddress),
    );
  }
}

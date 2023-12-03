import 'package:flutter/material.dart';
import '../../models/livros.dart';
import './livros_cad.dart'; // Importe o arquivo correto

const _tituloAppBar = 'Lista de Livros';

class ListaLivros extends StatefulWidget {
  final List<Livro> _livros = [];

  @override
  State<StatefulWidget> createState() {
    return ListaLivrosState();
  }
}

class ListaLivrosState extends State<ListaLivros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: widget._livros.length,
        itemBuilder: ((context, indice) {
          final livro = widget._livros[indice];
          return ItemLivro(livro);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Livro?> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  FormularioLivros(), // Use o construtor correto aqui
            ),
          );
          future.then(
            (livroRecebido) {
              if (livroRecebido != null) {
                setState(
                  () {
                    widget._livros.add(
                      livroRecebido,
                    );
                  },
                );
              }
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}

class ItemLivro extends StatelessWidget {
  final Livro _livro;

  ItemLivro(this._livro);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          leading: Icon(Icons.person),
          title: Padding(
            padding: const EdgeInsets.only(right: 160.0),
            child: Column(
              children: [
                Text(_livro.titulo.toString(),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.ltr),
              ],
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(right: 160.0),
            child: Column(
              children: [
                Text(
                  _livro.autor.toString(),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.ltr,
                ),
                Text(_livro.genero.toString(),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.ltr),
                Text(_livro.numeroPaginas.toString(),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.ltr),
                Text(_livro.anoLancamento.toString(),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.ltr),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

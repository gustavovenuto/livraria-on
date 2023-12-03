import 'package:flutter/material.dart';
import '../../components/editor.dart';
import '../../models/livros.dart';
import '../../utils/database_helper.dart';

const _tituloAppBar = 'Cadastro de Livros';

const _rotuloCampoTitulo = 'Titulo';
const _dicaCampoTitulo = 'Insira o Titulo do livro';

const _rotuloCampoAutor = 'Autor';
const _dicaCampoAutor = 'Insira o Autor';

const _rotuloCampoGenero = 'Genero';
const _dicaCampoGenero = 'Insira o Genero';

const _rotuloCampoNumeroPaginas = 'Numero de paginas';
const _dicaCampoNumeroPaginas = 'Insira numero de paginas';

const _rotuloCampoAnoLancamento = 'Ano Lançamento';
const _dicaCampoAnoLancamento = 'Insira o Ano de Lançamento';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioLivros extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioLivrosState();
  }
}

class FormularioLivrosState extends State<FormularioLivros> {
  DatabaseHelper dbHelper = DatabaseHelper.instance;

  final TextEditingController _controladorCampoTitulo = TextEditingController();
  final TextEditingController _controladorCampoAutor = TextEditingController();
  final TextEditingController _controladorCampoGenero = TextEditingController();
  final TextEditingController _controladorCampoNumeroPaginas =
      TextEditingController();
  final TextEditingController _controladorCampoAnoLancamento =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorCampoTitulo,
              rotulo: _rotuloCampoTitulo,
              dica: _dicaCampoTitulo,
            ),
            Editor(
              controlador: _controladorCampoAutor,
              rotulo: _rotuloCampoAutor,
              dica: _dicaCampoAutor,
            ),
            Editor(
              controlador: _controladorCampoGenero,
              rotulo: _rotuloCampoGenero,
              dica: _dicaCampoGenero,
            ),
            Editor(
              controlador: _controladorCampoNumeroPaginas,
              rotulo: _rotuloCampoNumeroPaginas,
              dica: _dicaCampoNumeroPaginas,
            ),
            Editor(
              controlador: _controladorCampoAnoLancamento,
              rotulo: _rotuloCampoAnoLancamento,
              dica: _dicaCampoAnoLancamento,
            ),
            ElevatedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () {
                _criaLivros(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }

  void _criaLivros(BuildContext context) async {
    print("Clicou em Confirmar");
    final String titulo = _controladorCampoTitulo.text;
    final String autor = _controladorCampoAutor.text;
    final String genero = _controladorCampoGenero.text;
    final int numeroPaginas =
        int.tryParse(_controladorCampoNumeroPaginas.text) ?? 0;
    final int anoLancamento =
        int.tryParse(_controladorCampoAnoLancamento.text) ?? 0;

    final livroCriado = Livro(
      titulo: titulo,
      autor: autor,
      genero: genero,
      numeroPaginas: numeroPaginas,
      anoLancamento: anoLancamento,
    );
    print('inserindo');
    await dbHelper.insertLivro(livroCriado);

    Navigator.pop(context, livroCriado);
  }
}

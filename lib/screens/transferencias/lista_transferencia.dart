import 'package:flutter/material.dart';
import '../../models/transferencia.dart';
import 'formulario_transferencia.dart';

const _tituloAppBar = 'Transferência';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: ((context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          );
          future.then(
            (transferenciaRecebida) {
              // debugPrint('Chegou no then do future');
              // debugPrint('$transferenciaRecebida');
              if (transferenciaRecebida != null) {
                setState(
                  () {
                    widget._transferencias.add(
                      transferenciaRecebida,
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

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(
         "R\$ " + _transferencia.valor.toString().replaceAll('.', ','),
        //  "R\$ " + _transferencia.valor.toString() + ",00",
        ),
        subtitle: Text(
          _transferencia.numeroConta.toString(),
        ),
      ),
    );
  }
}

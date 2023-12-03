import 'package:flutter/material.dart';
import 'screens/dashboard.dart';
import 'utils/database_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa a fábrica de banco de dados FFI
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  // Crie uma instância de DatabaseHelper
  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  // Inicialize o banco de dados
  await databaseHelper.database;

  runApp(
    Livraria(),
  );
}

class Livraria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}

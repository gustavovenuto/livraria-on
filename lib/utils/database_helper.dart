// lib/utils/database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/livros.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static const String _databaseName = 'livros.db';
  static const String _tableName = 'livros';
  static const int _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Database? _database;

  Future<Database> get database async {
    print('caiu aqui no database');
    if (_database != null && _database!.isOpen) {
      print('caiu no if do banco');
      return _database!;
    }
    print('fora do ir');
    _database = await _initDatabase();
    print(_database);
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      sqfliteFfiInit(); // Inicializa a fábrica de banco de dados FFI
      final path = join(await getDatabasesPath(), _databaseName);
      _database = await openDatabase(
        path,
        version: _databaseVersion,
        onCreate: _onCreate,
      );
      return _database!;
    } catch (e) {
      print('Erro na inicialização do banco de dados: $e');
      rethrow;
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY,
        titulo TEXT NOT NULL,
        autor TEXT NOT NULL,
        genero TEXT NOT NULL,
        numeroPaginas INTEGER NOT NULL,
        anoLancamento INTEGER NOT NULL
      )
    ''');
    print('Tabela $_tableName criada com sucesso!');
  }

  Future<int> insertLivro(Livro livro) async {
    print('insertlivro');
    print(livro);
    final db = await database;
    print('passou');
    print(db);
    final id = await db.insert(_tableName, livro.toMap());
    print('Livro inserido com ID: $id');
    return id;
  }

  Future<List<Livro>> getLivros() async {
    final db = await database;
    final maps = await db.query(_tableName);
    print('Recuperados ${maps.length} livros do banco de dados.');
    return List.generate(maps.length, (index) {
      return Livro.fromMap(maps[index]);
    });
  }
}

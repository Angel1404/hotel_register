import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/clientes_model.dart';

class DBClientes {
  //SQLlite Database para historial de busqueda
  static Database? _dataBase;
  static final DBClientes db = DBClientes._();
  DBClientes._();
  Future<Database?> get database async {
    if (_dataBase != null) return _dataBase;
    _dataBase = await initDB();
    return _dataBase;
  }

  Future<Database> initDB() async {
    //Path de donde almacenaremos la base de datos en el dispositivo
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    //El join es para unir el path y hacer un  tipo de url

    final path = join(documentDirectory.path, 'Clientes.db');
    return await openDatabase(path,
        // Aumentar cada vez que se haga cambios
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE Clientes(
        id INTEGER primary key autoincrement,
        name VARCHAR(100),
        adress VARCHAR(100),
        city VARCHAR(100),
        country VARCHAR(100),
        phone VARCHAR(100),
        email VARCHAR(100),
        filePdf TEXT,
        createdAt DATETIME,
        updatedAt DATETIME
      )
      ''');
    });
  }

  Future nuevoRegistro(ClienteModels result) async {
    final db = await database;

    await db?.insert('Clientes', result.toMapInsert(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ClienteModels>> obtenerResgistros({required String id}) async {
    final db = await database;
    final res = await db?.rawQuery('SELECT * FROM Clientes WHERE id = ? ORDER BY createdAt DESC', [(id)]);
    return res!.isNotEmpty ? res.map((s) => ClienteModels.fromJson(s)).toList() : [];
  }

  Future<List<ClienteModels>> obtenerAllResgistros() async {
    final db = await database;
    final res = await db?.rawQuery('SELECT * FROM Clientes ORDER BY createdAt DESC');
    return res!.isNotEmpty ? res.map((s) => ClienteModels.fromJson(s)).toList() : [];
  }

  Future<int> deleteCliente(String idUser) async {
    final db = await database;

    final res = await db?.rawDelete('DELETE FROM Clientes WHERE idUser = ?', [(idUser)]);
    return res!;
  }
}

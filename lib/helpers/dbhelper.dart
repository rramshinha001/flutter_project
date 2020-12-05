
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:lapor_app/models/laporan.dart';
class DatabaseHelper{
  static const _databaseName = 'LaporanData.db';
  static const _databaseVersion = 1;


  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  Database _database;
  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory dataDirectory =await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    return await openDatabase(dbPath,version: _databaseVersion, onCreate: _onCreateDB);
  }

  _onCreateDB(Database db, int version) async {

      await db.execute(''' 
        CREATE TABLE ${Laporan.tblLapor}(
          ${Laporan.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${Laporan.colPerihal} TEXT NOT NULL,
          ${Laporan.colKeterangan} TEXT NOT NULL,
        )
      ''');
  }


   //contact - insert
  Future<int> insertLaporan(Laporan laporan) async {
    Database db = await database;
    return await db.insert(Laporan.tblLapor, laporan.toMap());
  }

//contact - update
  Future<int> updateLaporan(Laporan laporan) async {
    Database db = await database;
    return await db.update(Laporan.tblLapor, laporan.toMap(),
        where: '${Laporan.colId}=?', whereArgs: [laporan.id]);
  }

//contact - delete
  Future<int> deleteLaporan(int id) async {
    Database db = await database;
    return await db
        .delete(Laporan.tblLapor, where: '${Laporan.colId}=?', whereArgs: [id]);
  }

//contact - retrieve all
  Future<List<Laporan>> fetchLaporan() async {
    Database db = await database;
    List<Map> laporann = await db.query(Laporan.tblLapor);
    return laporann.length == 0
        ? []
        : laporann.map((x) => Laporan.fromMap(x)).toList();
  }
}

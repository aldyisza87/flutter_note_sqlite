import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDataSource {
  final String dbName = 'notes_local01.db';
  final String tableName = 'notes';

  // Future<Database> _openDatabase() async {
  //   final databasePath = await getDatabasesPath();
  //   final path = join(databasePath, dbName);
  // }
}

import 'package:flutter_note_app/data/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDataSource {
  final String dbName = 'notes_local03.db';
  final String tableName = 'notes';

  Future<Database> _openDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            content TEXT,
            createAt TEXT)''',
        );
      },
    );
  }

  Future<int> insertNote(Note note) async {
    final db = await _openDatabase();
    return await db.insert(tableName, note.toMap());
  }

// get all note
  Future<List<Note>> getNotes() async {
    final db = await _openDatabase();
    final maps = await db.query(tableName, orderBy: 'createAt DESC');
    return List.generate(maps.length, (i) {
      return Note.fromMap(maps[i]);
    });
  }

// get note by id
  Future<Note> getNoteById(int id) async {
    final db = await _openDatabase();
    final maps = await db.query(tableName, where: 'id = ?', whereArgs: [id]);
    return Note.fromMap(maps.first);
  }

  // delete a note
  Future<int> deleteNote(int id) async {
    final db = await _openDatabase();
    return await db.delete(tableName, where: 'id =?', whereArgs: [id]);
  }

  // update a note
  Future<int> updateNoteByid(Note note) async {
    final db = await _openDatabase();
    return await db.update(
      tableName,
      note.toMap(),
      where: 'id =?',
      whereArgs: [note.id],
    );
  }
}

import 'package:resto_app_dicoding/data/models/restaurant_item_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaserService {
  static const String _databaseName = 'resto_app_dicoding.db';
  static const String _tableName = 'bookmark';
  static const int _version = 1;

  Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE $_tableName(
      id TEXT PRIMARY KEY,
      name TEXT,
      description TEXT,
      city TEXT,
      pictureId TEXT,
      rating REAL
     )
     """);
  }

  Future<Database> _initializeDb() async {
    return openDatabase(
      _databaseName,
      version: _version,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  Future<int> insertBookmark(RestaurantItem restaurant) async {
    final db = await _initializeDb();

    final id = await db.insert(
      _tableName,
      restaurant.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  Future<List<RestaurantItem>> getAllBookmarks() async {
    final db = await _initializeDb();
    final results = await db.query(_tableName);

    return results.map((result) => RestaurantItem.fromJson(result)).toList();
  }

  Future<RestaurantItem?> getBookmarkbyId(String id) async {
    final db = await _initializeDb();
    final results = await db.query(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
      limit: 1,
    );

    return results.isEmpty ? null : RestaurantItem.fromJson(results.first);
  }

  Future<int> removeBookmark(String id) async {
    final db = await _initializeDb();

    final result = await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    return result;
  }
}
